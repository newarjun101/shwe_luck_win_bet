import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';

class UserBetResult extends StatelessWidget {
  const UserBetResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
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
                  DataCell(Text('11:30 AM')),
                  DataCell(Text('23, 24, 25')),
                  DataCell(Text("4.1.2022")),

                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('11:30 AM')),
                  DataCell(Text('23, 24, 25')),
                  DataCell(Text("4.1.2022")),

                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('11:30 AM')),
                  DataCell(Text('23, 24, 25')),
                  DataCell(Text("4.1.2022")),

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
                  DataCell(Text('11:30 AM')),
                  DataCell(Text('23, 24, 25')),
                  DataCell(Text("4.1.2022")),

                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('11:30 AM')),
                  DataCell(Text('23, 24, 25')),
                  DataCell(Text("4.1.2022")),

                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('11:30 AM')),
                  DataCell(Text('23, 24, 25')),
                  DataCell(Text("4.1.2022")),

                ],
              ),

            ]
        ),
      ),
    ]);
  }
}
