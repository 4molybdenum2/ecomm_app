//import 'package:shared_preferences/shared_preferences.dart';
//
//class firstcheck{
//  void userset(String name) async {
//
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      prefs.setString('prevUser', name);
//
//  }
//
//  Future<bool> userexists() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String curr = prefs.get('prevUser');
//    if(curr==null){
//      return false;
//    }
//    else{
//      return true;
//    }
//  }
//
//  Future<String> existingname() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String curr = prefs.get('prevUser');
//    return curr;
//  }
//
//
//}