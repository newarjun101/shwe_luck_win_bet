import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/testing_app/controller/test_local_controller.dart';
class HomePage extends StatelessWidget {
 /* final List locale =[
    {'name':'ENGLISH','locale': Locale('en','US')},
    {'name':'ಕನ್ನಡ','locale': Locale('kn','IN')},
    {'name':'हिंदी','locale': Locale('hi','IN')},
  ];
  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }*/
  buildLanguageDialog(BuildContext context){

    final controller = Get.find<TestLocalController>();
    showDialog(context: context,
        builder: (builder){
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(child: Text(controller.locale[index]['name']),onTap: (){
                        print(controller.locale[index]['name']);
                        controller.updateLanguage(controller.locale[index]['locale'],controller.locale[index]["name"]);
                      },),
                    );
                  }, separatorBuilder: (context,index){
                return Divider(
                  color: Colors.blue,
                );
              }, itemCount: controller.locale.length
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('title'.tr),),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('hello'.tr,style: TextStyle(fontSize: 15),),
              SizedBox(height: 10,),
              Text('message'.tr,style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Text('subscribe'.tr,style: TextStyle(fontSize: 20),),

              ElevatedButton(onPressed: (){
                buildLanguageDialog(context);
              }, child: Text('changelang'.tr)),
            ],
          ),
        )
    );
  }
}