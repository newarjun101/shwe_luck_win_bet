import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_buttom_sheet.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/payment_type_list_widget.dart';

class CashInCashOutScreenController extends GetxController {


  showPaymentTypeWidget(context) {

    Future.delayed(Duration(seconds: 1), () {

      customBottomSheet(context: context, child: PaymentTypeListWidget(), height: 0.31);
    });
  }

}