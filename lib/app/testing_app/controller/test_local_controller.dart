import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TestLocalController extends GetxController {


  final getStorage = GetStorage();

 // RxString language = RxString("ENGLISH");

  late Locale mLocale;

  TestLocalController(){
    addToLocale();
    print("selected language is ${getStorage.read("language")}");


}
  final List locale =[
    {'name':'ENGLISH','locale': Locale('en','US')},
    {'name':'ಕನ್ನಡ','locale': Locale('kn','IN')},
    {'name':'हिंदी','locale': Locale('hi','IN')},
  ];


  updateLanguage(Locale mm,lang) async{
    Get.back();


   await getStorage.write("language", lang);

   addToLocale();
    Get.updateLocale(mLocale);
  }

  addToLocale() {

    if(getStorage.read("language") ==null) {

      print("error on null");
      return mLocale = locale[0]["locale"];
    }
     else {

       for(var test in locale) {
         print("here we go ${getStorage.read("language")}");
         if(test["name"] == getStorage.read("language")) {




           return mLocale = test["locale"];
         }

       }
    }


  }


}