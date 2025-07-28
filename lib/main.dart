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
          title: const Text(
            "xx동3가",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.menu),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.notification_add),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: 195,
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 15),
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/camera.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          SizedBox(height: 10),

                          Text(
                            "xx구 xx동 · 박한 · 10분 전",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            "1000원",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.thumb_up, size: 18, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            "4",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
