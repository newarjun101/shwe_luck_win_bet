import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';

class UserBetResult extends StatelessWidget {
  const UserBetResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(kDefaultMargin.sh),
        width: 1.sw,
        height: 0.5.sh,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0.056.sh),
                topLeft: Radius.circular(0.056.sh)),
            color: Theme.of(context).colorScheme.secondaryVariant),
        child: ListView(children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent
            ),
            child: DataTable(
                columns: const[
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('Number')),
                  DataColumn(label: Text('Date'))
                ],
                rows:const [
                  DataRow(
                    cells: [
                      DataCell(Text('Go')),
                      DataCell(Text('2009')),
                      DataCell(Text("4 Jan 2021")),

                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Go')),
                      DataCell(Text('2009')),
                      DataCell(Text("4 Jan 2021")),

                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Go')),
                      DataCell(Text('2009')),
                      DataCell(Text("4 Jan 2021")),

                    ],
                  ),

                ]
            ),
          ),
          Divider(),
          Theme(
            data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent
            ),
            child: DataTable(
                columns: const[
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('Number')),
                  DataColumn(label: Text('Date'))
                ],
                rows:const [
                  DataRow(
                    cells: [
                      DataCell(Text('Go')),
                      DataCell(Text('2009')),
                      DataCell(Text("4 Jan 2021")),

                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Go')),
                      DataCell(Text('2009')),
                      DataCell(Text("4 Jan 2021")),

                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Go')),
                      DataCell(Text('2009')),
                      DataCell(Text("4 Jan 2021")),

                    ],
                  ),

                ]
            ),
          ),
        ]));
  }
}
