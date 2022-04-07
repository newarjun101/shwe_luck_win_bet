import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_button.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/module/controller/edit_profile_screen_controller.dart';
import '../../../core/constants/default_values.dart';
import '../../../core/local_ widget/custom_text_form_field.dart';
import '../../../core/validation/validation.dart';

class BuildEditProfileScreenBody extends StatelessWidget {
  const BuildEditProfileScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editProfileController = Get.find<EditProfileScreenController>();
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(kDefaultMargin.sh),
      child: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
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
                placeholder: (context, url) =>const  CircularProgressIndicator(),
                errorWidget: (context, url, error) =>const Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            Text(
              "Kyaw Gyi",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  fontSize: kExtraLargeFontSize18.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "****13",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryContainer,
                fontSize: kLargeFontSize16.sp,
              ),
            ),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomTextFormField(
                      controller: userNameController,
                      icon: Icons.account_circle_outlined,
                      hint: "first name",
                      validator: checkIsEmpty,
                      isPassword: false),
                ),
                SizedBox(
                  width: kDefaultMargin.sh,
                ),
                Expanded(
                  flex: 1,
                  child: CustomTextFormField(
                      controller: phoneController,
                      icon: Icons.phone_iphone_sharp,
                      hint: "phone",
                      validator: checkValidPhone,
                      isPhone: true,
                      isPassword: false),
                ),
              ],
            ),
            SizedBox(
              height: kDefaultMargin.sh*2,
            ),
            CustomButton(
                onClick: () => print("hahha"),
                title: "Edit",
                bgColor: Theme.of(context).colorScheme.secondary,
                textColor: Theme.of(context).colorScheme.onPrimary,
                radius: 4,
                iconSize: 10,
                isIcon: false),
            SizedBox(
              height: kDefaultMargin.sh*3,
            ),
            GestureDetector(
              onTap: ()=> Get.toNamed(Pages.lChangePassword),
              child: Text(
                "Change Password",
                textAlign: TextAlign.center,

                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: kMediumFontSize14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
