import 'package:flutter/material.dart';

import '../data/json.dart';
import '../modal/data_item.dart';
import '../service/data_parser_service.dart';
import '../service/date_formatter_service.dart';

class OAndL extends StatelessWidget {
  final String? selectedDate;
  const OAndL({super.key, this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Table(
          border: TableBorder.all(
              width: 1.0, color: const Color.fromARGB(255, 234, 232, 232)),
          columnWidths: const {
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: FlexColumnWidth(),
          },
          children: const [
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Call Ol(Chg%)',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'STRIKE',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('IV',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Put Ol(chg%)',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
              ],
            ),
          ],
        ),

        /// to make table content scrollable
        Expanded(
          child: SingleChildScrollView(
            child: Table(
              border: TableBorder.all(
                  width: 1.0, color: const Color.fromARGB(255, 234, 232, 232)),
              columnWidths: const {
                0: FlexColumnWidth(),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
                3: FlexColumnWidth(),
              },
              children: _buildTableRows(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              const Text(
                '* OI is desplayed in contracts ',
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                height: 8,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Open Interest',
              ),
            ],
          ),
        )
      ],
    );
  }

  List<TableRow> _buildTableRows() {
    List<TableRow> rows = [];

    final DataItem dataItem = parseData(data);

    for (var item in dataItem.data!
        .where((e) =>
            DateFormatterService.formatTimestamp(e.expirydate!) == selectedDate)
        .toList()) {
      rows.add(
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.callOiChange ?? ''),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.strike.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.iv ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.putOiChange ?? ''),
            ),
          ],
        ),
      );
    }
    return rows;
  }
}
