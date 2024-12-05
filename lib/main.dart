// import 'package:flutter/material.dart';
// import 'package:muxiq/HomePage.dart';
// import 'package:muxiq/LoginPage.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: HomePage(),
//     )
//   );
// }

import 'package:flutter/material.dart';
import 'package:muxiq/LoginPage.dart';
import 'package:muxiq/page1.dart';
import 'package:muxiq/page2.dart';
import 'package:muxiq/page3.dart';
import 'package:muxiq/page4.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 62,
      margin: EdgeInsets.only(bottom: 1.5, left: 12, right: 12),
      decoration: BoxDecoration(
          // color: Theme.of(context).primaryColor,
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(20),
          //   topRight: Radius.circular(20),
          // ),
          border: Border.all(color: Colors.grey.shade800),
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color:const Color.fromARGB(255, 73, 73, 73),
                    size: 33,
                  )
                : const Icon(
                    Icons.home_outlined,
                    // color: Colors.white,
                     color:Colors.grey,
                    size: 33,
                  ),
          ),
          MaterialButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              child: Image(height: 34,width: 34,color: const Color.fromARGB(255, 73, 73, 73),
                  image: pageIndex == 1
                      ? AssetImage("./images/music-logo-png-2350.png")
                      : AssetImage("./images/music.png"))
          
              ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.favorite,
                  //  color: const Color.fromARGB(255, 73, 73, 73),
                  color: Color.fromARGB(255, 228, 93, 83),
                    size: 33,
                  )
                : const Icon(
                    Icons.favorite_border,
                    // color: const Color.fromARGB(255, 73, 73, 73),
                     color:Colors.grey,
                    size: 33,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.person,
                   color: const Color.fromARGB(255, 73, 73, 73),
                    size: 33,
                  )
                : const Icon(
                    Icons.person_outline,
                  //  color: const Color.fromARGB(255, 73, 73, 73),
                  color:Colors.grey,
                    size: 33,
                  ),
          ),
        ],
      ),
    );
  }
}
