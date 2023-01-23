
import 'package:buuilderapp/Pages/LoginPage/login_page.dart';
import 'package:buuilderapp/dashboard.dart';
import 'package:buuilderapp/global_constants.dart';
import 'package:buuilderapp/Pages/onclick_pages/home_page.dart';
import 'package:buuilderapp/widgets/circular_indicator.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formkey= GlobalKey<FormState>(); 
  
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  TextEditingController contactnumberController=TextEditingController();

  bool isLoading = false;
  ValueNotifier<bool> isSignUpSubmit=ValueNotifier(false);

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
                  height: 550,
                  width: 330,
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
                                "Sign Up",
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
                               Text("Already have an account?"),
                               SizedBox(width: 10,),
                               InkWell(
                                 onTap: () async{
                                   setState(() {
                                     isLoading=true;
                                   });
                                   await Future.delayed(const Duration(seconds:2));
                                   setState(() {
                                     isLoading=false;
                                   });
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                 },
                                 child:
                                 (isLoading)? const SizedBox(height: 16,width: 16,child: CircularProgressIndicator(
                                   color: Colors.black,strokeWidth: 1.5,
                                 ),)
                                  :Text("Log in",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
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
                        controller: emailController,
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
SizedBox(height: 30,),
                      
                      TextFormField(
                        autocorrect: false,
                        autofocus: false,
                        obscureText: false,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        controller: passwordController,
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
SizedBox(height: 30,),
                   // confirm password
                       TextFormField(
                         autocorrect: false,
                         autofocus: false,
                         obscureText: false,
                         style: TextStyle(
                           fontSize: 18,
                         ),
                         controller: confirmpasswordController,
                         decoration: InputDecoration(
                           hintText: 'Confirm Password',
                           border: InputBorder.none,
                           filled: true,
                           fillColor: Colors.grey[200],
                           contentPadding: EdgeInsets.all(10.0),
                           suffixIcon:IconButton(onPressed: (){
                             

                           },
                            icon: Icon(Icons.remove_red_eye, color: Colors.black,), 
                           ) 
                         ),
                         validator: (value) {
                           if(value!=passwordController.text){
                            return "Password didn't matched";
                           }
                         },
                        
                       ),
SizedBox(height: 30,),
                      //phone number
                     TextFormField(
                       autocorrect: false,
                       autofocus: false,
                       obscureText: false,
                       style: TextStyle(
                         fontSize: 18,
                       ),
                       controller: contactnumberController,
                       decoration: InputDecoration(
                         hintText: 'Contact Number',
                         border: InputBorder.none,
                         filled: true,
                         fillColor: Colors.grey[200],
                         contentPadding: EdgeInsets.all(10.0),
                         suffixIcon:IconButton(onPressed: (){
                           

                         },
                          icon: Icon(Icons.phone_android_rounded, color: Colors.black,), 
                         ) 
                       ),
                      
                     ),

SizedBox(height: 10,),
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
                        height:3,
                      ),

                      
                      ValueListenableBuilder(
                        valueListenable:isSignUpSubmit,
                        builder: (context,value, child) {
                          return MaterialButton(
                            onPressed: () {
                              if(!isSignUpSubmit.value){
                              signupSubmit();
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
                                  
                                  'SignUp',
                                  style: TextStyle(
                                    
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  
                                ),

                                isSignUpSubmit.value?const CircularIndicator():const SizedBox(),
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



signupSubmit() async {
    if(formkey.currentState!.validate()){
      isSignUpSubmit.value=true;      
     try{
      UserCredential userCredential = await firebaseAuthInstance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      //UserCredential userCredential = await firebaseAuthInstance.signInWithEmailAndPassword(email: emailCtrl.text, password:PasswordCtrl.text,);
      if(userCredential.user!.uid.isNotEmpty){
        isSignUpSubmit.value=false;
      }
     } on FirebaseAuthException catch(e, s){
        isSignUpSubmit.value=false;
        print("error:$e, stacktrace: $s");
     } 
     
    }
  }
}


//   signupSubmit() async {
//      verifyPhone();
//     // if(formkey.currentState!.validate()){
//     //   isSignUpSubmit.value=true; 

//     //  try{
     
//     //   // UserCredential userCredential = await firebaseAuthInstance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text,);
//     //   // // PhoneAuthCredential phoneAuthCredential=await PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode)
//     //   // //UserCredential userCredential = await firebaseAuthInstance.signInWithEmailAndPassword(email: emailCtrl.text, password:PasswordCtrl.text,);
//     //   // if(userCredential.user!.uid.isNotEmpty){
//     //   //   isSignUpSubmit.value=false;
//     //   // }
//     //  } on FirebaseAuthException catch(e, s){
//     //     isSignUpSubmit.value=false;
//     //     print("error:$e, stacktrace: $s");
//     //  } 
//     }
  


//   verifyPhone(){
//     firebaseAuthInstance.verifyPhoneNumber(
//       phoneNumber: contactnumberController.text.trim(),
//       verificationCompleted: ((phoneAuthCredential) {
//         print(phoneAuthCredential.smsCode);
//       }),
//        verificationFailed: ((error) {
//          print(error);
//        }), 
//        codeSent: ((verificationId, forceResendingToken) {
//          print(verificationId);
//          print(forceResendingToken);
//        }), 
//         codeAutoRetrievalTimeout: ((verificationId) {
         
//        }));
//   }
// }





// import 'package:buuilderapp/global_constants.dart';
// import 'package:buuilderapp/home_page.dart';
// import 'package:buuilderapp/widgets/circular_indicator.dart';
// import 'package:drop_shadow/drop_shadow.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';


// class CreateAccount extends StatefulWidget {
//   const CreateAccount({ Key? key }) : super(key: key);

//   @override
//   State<CreateAccount> createState() => _CreateAccountState();
// }

// class _CreateAccountState extends State<CreateAccount> {

//   final formkey=GlobalKey<FormState>();

//   TextEditingController emailController=TextEditingController();
//   TextEditingController passwordController=TextEditingController();

//   // String dropdownValue='Employee';
//   // var items=[
//   // 'Admin',
//   // 'Employee',
//   // ];

//  bool isLoading=false;
// ValueNotifier<bool>isSignUpSubmit=ValueNotifier(false);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 41, 60, 75),
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
         
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//                 child: DropShadow(
//                   blurRadius: 5,
//                   borderRadius: 5,
//                   opacity: 0.3,
//                   spread: 0.1,
//                   child: Image.asset('assets/images/mistri_logo.png',color: Colors.white70,
//                   height: 50,
//                   width: 70,
//                   ),
//                 ),
//               ),
             
//               SizedBox(height: 5,),


//               //form part

//                Form(
//                  child: Container(
//                  height: 550,
//                  width: 330,
//                  padding: EdgeInsets.symmetric(
//                    horizontal: 30,
//                    vertical: 25,
//                  ),
//                  decoration: BoxDecoration(
//                    color: Colors.white,
//                    borderRadius: BorderRadius.circular(20),
//                    shape: BoxShape.rectangle,
//                  ),
//                  child: Column(
               
                   
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
               
//                      Container(
//                        child: Column(
//                          children: [
//                            Text("Create Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),),
//                            SizedBox(height: 20,),
//                            Row(
//                              children: [
//                                Text("Already have an account?"),
//                                SizedBox(width: 10,),
//                                InkWell(
//                                  onTap: () async{
//                                    setState(() {
//                                      isLoading=true;
//                                    });
//                                    await Future.delayed(const Duration(seconds:2));
//                                    setState(() {
//                                      isLoading=false;
//                                    });
//                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
//                                  },
//                                  child:
//                                  (isLoading)? const SizedBox(height: 16,width: 16,child: CircularProgressIndicator(
//                                    color: Colors.black,strokeWidth: 1.5,
//                                  ),)
//                                   :Text("Log in",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),))
//                              ],
//                            )
//                          ],
//                        ),
//                      ),
//                      SizedBox(height: 15,),


//               //  //dropdownmenu
//               //        Column(
//               //      children: [
//               //        DropdownButton(
//               //          dropdownColor: Colors.grey[200],
//               //      value:dropdownValue ,
//               //      icon: Icon(Icons.keyboard_arrow_down),
//               //          items: items.map((String items){
//               //            return DropdownMenuItem(
//               //              child: Text(items),
//               //              value: items,
//               //              );
//               //          }).toList(),
//               //         onChanged: (String? newValue){
//               //          setState(() {
//               //            dropdownValue=newValue!;
//               //          });
//               //         }
                      
//               //         )
//               //      ],
//               //        ),
               
//                      SizedBox(height: 7,),


//                      TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                        autocorrect: false,
//                        autofocus: false,
//                        style: TextStyle(
//                          fontSize: 18,
//                        ),
//                        controller: emailController,
//                        decoration: InputDecoration(
//                          hintText: 'Email',
//                          border: InputBorder.none,
//                          filled: true,
//                          fillColor: Colors.grey[200],
//                          contentPadding: EdgeInsets.all(10.0),
//                        ),
//                        validator: (value) {
//                           if(value!.isEmpty){
//                             return "Email is required";
//                           }
//                           bool emailValid =  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
//                           if(!emailValid){
//                             return "Invalid email address";
//                           }
//                         },
//                      ),
               
//                      SizedBox(height: 15,),

//                      Padding(
//                        padding: EdgeInsets.symmetric(
//                          vertical:25,
//                        ),
//                        child: TextFormField(
//                        autocorrect: false,
//                        autofocus: false,
//                        obscureText: false,
//                        style: TextStyle(
//                          fontSize: 18,
//                        ),
//                        controller: passwordController,
                       
//                        decoration: InputDecoration(
//                          hintText: 'Password',
//                          border: InputBorder.none,
//                          filled: true,
//                          fillColor: Colors.grey[200],
//                          contentPadding: EdgeInsets.all(10.0),

//                           suffixIcon:IconButton(onPressed: (){
                              

//                             },
//                              icon: Icon(Icons.remove_red_eye, color: Colors.black,), 
//                             ) 
//                        ),
//                         validator: (value){
//                             if(value!.isEmpty){
//                               return "Password is required";
//                             }
//                             if(value.length<=5){
//                               return "Password must be greater than 5";
//                             }
//                           },
//                      ),
//                     ),
               
//                     // Padding(
//                     //    padding: EdgeInsets.symmetric(
//                     //      vertical:15,
//                     //    ),
//                     //    child: TextFormField(
//                     //    autocorrect: false,
//                     //    autofocus: false,
//                     //    obscureText: false,
//                     //    style: TextStyle(
//                     //      fontSize: 18,
//                     //    ),
//                     //    decoration: InputDecoration(
//                     //      hintText: 'Confirm Password',
//                     //      border: InputBorder.none,
//                     //      filled: true,
//                     //      fillColor: Colors.grey[200],
//                     //      contentPadding: EdgeInsets.all(10.0),
//                     //    ),
//                     //  ),
//                     // ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           'Forget Password',
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontSize: 14,
//                             fontFamily: 'Lobster'
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5,),

//                    ValueListenableBuilder(
//                         valueListenable:isSignUpSubmit,
//                         builder: (context,value, child) {
//                           return MaterialButton(
//                             onPressed: () {
//                               if(!isSignUpSubmit.value){
//                              signupSubmit();
//                               }
//                             },
//                             minWidth: 250,
//                             splashColor: Colors.green,
//                             color: Colors.green,
//                             padding: EdgeInsets.symmetric(
//                               vertical: 12,
//                             ),
//                             child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'SignUp',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                   ),
                                  
//                                 ),

//                                 isSignUpSubmit.value?const CircularIndicator():const SizedBox(),
//                               ],
//                             ),
//                           );
//                         }
//                       ),


//                    ],
//                  ),
//                  ),
//                ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// signupSubmit() async {
//     if(formkey.currentState!.validate()){
//       isSignUpSubmit.value=true;      
//      try{
//       // UserCredential userCredential = await isSignUpSubmit.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
//       UserCredential userCredential = await firebaseAuthInstance.createUserWithEmailAndPassword(email: emailController.text, password:passwordController.text,);
//       if(userCredential.user!.uid.isNotEmpty){
//         isSignUpSubmit.value=false;
//       }
//      } on FirebaseAuthException catch(e, s){
//         isSignUpSubmit.value=false;
//         print("error:$e, stacktrace: $s");
//      } 
     
//     }
//   }
// }