import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var likeCount = 0;
  buttonPush(a) {
    a++;
  }
  List userInfo = [
    {"name": "박한", "like": 0 },
    {"name": "park", "like": 0 },
    {"name": "han", "like": 0 },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              likeCount++;
            });
          },
          child: Text(likeCount.toString()),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),

        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, i) {
              return Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(userInfo[i]["like"].toString()),
                    Text(userInfo[i]["name"]),
                    ElevatedButton(
                        onPressed: (){
                          setState(() {
                            userInfo[i]["like"]++;
                          });
                        },
                        child: Text("좋아요")
                    )
                  ],
                ),

              );
            }
        ),

        bottomNavigationBar: CustomBottomAppBar(),
      ),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.phone),
          Icon(Icons.message),
          Icon(Icons.contact_page)
        ],
      ),
    );
  }
}
