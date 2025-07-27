import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "xx동3가",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search),
                  Icon(Icons.menu),
                  Icon(Icons.notification_add),
                ],
              ),
            )
          ],
        ),

        body: Container(
          width: double.infinity, height: 170,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 130, height: 130,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "camera.png",
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "캐논 DSLR 100D (단렌즈, 충전기 10기가SD 포함)",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            "xx구 xx동 - 박한 10분전",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "210,000원",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                        Container(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.thumb_up),
                              SizedBox(width: 4,),
                              Text("4", style: TextStyle(fontWeight: FontWeight.bold),)
                            ]
                          )
                        )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
