import 'package:flutter/material.dart';
import 'package:nscript_flutter_task/data/json.dart';
import 'package:nscript_flutter_task/widgets/o_and_l.dart';

import '../modal/data_item.dart';
import '../service/data_parser_service.dart';

class FAndO extends StatefulWidget {
  const FAndO({super.key});

  @override
  State<FAndO> createState() => _FAndOState();
}

class _FAndOState extends State<FAndO> {
  final DataItem dataItem = parseData(data);
  String selectedOptionValue = 'OPTION(61)';
  String? selectedDate = 'Aug 26 2021';

  // DateTime? selectedDate;
  List<TableRow> rows = [];

  List<String> options = [
    'OPTION(61)',
    'OPTION(62)',
    'OPTION(63)',
    'OPTION(64)'
  ];
  void selectDate(BuildContext context) async {
    //   if (picked != null && picked != selectedDate) {
    //     setState(() {
    //       selectedDate = picked;
    //     });
    //   }
  }

  @override
  Widget build(BuildContext context) {
    // print(dataItem.data![0].id);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedOptionValue,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                          ),
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Color.fromARGB(255, 133, 131, 131),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOptionValue = newValue!;
                            });
                          },
                          items: options
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedDate,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                          ),
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Color.fromARGB(255, 133, 131, 131),
                          ),
                          onChanged: (String? newValue) {
                            // setState(() {
                            //   selectedOptionValue = newValue!;
                            // });
                          },
                          items: dataItem.expiry!
                              .map<DropdownMenuItem<String>>((dynamic value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  border: Border.all(
                      color: const Color.fromARGB(255, 215, 212, 212))),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                // labelPadding: EdgeInsets.symmetric(horizontal: 10),
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    17.0,
                  ),
                  color: Colors.green,
                ),

                labelColor: Colors.white,
                unselectedLabelColor: const Color.fromARGB(255, 143, 142, 142),

                tabs: const [
                  Tab(
                    child: Text(
                      'Buy/Sell',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'LTP',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'OI',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Greeks',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
                child: TabBarView(
              children: [
                Center(child: Text('Buy/Sell Content')),
                Center(child: Text('LTP Content')),
                OAndL(),
                Center(child: Text('Greeks Content')),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
