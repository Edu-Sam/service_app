
class Job{
  int id;
  String service_name;
  String service_amount;
  int status;
  //String average_time;


  Job({this.id,this.service_name,this.service_amount,this.status});

  Map<String,dynamic> toJson()=>{
    'name':this.service_name,
    'price':this.service_amount,
    'status':this.status.toString()
  //  'average_time':this.average_time,
  };

  factory Job.fromJson(Map<String,dynamic> parsedJson){
    return Job(
      id: int.parse(parsedJson['new_id']),
      service_name: parsedJson["name"],
      service_amount:parsedJson["price"],
      status:int.parse(parsedJson['status'])
    //  average_time: parsedJson["average_time"],
    );
  }

}