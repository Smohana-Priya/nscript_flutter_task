import 'package:flutter/material.dart';

import '../widgets/circular_btn.dart';
import '../widgets/f_and_o.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isDarkMode = false;
  void dartTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'AXIXBANK21JANFUT',
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                          Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 30,
                          )
                        ],
                      ),
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                          text: '+616',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text: '.20 ',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: '-15.80 ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: '(-2.50%)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ])),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'NSE',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              )),
                          Row(
                            children: [
                              CircularButton(
                                icon: Icons.show_chart_outlined,
                                color: isDarkMode ? Colors.black : Colors.white,
                                borderColor: Colors.grey,
                                onPressed: dartTheme,
                              ),
                              CircularButton(
                                text: 'Buy',
                                color: Colors.green,
                                textColor: Colors.white,
                              ),
                              CircularButton(
                                text: 'Sell',
                                color: Colors.red,
                                textColor: Colors.white,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const TabBar(
                        labelPadding: EdgeInsets.only(right: 15),
                        // labelPadding: EdgeInsets.symmetric(horizontal: 10),
                        isScrollable: true,
                        indicatorColor: Colors.blue,

                        tabs: [
                          Tab(
                            child: Text(
                              'INFO',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'LADDER',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'F&O',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'TECHNICAL',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'FUNDAME',
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      const Expanded(
                          child: TabBarView(
                        children: [
                          Center(child: Text('INFO Content')),
                          Center(child: Text('LADDER Content')),
                          FAndO(),
                          Center(child: Text('TECHNICAL Content')),
                          Center(child: Text('FUNDAME Content')),
                        ],
                      ))
                    ])),
          ),
        ),
      ),
    );
  }
}
