import "package:flutter/material.dart";
import "package:animations/animations.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:shopi_attendant/pages/Dashboard.dart";
import "package:shopi_attendant/services/user_repository.dart";
import "package:shopi_attendant/models/user.dart";
import "package:shopi_attendant/models/validation.dart";

class LoginPage extends StatefulWidget{
  LoginPage({Key key}):super(key:key);

  @override
  LoginPageState createState()=> LoginPageState();
}

class LoginPageState extends State<LoginPage>{
 bool _obsecure=true;
 String email,password;
 Validation validation=new Validation();
 TextEditingController emailController=new TextEditingController();
 TextEditingController passwordController=new TextEditingController();
 UserRepository userRepository=new UserRepository();
 final GlobalKey<FormState> _regissterFormKey=GlobalKey<FormState>();
 String error_message='';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.white,
      child:  Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey.shade100,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 1/15,horizontal: 30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1/2,
                    color: Theme.of(context).primaryColor,
                    child: Form(
                      key: _regissterFormKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 1/4,
                              color: Theme.of(context).primaryColor,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                                    child: Container(
                                      //          width: MediaQuery.of(context).size.width * 0.80,
                                      height: MediaQuery.of(context).size.height * 0.08,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                              "assets/images/logoshop.png",
                                            ),
                                          )
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                                    child:  RichText(
                                      text: TextSpan(
                                        text: 'ShopiLyv ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.2,
                                            fontSize: 25),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Attendant',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: GoogleFonts.lobster().fontFamily)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  //filled: true,
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  hintText: "Your email Address",
                                  labelText: "E-mail"),
                              controller: emailController,
                              validator: validation.emailValidator,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (String keyed) {
                                setState(() {
                                  email = keyed;
                                  print(email);
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              obscureText: _obsecure,
                              validator: validation.empty_field_validator,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.lock_open,
                                    color: Colors.white,
                                  ),
                                  border: UnderlineInputBorder(),
                                  hintText: "Password",
                                  labelText: "Password",
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obsecure = !_obsecure;
                                        });
                                      },
                                      child: Icon(
                                        _obsecure ? Icons.visibility : Icons.visibility_off,
                                        color: _obsecure ? Colors.white : Colors.red,
                                      ))),
                              onChanged: (String value) {
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: TextButton(onPressed:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>Dashboard()));
                                    /*if(!_regissterFormKey.currentState.validate()){
                                      email=emailController.text;
                                      password=passwordController.text;
                                       getUser(email, password).then((value){
                                         if(value.length > 0){
                                           Navigator.push(context,MaterialPageRoute(builder: (context)=>Dashboard()));
                                         }
                                         else{
                                           setState(() {
                                             error_message="The account does not exist";
                                           });
                                         }
                                       });
                                           }*/

                              },
                                child: Text("Sign in",style: TextStyle(color: Theme.of(context).primaryColor),),
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.white,
                                    onSurface: Theme.of(context).primaryColor,
                                    elevation: 5,
                                    //  side: BorderSide(),
                                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))
                                ),
                              ),
                            ),
                          ),
                          //RaisedButton()
                        ],
                      ),
                    )
                  )
              ),
            ],
          )
      ),
    );
  }

 Future<List<User>> getUser(String email,String password) async{
    List<User> users=await userRepository.fetchUserById(email, password);
    return users;
 }
}