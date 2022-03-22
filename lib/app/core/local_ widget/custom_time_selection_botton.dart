import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomTimeSelectionButton extends StatelessWidget {

  final controller;
  final VoidCallback onPress;
  const CustomTimeSelectionButton({Key? key,required this.controller,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)
          )
      ),
      child: Wrap(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(child: Text("ထိုးမည့် အချိန် (Section) ရွေးချယ်ပါ။")),
          ),

          Center(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 10.0),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (4 / 2),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
              ),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  onPressed: () {
                    /*if(currentTime.isAfter(DateTime(DateFormat("HH:mm:ss").parse(_oneController.betSections[index]['time_section']).hour).toLocal())){
                        _oneController.checkSection(betSection: _oneController.betSections[index]['time_section']);
                      }else{
                        setState(() {
                          userBetSection = DateFormat.jm().format(DateFormat("HH:mm:ss").parse(_oneController.betSections[index]['time_section']));
                          userBetSectionId = _oneController.betSections[index]['id'].toString();
                        });
                        Get.back();
                      }*/
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                          EvaIcons.clockOutline,
                          size: 25.0,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primaryContainer
                      ),
                      const SizedBox(height: 3.0,),
                      Text(
                          "Time One",
                          style: TextStyle(fontSize: 12.0,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primaryContainer)
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 0.0),
                    primary: Theme.of(context).colorScheme.secondary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.w)
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
