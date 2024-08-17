import 'dart:async';
import 'package:app1/screen/auth/logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app1/Bloc/cubit/chef/getOrder.dart';
import 'package:app1/Bloc/cubit/chef/startPreparing.dart';
import 'package:app1/Bloc/cubit/chef/endPreparing.dart';
import 'package:app1/Bloc/states/chef/getOrder.dart';
import 'package:app1/constant/ui/screen_constant.dart';
import 'package:app1/models/chef/getOrder.dart';

class ChefOrdersScreen extends StatefulWidget {
  @override
  _ChefOrdersScreenState createState() => _ChefOrdersScreenState();
}

class _ChefOrdersScreenState extends State<ChefOrdersScreen> {
  List<Data> orders = [];
  Map<int, Timer> timers = {}; // Map to track timers for each order
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetOrderChefCubit>(context).getOrders();
  }

  void _startTimer(Data order) {
    int totalSeconds = _parseTimeToSeconds(order.estimatedTime!);
    timers[order.hashCode]?.cancel(); // Cancel current timer if exists
    timers[order.hashCode] = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (totalSeconds > 0) {
          totalSeconds--;
          order.remainingTime = _formatSecondsToTime(totalSeconds);
        } else {
          timer.cancel();
          if (!order.isCompleted!) {
            setState(() {
              order.isDelayed = true;
            });
          }
        }
      });
    });
  }

  int _parseTimeToSeconds(String time) {
    final parts = time.split(':');
    final minutes = int.tryParse(parts[0]) ?? 0;
    final seconds = int.tryParse(parts[1]) ?? 0;
    return minutes * 60 + seconds;
  }

  String _formatSecondsToTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _markOrderAsCompleted(Data order) {
    timers[order.hashCode]?.cancel(); // Cancel timer on order completion
    setState(() {
      order.isCompleted = true;
      order.remainingTime = "00:00"; // Set remaining time to 00:00
      order.isDelayed = false;
      order.isPreparing = false;
      order.isTimerColorDefault = true;
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white.withOpacity(0.6),
        closeIconColor: Colors.white,
        content: Text(
          'Order for Table ${order.tableName} is ready!',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: greenColor1,
          ),
        ),
      ),
    );

    // استدعاء دالة endPreparing من EndPreparingCubit
    BlocProvider.of<EndPreparingCubit>(context).endPreparing(order_id: order.orderId!);
  }

  void _startPreparing(Data order) {
    // Call startPreparing method from StartPreparingCubit
    BlocProvider.of<StartPreparingCubit>(context).startPreparing(order_id: order.orderId!);
    setState(() {
      order.isPreparing = true;
      order.isTimerColorDefault = false;
      _startTimer(order); // Start timer for the order
    });
  }

  void _toggleOrderState(Data order) {
    if (order.isPreparing!) {
      _markOrderAsCompleted(order);
    } else {
      _startPreparing(order);
    }
  }

  Color _getTimerColor(Data order) {
    if (order.isTimerColorDefault == null || order.isTimerColorDefault!) {
      return greenColor1;
    } else {
      double timeRatio = _parseTimeToSeconds(order.remainingTime!) / _parseTimeToSeconds(order.estimatedTime!);
      Color startColor = greenColor1;
      Color endColor = Color(0xFFDF0000);
      return Color.lerp(endColor, startColor, timeRatio)!;
    }
  }

  Future<void> _refreshOrders() async {
    setState(() {
      _isRefreshing = true;
    });
    await BlocProvider.of<GetOrderChefCubit>(context).getOrders();
    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetOrderChefCubit, GetOrderChefStates>(
      listener: (context, state) {
        if (state is GetOrderChefSuccessState) {
          setState(() {
            orders = state.getOrderChefModel.data ?? [];
            for (var order in orders) {
              order.remainingTime = order.estimatedTime; // Set default remaining time
            }
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: defaultContainerAppbar(),
            title: Text(
              'Orders',
              style: TextStyle(color: greenColor1, fontSize: 24,
                fontWeight: FontWeight.bold,),
            ),
            centerTitle: true,
            actions: [
              PopupMenuButton<String>(
                color: greenColor1,
                icon: Icon(Icons.menu,color: greenColor1,),
                onSelected: (String result) {
                  if (result == 'logout') {
                    navigateTo(context, Logout());
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'logout',
                    child: Text('Logout',style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ],
          ),
          body: RefreshIndicator(
            backgroundColor: greenColor1,
            onRefresh: _refreshOrders,
            color: whiteColor,
            child: defaultContainerAppbar(
              child: state is GetOrderChefLoadingState
                  ? Center(
                child: CircularProgressIndicator(
                  color: greenColor2,
                ),
              )
                  : state is GetOrderChefSuccessState && orders.isEmpty
                  ? Center(
                child: Text(
                  "Don't have any orders yet!",
                  style: TextStyle(fontSize: 20, color: greenColor1),
                ),
              )
                  : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Table ${order.orderId}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: greenColor1,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              order.isExpanded ? Icons.expand_less : Icons.expand_more,
                              color: greenColor1,
                            ),
                            onPressed: () {
                              setState(() {
                                order.isExpanded = !order.isExpanded;
                              });
                            },
                          ),
                        ),
                        if (order.isExpanded)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Table(
                              border: TableBorder.all(
                                color: greenColor1,
                              ),
                              columnWidths: const {
                                0: FlexColumnWidth(2),
                                1: FlexColumnWidth(1),
                                2: FlexColumnWidth(3),
                              },
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Item',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: greenColor1,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Qty',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: greenColor1,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Note',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: greenColor1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ...order.meals!.map(
                                      (item) => TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item.item!,
                                          style: TextStyle(
                                            color: greenColor1,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item.qty.toString(),
                                          style: TextStyle(
                                            color: greenColor1,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item.note!,
                                          style: TextStyle(
                                            color: greenColor1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: order.isCompleted! ? Colors.grey : greenColor1,
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: order.isCompleted! ? null : () {
                                  _toggleOrderState(order);
                                },
                                child: Text(
                                  order.isPreparing! ? 'Done' : 'Start Preparing',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Text(
                                order.remainingTime ?? "00:00",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: _getTimerColor(order),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
