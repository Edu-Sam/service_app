import "package:flutter/material.dart";
import "package:shopi_attendant/widgets/ColouredTabBar.dart";
import "package:shopi_attendant/widgets/Commissions.dart";

class Dashboard extends StatefulWidget{
  Dashboard({Key key}):super(key:key);

  @override
  DashboardState createState()=> DashboardState();
}

class DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin{
  TabController tabController;


  @override
  void initState() {

    super.initState();
    tabController=new TabController(length: 3,vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopi Attendant"),
        centerTitle: true,
        bottom: ColoredTabBar(Colors.white,TabBar(
          unselectedLabelColor: Theme.of(context).primaryColor,
          labelColor: Colors.yellow,
          tabs: [
            new Tab(icon: new Icon(Icons.assignment,),child: Text('My Orders'),),
            new Tab(icon: new Icon(Icons.assignment_turned_in),child: Text('Commissions'),),
            new Tab(icon:new Icon(Icons.assessment_outlined),child: Text('Sales Summary'),)
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child:  ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context,snapshot){
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
                                          child: Text("Order no:00001",style: TextStyle(
                                              color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600
                                          ),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(),
                                          child: Text("27/01/2021",style: TextStyle(color: Theme.of(context).primaryColor),),
                                        )

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Text("5 Services",style: TextStyle(color: Colors.black54),
                                  ),),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Text("Estimated time:2 hrs",style: TextStyle(color: Colors.black54),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Text("Status:Waiting",style: TextStyle(color: Colors.black54),),
                                  ),

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
                                            localSheet();
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
            child: Commissions(),
          ),
          Container()
        ],
      )
    );
  }

  void localSheet(){
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

    showModalBottomSheet(context: context,shape: CircleBorder(),isScrollControlled: true,
        builder: (BuildContext context){
          return StatefulBuilder(builder: (BuildContext context,updateState){
            return  Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.80,
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
                        child: Text("Order:0000001",style: TextStyle(color: Colors.black,fontSize: 18,
                            fontWeight: FontWeight.w600),),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                        child: Text("27/01/2021",style: TextStyle(color: Theme.of(context).primaryColor),),
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
                      itemCount: 10,
                      itemBuilder: (context,index){
                        return CheckboxListTile(value: true,
                          onChanged: null,
                          title: Text("Kinyozi",style: TextStyle(color: Theme.of(context).primaryColor),),
                          subtitle: Text("average time:  1hr 50 minutes",style: TextStyle(color: Colors.black54),),
                          checkColor: Theme.of(context).primaryColor,
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
                       onPressed: (){},
                       child: Text('Complete',style: TextStyle(color: Colors.white),),
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

}