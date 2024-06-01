import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nscript_flutter_task/modal/data_item.dart';
import 'package:nscript_flutter_task/widgets/o_and_l.dart';

import '../data/json.dart';

class FAndO extends StatefulWidget {
  const FAndO({super.key});

  @override
  State<FAndO> createState() => _FAndOState();
}

class _FAndOState extends State<FAndO> {
  String selectedOptionValue = 'OPTION(61)';
  DateTime? selectedDate;
  final DataItem dataItem = parseData(data);
  List<TableRow> rows = [];

  List<String> options = [
    'OPTION(61)',
    'OPTION(62)',
    'OPTION(63)',
    'OPTION(64)'
  ];
  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
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
                            color: Colors.black,
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
                    child: InkWell(
                      onTap: () {
                        selectDate(context);
                        // print('${selectedDate?.toLocal()}'.split(' ')[0]);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedDate == null
                                    ? 'Select Date'
                                    : DateFormat('MMMM dd yyyy')
                                        .format(selectedDate!),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                              ),
                            ],
                          )),
                    ),
                  )
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
                unselectedLabelColor: Colors.black,

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
