class DeliveredModel {
  bool? success;
  String? message;

  bool ?isDelivered;

  DeliveredModel({this.success, this.message,this.isDelivered});

  DeliveredModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    isDelivered=json['success']==true?true:false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}