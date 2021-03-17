import "package:flutter/material.dart";
import "package:shopi_attendant/widgets/ColouredTabBar.dart";
import "package:shopi_attendant/widgets/Commissions.dart";
import "package:shopi_attendant/services/order_repository.dart";
import "package:shopi_attendant/models/orders.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopi_attendant/widgets/SalesSummary.dart';

class Dashboard extends StatefulWidget{
  Dashboard({Key key}):super(key:key);

  @override
  DashboardState createState()=> DashboardState();
}

class DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin{
  TabController tabController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  OrderRepository orderRepository=new OrderRepository();
  Future<List<Orders>> future_orders;
  Future<String> future_update_service;

  @override
  void initState() {
    future_orders=this.getOrdersById('19');
    super.initState();
    tabController=new TabController(length: 3,vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Shopi Attendant"),
        centerTitle: true,
        bottom: ColoredTabBar(Colors.white,TabBar(
          unselectedLabelColor: Theme.of(context).primaryColor,
          labelColor: Colors.yellow,
          tabs: [
            new Tab(icon: new Icon(Icons.assignment,),child: Text('My Orders'),),
            new Tab(icon:new Icon(Icons.assessment_outlined),child: Text('Sales Summary'),),
            new Tab(icon: new Icon(Icons.assignment_turned_in),child: Text('Commissions'),),

          ],
          controller: tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),),
        bottomOpacity: 1,

        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: FutureBuilder(
                      future: future_orders,
                      builder: (context,snapshot){
                      if(snapshot.connectionState==ConnectionState.done && snapshot.hasData){
                        List<Orders> user_orders=snapshot.data;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child:  ListView.builder(
                            itemCount: user_orders.length,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height * 1/6,
                                  //       color: Colors.black,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(),
                                              child: Text("Order no: " + user_orders.elementAt(index).order_id,style: TextStyle(
                                                  color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600
                                              ),),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(),
                                              child: Text(user_orders.elementAt(index).order_date.substring(0,10),style: TextStyle(color: Theme.of(context).primaryColor),),
                                            )

                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Text(user_orders.elementAt(index).jobs.length.toString() + " Service(s)",style: TextStyle(color: Colors.black54),
                                        ),),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Text("Estimated time:2 hrs",style: TextStyle(color: Colors.black54),),
                                      ),
                                       user_orders.elementAt(index).status=='0' ?
                                       Padding(
                                         padding: EdgeInsets.symmetric(horizontal: 20.0),
                                         child: Text("Status:Waiting",style: TextStyle(color: Colors.black54),),
                                       )
                                      : user_orders.elementAt(index).status=="1" ?
                                       Padding(
                                         padding: EdgeInsets.symmetric(horizontal: 20.0),
                                         child: Text("Status:Completed",style: TextStyle(color: Theme.of(context).primaryColor),),
                                       ):
                                       user_orders.elementAt(index).status=="2" ?
                                       Padding(
                                         padding: EdgeInsets.symmetric(horizontal: 20.0),
                                         child: Text("Status:Not Completed",style: TextStyle(color: Colors.red),),
                                       ) : Container()
                                      ,

                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            OutlinedButton(
                                              child: Text("View Details",style: TextStyle(
                                                  color: Theme.of(context).primaryColor
                                              ),
                                              ),
                                              onPressed: (){
                                                localSheet(context,user_orders.elementAt(index));
                                              },
                                              style: OutlinedButton.styleFrom(
                                                  side: BorderSide(color: Theme.of(context).primaryColor)
                                              ),
                                            ),

                                            ElevatedButton(onPressed:(){},
                                              child: Text("Complete All",style: TextStyle(color: Colors.white),),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Theme.of(context).primaryColor,
                                                  onSurface: Colors.white
                                              ),
                                            ),
                                            ElevatedButton(onPressed:(){},
                                              child: Text("Transfer",style: TextStyle(color: Theme.of(context).primaryColor),),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.yellow,
                                                  onSurface: Colors.white
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                      Align(
                                        alignment: Alignment.bottomCenter,

                                        child:  Divider(),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }

                      else if(snapshot.hasError){
                        return Center(
                          child: Text("Error fetching data")
                        );
                      }

                      else if(snapshot.connectionState==ConnectionState.waiting){
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                          ),
                        );
                      }

                      else{
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                          ),
                        );
                      }
                      }
                    )
                  )
                ],
              ),
            )
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey.shade100,
            child: SalesSummary(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey.shade100,
            child: Commissions(),
          ),

        ],
      )
    );
  }

  void localSheet(context,Orders orders){
    /*_scrollListener() {
      if (scrollViewController.offset >=
          scrollViewController.position.maxScrollExtent &&
          !scrollViewController.position.outOfRange) {
        //      setState(() {
        message = "reach the bottom";
        _direction = true;
        //    });
      }
    }
    scrollViewController.addListener(_scrollListener);


    _moveUp() {
      scrollViewController.animateTo(scrollViewController.offset - 50,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    }

    _moveDown() {
      scrollViewController.animateTo(scrollViewController.offset + 50,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    }*/

   showModalBottomSheet(context: context,shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.vertical(top:Radius.circular(20.0))
   ),isScrollControlled: true,
       builder: (BuildContext context){
     //return Container();
      //   future_update_service=null;
         return StatefulBuilder(builder: (BuildContext context,updateState){
           return  Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height * 0.80,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20.0)
               ),
               child: SingleChildScrollView(

                   child:   Container(
                     width: MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height,
                     decoration: BoxDecoration(
                       color:Colors.white,
                       boxShadow: [
                         BoxShadow(
                             offset: const Offset(3.0,3.0)
                         )
                       ],
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),
                           topRight: Radius.circular(30.0)),
                     ), child: Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                               child: Text("Order: " + orders.order_id,style: TextStyle(color: Colors.black,fontSize: 18,
                                   fontWeight: FontWeight.w600),),
                             ),
                             Padding(
                               padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                               child: Text(orders.order_date.substring(0,10),style: TextStyle(color: Theme.of(context).primaryColor),),
                             )
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                         child: Text("Select the completed tasks below",style: TextStyle(color: Colors.black54),),
                       ),
                       Divider(),
                       Padding(
                         padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                         child: Container(
                           width: MediaQuery.of(context).size.width,
                           height: MediaQuery.of(context).size.height * 1/2,
                           child: ListView.builder(
                               itemCount: orders.jobs.length,
                               itemBuilder: (context,index){
                                 return ListTile(

                                   title: Text(orders.jobs.elementAt(index).service_name,style: TextStyle(color: Theme.of(context).primaryColor),),
                                   subtitle: Text("average time:  1hr 50 minutes",style: TextStyle(color: Colors.black54),),
                                   /*trailing: FutureBuilder(
                                     future: future_update_service,
                                     builder: (context,snapshot){
                                       if(!snapshot.hasData){
                                         return TextButton(
                                           onPressed: (){
                                             updateState(() {
                                               future_update_service=this.updateService("1", orders.jobs.elementAt(index).id.toString());
                                             });
                                           },
                                           child: Text("Complete",style: TextStyle(color: Colors.white),),
                                           style: TextButton.styleFrom(
                                               primary: Theme.of(context).primaryColor,
                                               backgroundColor: Theme.of(context).primaryColor,
                                               onSurface: Colors.white
                                           ),
                                         );
                                       }

                                       else if(snapshot.connectionState==ConnectionState.done && snapshot.hasData){
                                         String user_status=snapshot.data;
                                         if(user_status.contains('OK')){
                                           return Text("Done");
                                         }

                                         else if(user_status.contains("FAILED")){
                                           return Text("Unable to update");
                                         }
                                         else{
                                           return TextButton(
                                             onPressed: (){
                                               updateState(() {
                                                 future_update_service=this.updateService("1", orders.jobs.elementAt(index).id.toString());
                                               });
                                             },
                                             child: Text("Complete",style: TextStyle(color: Colors.white),),
                                             style: TextButton.styleFrom(
                                                 primary: Theme.of(context).primaryColor,
                                                 backgroundColor: Theme.of(context).primaryColor,
                                                 onSurface: Colors.white
                                             ),
                                           );
                                         }

                                       }

                                       else if(snapshot.connectionState==ConnectionState.waiting){
                                         return CircularProgressIndicator();

                                       }

                                       else if(snapshot.hasError){
                                         return Text("Error creating data snapshot");
                                       }

                                       else{
                                         return CircularProgressIndicator();

                                       }
                                     },
                                   ),*/
                                   onTap: (){

                                   }
                                 );
                               }),
                         ),
                       ),
                       Padding(
                           padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Padding(
                                 padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
                                 child: TextButton(
                                   onPressed: (){
                                  //   print('YES');
                                     setState(() async{
                                       await completeOrders("1", orders.order_id).then((value){
                                         if(value.contains("OK")){
                                           Fluttertoast.showToast(
                                               msg: "Order Completed successfully",
                                               toastLength: Toast.LENGTH_SHORT,
                                               gravity: ToastGravity.CENTER,
                                               timeInSecForIosWeb: 1,
                                               backgroundColor: Colors.black,
                                               textColor: Theme.of(context).primaryColor,
                                               fontSize: 16.0
                                           );
                                           Navigator.pop(context);
                                         }

                                         else if(value.contains("FAILED")){
                                           Fluttertoast.showToast(
                                               msg: "Error:Could not save order",
                                               toastLength: Toast.LENGTH_SHORT,
                                               gravity: ToastGravity.CENTER,
                                               timeInSecForIosWeb: 1,
                                               backgroundColor: Colors.black,
                                               textColor: Colors.red,
                                               fontSize: 16.0
                                           );

                                         }
                                       });
                                     });
                                   },
                                   child: Text('Complete All',style: TextStyle(color: Colors.white),),
                                   style: TextButton.styleFrom(
                                     primary: Theme.of(context).primaryColor,
                                     backgroundColor: Theme.of(context).primaryColor,
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
                                 child: OutlinedButton(
                                   onPressed: (){},
                                   child: Text('Cancel',style: TextStyle(color: Theme.of(context).primaryColor),),
                                   style: TextButton.styleFrom(
                                     primary: Theme.of(context).primaryColor,
                                     backgroundColor: Colors.white,
                                   ),
                                 ),
                               ),
                             ],
                           )
                       )
                     ],
                   ),
                   )
               )
           );
         }

         );
       }


   );
  }

  Future<String> updateService(String status,String id) async{
    String service_status=await orderRepository.updateService(status,id);
    return service_status;
  }

  Future<List<Orders>> getOrdersById(String id) async{
    List<Orders> orders=await orderRepository.fetchOrdersById(id);
    print(orders);
    return orders;
  }

  Future<String> completeOrders(String status,String bill_no) async{
    String order_status=await orderRepository.completeOrder(status, bill_no);
    return order_status;
  }

  /*Widget updateStatusWidget(String status,String id){
    return FutureBuilder(
      future: future_update_service,
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return TextButton(
            onPressed: (){
              setState(() {
                future_update_service=this.updateService(status, id);
              });
            },
            child: Text("Complete",style: TextStyle(color: Colors.white),),
            style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).primaryColor,
                onSurface: Colors.white
            ),
          );
        }

        else if(snapshot.connectionState==ConnectionState.done && snapshot.hasData){
          return Text("Done");
        }

        else if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        else if(snapshot.hasError){
          return Text("Error creating data snapshot");
        }

        else{
          return CircularProgressIndicator();
        }
      },
    );
  }*/


}