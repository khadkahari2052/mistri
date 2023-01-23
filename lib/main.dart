import 'package:buuilderapp/Pages/onclick_pages/home_page.dart';
import 'package:buuilderapp/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'global_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 700),
      splitScreenMode: true,
      minTextAdapt: false,
      useInheritedMediaQuery: false,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            textTheme: TextTheme(
              button: TextStyle(
                //here when we declare fontsize on theme data then font size on our app will be this until we declare fontsize manually
                fontSize: 20.sp
              ),

            )
          ),
          debugShowCheckedModeBanner: false, home: SplashScreen());
      }
    );
  }
}



class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    aftersplash();
  }

  aftersplash() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(PageTransition(
          duration: Duration(milliseconds: 900),
          child: Dashboard(),
          type: PageTransitionType.fade));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 221, 221),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.w,
              height: 200.h,
              child: Image.asset('assets/images/mistri_logo.png'),
            ),
             SizedBox(
              height: 30.h,
            ),
            Container(
              width: 300.w,
              height: 40.h,
              
              child:  Center(
                  child: Text(
                'Mistri Welcomes You',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp,color: Color.fromARGB(255, 27, 78, 119),),
              )),
            ),
        
          ],
        ),
      ),
    );
  }
}


// import 'package:buuilderapp/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main(){
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//      return ScreenUtilInit(
//       designSize: const Size(360, 690),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context , child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'First Method',
//           // You can use the library anywhere in the app even in theme
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//             textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
//           ),
      
//       home: HomePage(),
//     );
//   });
// }
// }
