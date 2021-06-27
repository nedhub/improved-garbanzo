import 'package:budget/json/daily_json.dart';
import 'package:budget/json/day_month.dart';
import 'package:flutter/material.dart';

class Daily extends StatefulWidget {
  Daily({Key? key}) : super(key: key);

  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  int activeDay = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0E6F0),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3)
            ]),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 60, bottom: 25, right: 20, left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daily Transactions",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(days.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeDay = index;
                            });
                          },
                          child: Container(
                            width: (size.width - 40) / 7,
                            child: Column(
                              children: [
                                Text(
                                  days[index]['label'],
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(height: 50),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: activeDay == index
                                        ? Color(0xFF4C5D70)
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Center(
                                    child: Text(
                                      days[index]['day'],
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: activeDay == index
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }))
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 20),
            child: Column(
                children: List.generate(daily.length, (index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (size.width - 40) * 0.7,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Image.asset(
                                  daily[index]['icon'],
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                                width: (size.width - 90) * 0.5,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        daily[index]['name'],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Text(daily[index]['date'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.w400,
                                          ))
                                    ]))
                          ],
                        ),
                      ),
                      Container(
                        width: (size.width - 40) * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              daily[index]['price'],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFF4297A0),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120, top: 8),
                    child: Divider(
                      thickness: 7,
                    ),
                  )
                ],
              );
            })),
          ),
          SizedBox(height: 15),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(children: [
                Spacer(),
                Text("Total",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.4))),
                Spacer(),
                Text("\$56583",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.4))),
              ]))
        ],
      ),
    );
  }
}
