import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
List<String> mDataColumnTitleList = [
  "ဂဏန်း","အဆ","ထိုးနှုန်း","ပြင်","ဖျက်"
];

List<Map<String,dynamic>> mBettingData = [

  {"id" : "1","number" : '02',"times" : "700","price" : "900" },
  {"id" : "1","number" : '02',"times" : "700","price" : "900" },
  {"id" : "1","number" : '02',"times" : "700","price" : "900" },
  {"id" : "1","number" : '02',"times" : "700","price" : "900" },
  {"id" : "1","number" : '02',"times" : "700","price" : "900" },
  {"id" : "1","number" : '02',"times" : "700","price" : "900" },
  {"id" : "1","number" : '02',"times" : "700","price" : "900" },
];

class CustomDataTableForSelectedBet extends StatelessWidget {
  const CustomDataTableForSelectedBet({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  FittedBox(
      child: DataTable(
          decoration: BoxDecoration(
          color: Colors.red,
            borderRadius: BorderRadius.circular(20)
      ),
      headingRowColor: MaterialStateColor.resolveWith(
      (states) => Theme.of(context).colorScheme.secondary
      ),
      headingTextStyle:TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: kSmallFontSize12.sp,fontWeight: FontWeight.bold),
      headingRowHeight: 45,
      dividerThickness: 1,
      dataRowHeight: 50.0,
      dataRowColor:MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColor),
      dataTextStyle: const TextStyle(color: Colors.white, fontSize: kMediumFontSize14),
      columnSpacing: 35,
      columns: const [
      DataColumn(label: Text("နံပါတ်")),
      DataColumn(label: Text("အဆ")),
      DataColumn(label: Text("ကြေး")),
      DataColumn(label: Text("ပြင်/ဖျက်")),
      ], rows: mBettingData.map((e) =>  DataRow(cells:  [
        DataCell(Text(e["number"])),
        DataCell(Text(e["times"],)),
        DataCell(Text(e["price"])),
        DataCell(Row(
          children: [
            GestureDetector(
                onTap : ()=> print("Hello world"),
                child: Icon(Icons.edit,size: 16.sp,color: Theme.of(context).colorScheme.secondary,)),
            SizedBox(
              width: 8.w,
            ),
            GestureDetector(
                onTap : ()=> print("Hello world"),
                child: Icon(Icons.delete,size: 16.sp,color: Colors.red)),
          ],
        ))
      ]
      )).toList()
      ),
    );
  }
}
