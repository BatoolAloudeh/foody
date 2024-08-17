import 'package:app1/Bloc/cubit/waiter/delivered.dart';
import 'package:app1/models/waiter/getOrder.dart';
import 'package:app1/screen/auth/logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import '../constant/ui/screen_constant.dart';
import 'package:app1/Bloc/cubit/waiter/getOrder.dart';
import 'package:app1/Bloc/states/waiter/getOrder.dart';

class Order {
  final int orderNumber;
  final int tableNumber;

  Order({
    required this.orderNumber,
    required this.tableNumber,
  });
}

class WaiterOrdersScreen extends StatefulWidget {
  @override
  _WaiterOrdersScreenState createState() => _WaiterOrdersScreenState();
}

class _WaiterOrdersScreenState extends State<WaiterOrdersScreen> {
  List<Order> orders = [];
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetOrderWaiterCubit>(context).getOrders();
  }

  Future<void> _refreshOrders() async {
    setState(() {
      _isRefreshing = true;
    });
    await BlocProvider.of<GetOrderWaiterCubit>(context).getOrders();
    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: defaultContainerAppbar(),
        title: Text(
          'Orders',
          style: TextStyle(
            color: greenColor1,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            color: greenColor1,
            icon: Icon(
              Icons.menu,
              color: greenColor1,
            ),
            onSelected: (String result) {
              if (result == 'logout') {
                navigateTo(context, Logout());
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
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
          child: BlocBuilder<GetOrderWaiterCubit, GetOrderWaiterStates>(
            builder: (context, state) {
              if (state is GetOrderWaiterLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: greenColor2,
                  ),
                );
              } else if (state is GetOrderWaiterSuccessState) {
                orders = state.getOrderWaiterModel.data!
                    .map((data) => Order(
                  orderNumber: data.orderId!,
                  tableNumber: data.orderId!,
                ))
                    .toList();

                if (orders.isEmpty) {
                  return Center(
                    child: Text(
                      "Don't have any orders yet!",
                      style: TextStyle(fontSize: 20, color: greenColor1),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return OrderCard(order: order);
                  },
                );
              } else if (state is GetOrderWaiterErrorState) {
                return Center(
                  child: Text('Error: ${state.error}'),
                );
              } else {
                return Center(
                  child: Text('Unknown state'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatefulWidget {
  final Order order;

  OrderCard({required this.order});

  @override
  State<StatefulWidget> createState() {
    return OrderCardState(order: order);
  }
}

class OrderCardState extends State<OrderCard> {
  final Order order;

  OrderCardState({required this.order});
  bool isDelivered = false;

  void _markAsDelivered(Order order) {
    DeliveredCubit.get(context).delivered(order_id: order.orderNumber);
    setState(() {
      isDelivered = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: whiteColor.withOpacity(0.6),
        content: Text(
          'Order ${order.orderNumber} for Table ${order.tableNumber} has been delivered!',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: greenColor1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor.withOpacity(0.3),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Order ${order.orderNumber}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Satisfy-Regular',
                color: greenColor,
              ),
            ),
            subtitle: Text(
              'Table ${order.tableNumber}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                fontFamily: 'Satisfy-Regular',
                color: greenColor,
              ),
            ),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDelivered ? Colors.grey : greenColor1,
              ),
              onPressed: isDelivered
                  ? null
                  : () {
                _markAsDelivered(order);
              },
              child: Text(
                isDelivered ? 'Delivered' : 'Done',
                style: TextStyle(color: whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





