import 'package:shared_preferences/shared_preferences.dart';

class SaveData{
  bool status = false;
  void setSaveData(bool logged) async{
    SharedPreferences save = await SharedPreferences.getInstance();
    await save.setBool("loggedIn", logged);
    
  }
 getSaveData()async{
    SharedPreferences save = await  SharedPreferences.getInstance();
    bool loggedInStatus = save.getBool("loggedIn");
    if(loggedInStatus == null){
      this.status = false;
    }
    else{
      this.status = loggedInStatus;
    }
   // print("${status} ye h status");
    }

   void removeData(String str)async{
     SharedPreferences save  = await SharedPreferences.getInstance();
     await save.remove(str);

  }



}