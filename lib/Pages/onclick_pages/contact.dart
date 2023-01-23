import 'package:buuilderapp/Pages/LoginPage/login_page.dart';
import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({ Key? key }) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       
        backgroundColor:Color.fromARGB(255, 27, 78, 119),
        body: ContactUs(
         
          logo: AssetImage('assets/images/harikhadka.jpg'),
          email: 'jungy19khadka@gmail.com',
          companyName: 'Hari Jung Khadka',
          phoneNumber: '9779849562425',
          dividerThickness: 2,
          website: 'https://www.google.com/',
          githubUserName: 'AbhishekDoshi26',
          linkedinURL: 'https://www.linkedin.com/in/abhishek-doshi-520983199/',
          tagLine: 'Flutter Developer',
          twitterHandle: 'Hari Jung Khadka', cardColor: Colors.white70, companyColor: Colors.white, taglineColor: Colors.white, textColor: Color.fromARGB(255, 27, 78, 119),
         
        ),
      );
    
  }
}