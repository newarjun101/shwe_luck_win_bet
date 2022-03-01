import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/payment_option_card.dart';
import 'package:shwe_luck_win_bet/app/ui/balance_page/all_widget/balance_container.dart';
import 'package:shwe_luck_win_bet/app/ui/balance_page/all_widget/transfer_history.dart';

class BuildBalanceScreenBody extends StatelessWidget {
  const BuildBalanceScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  image: const AssetImage('assets/images/bg.png',),
                  colorFilter: ColorFilter.mode(Theme.of(context).primaryColor.withOpacity(0.27),  BlendMode.modulate)
              )
          ),
        ),
        Column(
          children: [
            const BalanceContainer(),
           SizedBox(height: kDefaultMargin.sh,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               PaymentOptionCard(images:const ['assets/images/k_pay.png','assets/images/wave.png'],
                   title: "ငွေဖြည့်မည်", onClick: ()=> print("Hello wordl")),
               PaymentOptionCard(images:const ['assets/images/k_pay.png','assets/images/wave.png'],
                   title: "ငွေထုတ်မည်", onClick: ()=> print("Hello wordl")),

             ],
           ) ,
            SizedBox(height: kDefaultMargin.sh,),
           const TransferHistory()
           ],
        ),
      ],
    );
  }
}
