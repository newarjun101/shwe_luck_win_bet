import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/edit_profile_screen_controller.dart';
import 'package:shwe_luck_win_bet/app/ui/profile_page/all_widget/profile_widget.dart';

import '../../../core/constants/default_values.dart';

class BuildEditProfileScreenBody extends StatelessWidget {
  const BuildEditProfileScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final editProfileController = Get.find<EditProfileScreenController>();
    return Center(
      child: ListView(

        children: [

          CircleAvatar(
            radius: 0.074.sh,
           backgroundColor: Theme.of(context).colorScheme.secondary,
           child: CachedNetworkImage(
             imageUrl: "https://cdn.pixabay.com/photo/2015/11/30/14/10/batman-1070422_960_720.jpg",
             imageBuilder: (context, imageProvider) => Container(
               width: 0.14.sh,
            //   padding:const EdgeInsets.all(1),
               height: 0.14.sh,
               decoration: BoxDecoration(
                 color: Colors.red,
                 shape: BoxShape.circle,
                 border: Border.all(color:Theme.of(context).colorScheme.secondary),
                 image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
               ),
             ),
             placeholder: (context, url) => CircularProgressIndicator(),
             errorWidget: (context, url, error) => Icon(Icons.error),
           ),


          ),

          SizedBox(
            height: kDefaultMargin.sh,
          ),
          Text("Kyaw Gyi",textAlign: TextAlign.center,style: TextStyle(color: Theme.of(context).colorScheme.primaryContainer,
              fontSize: kExtraLargeFontSize18.sp,fontWeight: FontWeight.bold),),
          Text("****13",textAlign: TextAlign.center,style: TextStyle(color: Theme.of(context).colorScheme.primaryContainer,
            fontSize: kLargeFontSize16.sp,),),


        ],
      ),
    );
  }
}
