import 'package:app1/Bloc/cubit/waiter/delivered.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import '../constant/ui/screen_constant.dart';
import 'package:app1/Bloc/cubit/waiter/getOrder.dart';
import 'package:app1/Bloc/states/waiter/getOrder.dart';

class Order {
  final int orderNumber;
  final int tableNumber;
  bool isDelivered;

  Order({
    required this.orderNumber,
    required this.tableNumber,
    this.isDelivered = false,
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

  void _markAsDelivered(Order order) {

    // Call delivered function from DeliveredCubit with order_id
    // Assuming delivered function exists in DeliveredCubit
    DeliveredCubit.get(context).delivered(order_id: order.orderNumber);
    // Update local UI state (optional)
    setState(() {
      order.isDelivered = true;
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
      body: RefreshIndicator(
        backgroundColor: greenColor1,
        onRefresh: _refreshOrders,
        color: whiteColor,
        child: defaultContainerAppbar(
          child: BlocBuilder<GetOrderWaiterCubit, GetOrderWaiterStates>(
            builder: (context, state) {
              if (state is GetOrderWaiterLoadingState) {
                return Center(child: CircularProgressIndicator(
                  color: greenColor2,
                ));
              } else
                if (state is GetOrderWaiterSuccessState) {

                orders = state.getOrderWaiterModel.data!
                    .map((data) => Order(
                  orderNumber: data.orderId!,
                  tableNumber: data.orderId!, // Assuming tableName is an integer in string format
                ))
                    .toList();

                return ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];

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
                                primary: order.isDelivered
                                    ? Colors.grey
                                    : greenColor1,
                              ),
                              onPressed: order.isDelivered
                                  ? null
                                  : () {
                                _markAsDelivered(order);
                              },
                              child:
                              Text(order.isDelivered ? 'Delivered' : 'Done'),
                            ),


                          ),
                        ],
                      ),
                    );
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
