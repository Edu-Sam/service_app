import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'dart:math';

class Commissions extends StatefulWidget{
  Commissions({Key key}):super(key:key);

  @override
  CommissionState createState()=> CommissionState();
}

class CommissionState extends State<Commissions>  with TickerProviderStateMixin {

  Animation arrow_animation;
  AnimationController arrow_animation_controller;
  bool commission_expanded=false;

  @override
  void initState() {
    super.initState();
    arrow_animation_controller=AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    arrow_animation=Tween(begin: 0.0,end:pi).animate(arrow_animation_controller);
    arrow_animation_controller.addStatusListener((status) {
      if(status==AnimationStatus.forward){
        setState(() {
          commission_expanded=true;
        });
      }

      else if(status==AnimationStatus.reverse){
        setState(() {
          commission_expanded=false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: MediaQuery.of(context).size.width,
              height: commission_expanded ?
              MediaQuery.of(context).size.height * 3/4 :
              MediaQuery.of(context).size.height * 1/5,
            //  color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1.0,1.0),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    color: Colors.black12
                  )
                ]
              ),
              child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
                    child: Row(
                      children: [

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                 //     mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.monetization_on,color:Theme.of(context).primaryColor,size: 60,),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ksh 24000",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 24),),
                              Text("Commmissions",style: TextStyle(color: Colors.black54,fontSize: 12),)
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0),
                      child: Column(
                        children: [
                          Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                                        child: Text("Ksh 25000",style: TextStyle(color: Theme.of(context).primaryColor),),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                                        child: Text("Sales",style: TextStyle(color: Colors.black54,fontSize: 12),),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                                        child: Text("20",style: TextStyle(color: Colors.amber),),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                                        child: Text("Customers Served",style: TextStyle(color: Colors.black54,
                                            fontSize: 12),),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                                        child: Text("100%",style: TextStyle(color:Colors.greenAccent),),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                                        child: Text("Orders Completed",style: TextStyle(color: Colors.black54,
                                            fontSize: 12),),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: MediaQuery.of(context).size.width,
                              height: commission_expanded ?  MediaQuery.of(context).size.height * 1/2 : 0,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height * 2/5,
                                      child: ListView.builder(
                                        itemCount: 10,
                                        itemBuilder: (context,index){
                                          return Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: MediaQuery.of(context).size.height * 1/10,
                                            child: Column(
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
                                        },
                                      ),
                                    ),
                                  ),
                                 /* Padding(
                                    padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                                    child: Row(
                                      children: [
                                        Text("Total:Ksh 24000",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16),)
                                      ],
                                    ),
                                  )*/
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                              child: AnimatedBuilder(
                                  animation: arrow_animation_controller,
                                  builder: (context,child)=>Transform.rotate(
                                    angle: arrow_animation.value,
                                    child:IconButton(icon: Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                                      onPressed: (){
                                        arrow_animation_controller.isCompleted ?
                                        arrow_animation_controller.reverse() :
                                        arrow_animation_controller.forward();
                                      },),
                                  )
                              )
                          ),
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}