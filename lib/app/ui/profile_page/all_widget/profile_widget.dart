import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/default_values.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.3.sh,
      width: double.infinity,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: "https://cdn.pixabay.com/photo/2015/11/30/14/10/batman-1070422_960_720.jpg",
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
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            height: kDefaultMargin.sh,
          ),
          Text("Kyaw Gyi",style: TextStyle(color: Theme.of(context).colorScheme.secondaryVariant,
              fontSize: kExtraLargeFontSize18.sp,fontWeight: FontWeight.bold),),
          Text("****13",style: TextStyle(color: Theme.of(context).colorScheme.secondaryVariant,
            fontSize: kLargeFontSize16.sp,),),
        ],
      ),
    );
  }
}
