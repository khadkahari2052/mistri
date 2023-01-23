import 'package:dio/dio.dart';

class ApiServices{
//initiated ->dio package;
Dio dio = Dio();

//get-> method 
 Future<Response> getMethod(String path) async{
  Response ? api_resonse;
  try{
   var response = await dio.get(path);
   api_resonse=response;

  }  on  DioError catch(e){
      print({"error: $e"});
      api_resonse=e.response;
    }
     return api_resonse!;
  }
 
}