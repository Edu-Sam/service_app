import "package:flutter/material.dart";

class SalesSummary extends StatefulWidget{
  SalesSummary({Key key}):super(key:key);

  @override
  SalesSummaryState createState()=> SalesSummaryState();
}

class SalesSummaryState extends State<SalesSummary>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
             Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height,
               child:  ListView.builder(
                   itemCount: 10,
                   itemBuilder: (context,index){
                     return Container(
                       width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height * 1/8,
                       color: Colors.white,
                       child:Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                               padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text("Kinyozi",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,
                                       fontSize: 15),),
                                   Text("21/02/2021",style: TextStyle(color: Colors.black54,fontSize: 13,
                                   ),)
                                 ],
                               )
                           ),
                           Padding(
                             padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                             child: Text("Average time: 30 minutes",style: TextStyle(color: Colors.black54,
                                 fontSize: 13),),
                           ),
                           Padding(
                             padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                             child: Text("Commission: sh 200",style: TextStyle(color: Colors.black54,fontSize: 13),),
                           ),
                           Padding(
                             padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Padding(
                                   padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                                   child: Row(
                                     children: [
                                       Text("Status:",style: TextStyle(color: Colors.black54,fontSize: 13),),
                                       Text("Completed",style: TextStyle(color: Theme.of(context).primaryColor,
                                           fontSize: 13),)
                                     ],
                                   ),
                                 ),

                                 Padding(
                                   padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                                   child: Icon(Icons.check_circle_outline,color: Theme.of(context).primaryColor,),
                                 )
                               ],
                             ),
                           ),
                           Divider()
                         ],
                       ),
                     );
                   }),
             )
          ],
        ),
      )
    );
  }
}