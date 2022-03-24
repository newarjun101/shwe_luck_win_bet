import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/loging_screen/widget/build_login_card.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/sign_up_screen/widget/build_sign_up_card.dart';

import '../../../../core/constants/default_values.dart';
import '../../../../core/local_ widget/custom_text_form_field.dart';
import '../../../../module/controller/sign_up_screen_controller.dart';

class BuildChangePasswordBody extends StatelessWidget {
  const BuildChangePasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.find<SignUpScreenController>();
    return GetBuilder<SignUpScreenController>(
      builder: (controller) {
        return Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: const AssetImage(
                        'assets/images/bg.png',
                      ),
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor.withOpacity(0.27),
                          BlendMode.modulate))),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    CircleAvatar(
                      radius: 0.074.sh,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: CachedNetworkImage(
                        imageUrl:
                        "https://cdn.pixabay.com/photo/2015/11/30/14/10/batman-1070422_960_720.jpg",
                        imageBuilder: (context, imageProvider) => Container(
                          width: 0.14.sh,
                          //   padding:const EdgeInsets.all(1),
                          height: 0.14.sh,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).colorScheme.secondary),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),


                    Text(
                      "Change Password",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        //  fontWeight: FontWeight.bold,
                          fontSize: kMediumFontSize14.sp),
                    ),
                    BuildSignUpCard(),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
