import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

//firebase initilizser

//firebase auth instance
FirebaseAuth firebaseAuthInstance=FirebaseAuth.instance;

initFirebase()async{
  await Firebase.initializeApp();
}

const String apiurl= "https://jsonplaceholder.typicode.com/posts";