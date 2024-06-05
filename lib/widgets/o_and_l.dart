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
    final DataItem dataItem = parseData(data);
    final List<Data> d = dataItem.data!
        .where((e) =>
            DateFormatterService.formatTimestamp(e.expirydate!) == selectedDate)
        .toList();
    int halfLength = dataItem.data!
            .where((e) =>
                DateFormatterService.formatTimestamp(e.expirydate!) ==
                selectedDate)
            .toList()
            .length ~/
        2;
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),

        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 238, 235, 235))),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Call Ol(Chg%)',
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 238, 235, 235))),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'STRIKE',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 238, 235, 235))),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('IV',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 238, 235, 235))),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Put Ol(chg%)',
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                ),
              ),
            ),
          ],
        ),

        /// to make table content scrollable
        Expanded(
            child: ListView.builder(
                itemCount: d.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: index <= halfLength
                                  ? const Color(0xffFEED96)
                                  : null,
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 238, 235, 235))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Center(
                                child: Text(d[index].callOiChange ?? '')),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: index == halfLength
                                  ? const Color(0xffFEED96)
                                  : null,
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 238, 235, 235))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child:
                                Center(child: Text(d[index].strike.toString())),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: index == halfLength
                                  ? const Color(0xffFEED96)
                                  : null,
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 238, 235, 235))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Center(child: Text(d[index].iv ?? '')),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: index >= halfLength
                                  ? const Color(0xffFEED96)
                                  : null,
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 238, 235, 235))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child:
                                Center(child: Text(d[index].putOiChange ?? '')),
                          ),
                        ),
                      ),
                    ],
                  );
                })),
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
}
