import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/profile_screen_controller.dart';
import '../../../core/constants/default_values.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileScreenController>();
    return SizedBox(
      height: 0.3.sh,
      width: double.infinity,

      child: Obx(
              ()=> controller.haveLoading.isTrue?const  CircularProgressIndicator() :  Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:"http://167.172.73.241"+ controller.mModel.profileImage.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  width: 0.14.sh,
                  padding:const EdgeInsets.all(2),
                  height: 0.14.sh,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color:Theme.of(context).colorScheme.secondary),
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => SizedBox(
                    height: 30.h,
                    width: 30.h,
                    child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.account_circle_outlined,size: 43.h,color: Theme.of(context).colorScheme.primaryContainer,),
              ),
              SizedBox(
                height: kDefaultMargin.sh,
              ),
              Text(controller.mModel.name,style: TextStyle(color: Theme.of(context).colorScheme.secondaryVariant,
                  fontSize: kExtraLargeFontSize18.sp,fontWeight: FontWeight.bold),),
              Text(controller.mModel.phone,style: TextStyle(color: Theme.of(context).colorScheme.secondaryVariant,
                fontSize: kLargeFontSize16.sp,),),
            ],
          )


      ),
    );
  }
}
