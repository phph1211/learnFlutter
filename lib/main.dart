import 'package:contact/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  UserInfo userInfo = UserInfo(
      nickName: "bakan.lilil",
      name: "박한",
      post: 1,
      followers: 100,
      following: 200,
  );

  var data = [];

  getData() async {
    var result = await http.get( Uri.parse('https://codingapple1.github.io/app/data.json') );
    var res2 = jsonDecode(result.body);

    setState(() {
      data = res2;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF161616),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF161616),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(Icons.lock_outline_rounded, size: 17),
              const SizedBox(width: 5),
              Text(
                userInfo.nickName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_sharp, size: 20,),
            ],
          ),
          actions: const [
            Icon(Icons.add_to_drive_outlined, size: 27),
            SizedBox(width: 20),
            Icon(Icons.add_box_outlined, size: 27),
            SizedBox(width: 20),
            Icon(Icons.menu, size: 27),
            SizedBox(width: 15),
          ],
        ),

        body: SizedBox(
          child: Column(
            children: [
              ProfileHeader(userInfo: userInfo),
              ProfileButtons(),
              ProfileNavbar(data: data),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key, required this.userInfo});
  final UserInfo userInfo;

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 42,
                backgroundImage: AssetImage("assets/images/cat.png"),
              ),

              SizedBox(width: 20,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userInfo.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatItem(label: "게시물", count: widget.userInfo.post),
                        StatItem(label: "팔로워", count: widget.userInfo.followers),
                        StatItem(label: "팔로잉", count: widget.userInfo.following),
                        SizedBox()
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(height: 10,),

          Text(
            "한세사이버보안고 다니는 박한임",
            style: TextStyle(
                fontWeight: FontWeight.w700
            ),
          )
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String label;
  final int count;

  const StatItem({super.key, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            count.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
        ),
        Text(
            label,
            style:
            TextStyle(
                fontSize: 14
            )
        ),
      ],
    );
  }
}

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
              onPressed: () {},
              child: Text("프로필 편집")
          )
        ),
        SizedBox(width: 8),
        Flexible(
          flex: 1,
          child: OutlinedButton(
              onPressed: () {},
              child: Text("프로필 공유")
          )
        ),
        SizedBox(width: 8)
      ],
    );
  }
}


class ProfileNavbar extends StatefulWidget {

  final List data;
  const ProfileNavbar({super.key, required this.data});


  @override
  State<ProfileNavbar> createState() => _ProfileNavbarState();
}

class _ProfileNavbarState extends State<ProfileNavbar> {
  
  final List<IconData> icons = [
    Icons.menu,
    Icons.video_call_outlined,
    Icons.person
  ];

  int selectedIndex = 0;

  void handleClick (int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index){
            return IconButton(
                onPressed: (){
                  handleClick(index);},
                  icon: Icon(
                    icons[index],
                    size: 32,
                    color: selectedIndex == index ? Colors.white : Colors.white38,
                  )
            );
          }),
        ),
        Text(widget.data[selectedIndex]["content"]),
        Image.network(widget.data[selectedIndex]["image"])
      ],
    );
  }
}









