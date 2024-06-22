

class GetOrderChefModel {
  bool? success;
  String? message;
  List<Data>? data;

  GetOrderChefModel({this.success, this.message, this.data});

  GetOrderChefModel.fromJson(Map<String, dynamic> json) {
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
  List<Meals>? meals;
  bool isExpanded;
  String? remainingTime;
  bool ? isCompleted;
  bool ? isDelayed;
  bool ? isPreparing;
  bool ? isTimerColorDefault;

  Data({
    this.orderId,
    this.tableName,
    this.estimatedTime,
    this.status,
    this.meals,
    this.isExpanded = false,
    this.remainingTime = "5",
    this.isCompleted = false,
    this.isDelayed = false,
    this.isPreparing = false,
    this.isTimerColorDefault = true,
  });

  Data.fromJson(Map<String, dynamic> json)
      : isExpanded = false,
        remainingTime = "5",
        isCompleted = false,
        isDelayed = false,
        isPreparing = false,
        isTimerColorDefault = true {
    orderId = json['order_id'];
    tableName = json['table_name'];
    estimatedTime = json['estimated_time'];
    status = json['status'];
    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add(Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['table_name'] = this.tableName;
    data['estimated_time'] = this.estimatedTime;
    data['status'] = this.status;
    if (this.meals != null) {
      data['meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  int? orderDetailId;
  String? item;
  int? qty;
  String? note;

  Meals({
    this.orderDetailId,
    this.item,
    this.qty,
    this.note,
  });

  Meals.fromJson(Map<String, dynamic> json) {
    orderDetailId = json['order_detail_id'];
    item = json['item'];
    qty = json['qty'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_detail_id'] = this.orderDetailId;
    data['item'] = this.item;
    data['qty'] = this.qty;
    data['note'] = this.note;
    return data;
  }
}
