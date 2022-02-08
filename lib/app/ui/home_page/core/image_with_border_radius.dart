import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/default_values.dart';

class ImageWithBorderRadius extends StatelessWidget {
  const ImageWithBorderRadius({Key? key,required this.imgUrl}) : super(key: key);
 final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 0.45.sw,
      margin: EdgeInsets.all(kDefaultMargin.sh),
      decoration: BoxDecoration(
          border: Border.all(
              width: 3, color: Theme.of(context).colorScheme.secondary),
         /* gradient: LinearGradient(
            colors: [
              Color(0xff0575e6),
              Theme.of(context).primaryColor
              //add more colors for gradient
            ],
            begin: Alignment.topCenter, //begin of the gradient color
            end: Alignment.bottomCenter, //end of the gradient color
            //set the stops number equal to numbers of color
          ),*/
          borderRadius: BorderRadius.circular(0.04.sh)),
      child: CachedNetworkImage(
        imageUrl:
        imgUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            color: Colors.red,
              borderRadius: BorderRadius.circular(0.038.sh),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
