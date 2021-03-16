
class Job{
  int id;
  String service_name;
  String service_amount;
  //String average_time;


  Job({this.service_name,this.service_amount});

  Map<String,dynamic> toJson()=>{
    'name':this.service_name,
    'price':this.service_amount,
  //  'average_time':this.average_time,
  };

  factory Job.fromJson(Map<String,dynamic> parsedJson){
    return Job(
      service_name: parsedJson["name"],
      service_amount:parsedJson["price"],
    //  average_time: parsedJson["average_time"],
    );
  }

}