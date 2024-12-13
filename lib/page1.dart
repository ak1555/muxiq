import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muxiq/Provider/providerfile.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  dynamic song;
  static dynamic INDEX;
  List<File> _audioFiles = [];
  var mybox = Hive.box('mybox');
  int h = 0;
  List Songnamelist = [];

  late bool BorW;
  static late bool _IssongPlayed;
  void d() {
    BorW = Provider.of<ProviderFile>(context, listen: false).LS[0];
    Provider.of<ProviderFile>(context, listen: false).ak();
    _audioFiles = Provider.of<ProviderFile>(context, listen: false).Songss;
    song = Provider.of<ProviderFile>(context, listen: false).i;
    _IssongPlayed = Provider.of<ProviderFile>(context, listen: false).isPlaying;
    print(_audioFiles);
    print("isplayedor not====");
    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>AUDIOFIFLES 1 page list<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(_audioFiles);
    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>AUDIOFIFLES 1 page list<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    h = Provider.of<ProviderFile>(context, listen: false).ListIndex;
    Songnamelist = Provider.of<ProviderFile>(context, listen: false).SOngNAme;
  }

  void dd() {
    setState(() {
      _IssongPlayed =
          Provider.of<ProviderFile>(context, listen: false).isPlaying;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    d();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: BorW
                  ? [Colors.black, const Color.fromARGB(255, 66, 66, 66)]
                  : [Colors.grey.shade100, Colors.grey.shade50])),
      child: ListView(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            margin: EdgeInsets.only(left: 15, right: 15),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Hiii, Dude",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: BorW
                              ? Colors.grey.shade200
                              : Colors.grey.shade800),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(Icons.now_widgets_outlined,
                          size: 25,
                          color: BorW
                              ? Colors.grey.shade200
                              : Colors.grey.shade600),
                    ),
                    Container(
                      height: 50,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(Icons.more_vert,
                          size: 24,
                          color: BorW
                              ? Colors.grey.shade200
                              : Colors.grey.shade600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ===========================================================================================================================
          SizedBox(
            height: 3,
          ),
          Container(
            height: 63,
            width: double.infinity,
            margin: EdgeInsets.only(left: 15, right: 15),
            padding: EdgeInsets.only(left: 15, right: 3),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(100),
                color: BorW ? Colors.grey.shade400 : Colors.grey.shade300),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  style: TextStyle(
                      color: BorW
                          ? Colors.grey.shade900
                          : Colors.blueGrey.shade800),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search your song...",
                      hintStyle: TextStyle(
                        color:
                            BorW ? Colors.grey.shade600 : Colors.grey.shade600,
                        fontSize: 18,
                      )),
                )),
                IconButton(
                    padding: EdgeInsets.all(11),
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade500),
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 32,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
              margin: EdgeInsets.only(left: 20, right: 15),
              child: Text(
                "All Songs",
                style: TextStyle(
                    color: BorW ? Colors.grey.shade200 : Colors.grey.shade800),
              )),
          SizedBox(
            height: 2,
          ),
          Divider(),
          Container(
            height: 400,
            width: double.infinity,
            child: ListView.builder(
              itemCount: _audioFiles.length,
              itemBuilder: (context, index) {
                final audioFile = _audioFiles[index];
                return ListTile(
                  leading: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1, color: Colors.grey)),
                      alignment: Alignment.center,
                      child: Image.asset("./images/music-logo-png-2350.png",
                          fit: BoxFit.cover,
                          color: BorW
                              ? Colors.grey.shade500
                              : Colors.grey.shade500)),
                  title: Text(
                    audioFile.uri.pathSegments.last,
                    style: TextStyle(
                        color:
                            BorW ? Colors.grey.shade200 : Colors.grey.shade800),
                  ),
                  onTap: () {
                   SnackBar(content: Text("Can't play!"));
                    Provider.of<ProviderFile>(context, listen: false)
                        .ListIndex = index;
                    Provider.of<ProviderFile>(context, listen: false).PLAY();
                    d();
                    INDEX = audioFile.path;
                    setState(() {
                      _IssongPlayed = true;
                    });
                    String sn = _audioFiles[index].toString();

                    List snn = sn.split('/');

                    setState(() {
                      song = snn[snn.length - 1];
                    });
                    print(
                        "''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''");
                    print(audioFile);
                    print(snn[snn.length - 1]);
                    print(
                        "''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''");
                  },
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'page2',
                  arguments: INDEX.toString());
            },
            child: Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: .5,
                      color:
                          BorW ? Colors.grey.shade400 : Colors.grey.shade800)),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: BorW
                                    ? Colors.grey.shade200
                                    : Colors.grey.shade800),
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          './images/show2.jpeg',
                          color: BorW
                              ? Colors.grey.shade400
                              : Colors.grey.shade800,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                          width: 150,
                          child: Text(
                            Songnamelist[h].toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                color: BorW
                                    ? Colors.grey.shade200
                                    : Colors.grey.shade800),
                          )),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Provider.of<ProviderFile>(context, listen: false)
                            .mute();

                        dd();
                      },
                      icon: Provider.of<ProviderFile>(context, listen: false)
                              .isPlaying
                          ? Icon(Icons.pause,
                              color: BorW
                                  ? Colors.grey.shade200
                                  : Colors.grey.shade800)
                          : Icon(Icons.play_arrow,
                              color: BorW
                                  ? Colors.grey.shade200
                                  : Colors.grey.shade800))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
