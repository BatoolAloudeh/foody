class GetOrderWaiterModel {
  bool? success;
  String? message;
  List<Data>? data;

  GetOrderWaiterModel({this.success, this.message, this.data});

  GetOrderWaiterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? orderId;
  String? tableName;
  String? estimatedTime;
  int? status;
  bool ? isDelivered;


  Data({this.orderId, this.tableName, this.estimatedTime, this.status,this.isDelivered = false,});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    tableName = json['table_name'];
    estimatedTime = json['estimated_time'];
    status = json['status'];
    isDelivered = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['table_name'] = this.tableName;
    data['estimated_time'] = this.estimatedTime;
    data['status'] = this.status;
    return data;
  }
}