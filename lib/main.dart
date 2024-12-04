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
import 'package:muxiq/page1.dart';
import 'package:muxiq/page2.dart';
import 'package:muxiq/page3.dart';
import 'package:muxiq/page4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff2F8D46),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
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
 
      backgroundColor: const Color.fromARGB(255, 255, 255, 255) ,
      // appBar: AppBar(
      //   leading: Icon(
      //     Icons.menu,
      //     color: Theme.of(context).primaryColor,
      //   ),
      //   title: Text(
      //     "MUXIQ",
      //     style: TextStyle(
      //       color: Theme.of(context).primaryColor,
      //       fontSize: 25,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      // ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(bottom: 5,left: 10,right: 10),
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor,
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(100)
      ),
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
                    // color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    // color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.work_rounded,
                    // color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.work_outline_outlined,
                    // color: Colors.white,
                    size: 35,
                  ),
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
                    // color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.favorite_border,
                    // color: Colors.white,
                    size: 35,
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
                    // color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.person_outline,
                    // color: Colors.white,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}

