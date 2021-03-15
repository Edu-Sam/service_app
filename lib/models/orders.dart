import 'services.dart';
class Orders{
  int id;
  String order_id;
  String order_date;
  List<Service> services;
  String status;

  Orders({this.order_id,this.order_date,this.services,this.status});

  Map<String,dynamic> toJson()=>{
    'order_id':this.order_id,
    'order_date':this.order_date,
    'status':this.status,
    'services':List<dynamic>.from(services.map((x)=>x.toJson()))
  };

  factory Orders.fromJson(Map<String,dynamic> parsedJson){
    List<Service> user_services;
    if(parsedJson["services"]!=null){
      user_services=parsedJson["services"].map((x)=> Orders.fromJson(x));
    }

    else{
      user_services=[];
    }
    return Orders(
      order_id: parsedJson['orders_id'],
      order_date: parsedJson['order_date'],
      status: parsedJson['status'],
      services: user_services
    );
  }
}