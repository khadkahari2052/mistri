import 'package:buuilderapp/Pages/LoginPage/create_account.dart';
import 'package:buuilderapp/dashboard.dart';
import 'package:buuilderapp/global_constants.dart';
import 'package:buuilderapp/Pages/onclick_pages/home_page.dart';
import 'package:buuilderapp/widgets/circular_indicator.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey= GlobalKey<FormState>(); 
  
  TextEditingController emailCtrl= TextEditingController();
  TextEditingController PasswordCtrl= TextEditingController();

  bool isLoading = false;
  ValueNotifier<bool> isFormSubmit=ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 41, 60, 75),
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
       
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: DropShadow(
                  blurRadius: 5,
                  borderRadius: 5,
                  opacity: 0.3,
                  spread: 0.1,
                  child: Image.asset(
                    'assets/images/mistri_logo.png',color: Colors.white70,
                    fit: BoxFit.fill,
                    height: 50,
                    width: 70,
                  ),
                ),
              ),
            
              SizedBox(
                height: 5,
              ),

              
              Form(
                key:formkey,
                child: Container(
                  height: 400,
                  width: 320,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 25,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Dashboard()));
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.black,
                                  )),
                              Text(
                                "Log In",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text("Don't have an account?"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                      onTap: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        await Future.delayed(
                                            const Duration(seconds: 2));
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreateAccount()));
                                      },
                                      child: (isLoading)
                                          ? const SizedBox(
                                              height: 16,
                                              width: 16,
                                              child:
                                                  CircularProgressIndicator(
                                                color: Colors.blue,
                                                strokeWidth: 1.5,
                                              ),
                                            )
                                          : Text(
                                              "Create Account",
                                              style: TextStyle(
                                                fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                            )
                                            )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),


                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        autofocus: false,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        controller: emailCtrl,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Email is required";
                          }
                          bool emailValid =  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                          if(!emailValid){
                            return "Invalid email address";
                          }
                        },
                      ),

                      
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 25,
                        ),
                        child: TextFormField(
                          autocorrect: false,
                          autofocus: false,
                          obscureText: false,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          controller: PasswordCtrl,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(10.0),
                            suffixIcon:IconButton(onPressed: (){
                              

                            },
                             icon: Icon(Icons.remove_red_eye, color: Colors.black,), 
                            ) 
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Password is required";
                            }
                            if(value.length<=5){
                              return "Password must be greater than 5";
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forget Password',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontFamily: 'Lobster',
                              
                            ),
                            
                          ),
                        ],
                      ),
                      SizedBox(
                        height:1,
                      ),

                      
                      ValueListenableBuilder(
                        valueListenable:isFormSubmit,
                        builder: (context,value, child) {
                          return MaterialButton(
                            onPressed: () {
                              if(!isFormSubmit.value){
                              formSubmit();
                              }
                            },
                            minWidth: 250,
                            splashColor: Colors.green,
                            color: Colors.green,
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  
                                  'Login',
                                  style: TextStyle(
                                    
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  
                                ),

                                isFormSubmit.value?const CircularIndicator():const SizedBox(),
                              ],
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  formSubmit() async {
    if(formkey.currentState!.validate()){
      isFormSubmit.value=true;      
     try{
      UserCredential userCredential = await firebaseAuthInstance.createUserWithEmailAndPassword(email: emailCtrl.text, password: PasswordCtrl.text);
      //UserCredential userCredential = await firebaseAuthInstance.signInWithEmailAndPassword(email: emailCtrl.text, password:PasswordCtrl.text,);
      if(userCredential.user!.uid.isNotEmpty){
        isFormSubmit.value=false;
      }
     } on FirebaseAuthException catch(e, s){
        isFormSubmit.value=false;
        print("error:$e, stacktrace: $s");
     } 
     
    }
  }
}
