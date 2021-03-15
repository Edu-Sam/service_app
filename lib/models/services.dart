
class Service{
  int id;
  String service_name;
  String service_amount;
  String average_time;


  Service({this.service_name,this.service_amount,this.average_time});

  Map<String,dynamic> toJson()=>{
    'service_name':this.service_name,
    'service_amount':this.service_amount,
    'average_time':this.average_time,
  };

  factory Service.fromJson(Map<String,dynamic> parsedJson){
    return Service(
      service_name: parsedJson["service_name"],
      service_amount:parsedJson["service_amount"],
      average_time: parsedJson["average_time"],
    );
  }

}