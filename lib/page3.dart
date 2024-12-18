import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:muxiq/Provider/pp.dart';
import 'package:muxiq/Provider/providerfile.dart';
import 'package:muxiq/favext.dart';
import 'package:provider/provider.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List ls = [];
  late bool BorW;
  var mybox = Hive.box("mybox");
  String? song;
  String? singer;
  bool _isPlayingorNot = false;

  int h = 0;
  List Songnamelist = [];
  void d() {
    BorW = Provider.of<ProviderFile>(context, listen: false).LS[0];

    print(BorW);
    if (mybox.get(11) != null) {
      ls = mybox.get(11);
      int v = ls.length;
      for (int k = 0; k <= v; k++) {
        try {
          String a = ls[k].toString();

          List snn = a.split('/');

          String b = snn[snn.length - 1].toString();
          List EDse = b.split('-');
          String song = EDse[0];
          Songnamelist.add(song);
          // List kkkk = c.split(',');
          // singer = kkkk[0];
          print("HI");
        } catch (e) {
          print(e);
        }
      }
    } else {
      print(
          "{{{{{{{{{{{{{{{{{{{{{{{{{{{ EMPTY MYBOX }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}");
    }
  }

  AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> initializePlaylist() async {
    final playlist = ConcatenatingAudioSource(
      children: ls.map((song) => AudioSource.uri(Uri.parse(song))).toList(),
    );

    await _audioPlayer.setAudioSource(playlist);
  }

  Future<void> play() => _audioPlayer.play();

  Future<void> pause() => _audioPlayer.pause();

  Future<void> next() async {
    _audioPlayer.seekToNext();
  }

  Future<void> previous() => _audioPlayer.seekToPrevious();

  Future<void> Shuffle() => _audioPlayer.shuffle();

  void dispose() {
    _audioPlayer.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    d();
    initializePlaylist();
    setState(() {
      _isPlayingorNot=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: BorW
                  ? [Colors.black, const Color.fromARGB(255, 66, 66, 66)]
                  : [Colors.grey.shade100, Colors.grey.shade50])),
      child: Column(
        children: [
          Container(
            height: 155,
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        " Favorates",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade800),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Playlist Songs",
                        style: TextStyle(
                            fontSize: 12,
                            color: BorW ? Colors.grey.shade200 : Colors.grey),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: BorW ? Colors.grey.shade200 : Colors.grey)),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 23,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: BorW
                        ? [Colors.black, const Color.fromARGB(255, 66, 66, 66)]
                        : [Colors.grey.shade100, Colors.grey.shade50])),
            child: Column(
              children: [
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ls.isNotEmpty
                        ? ListView.builder(
                            itemCount: ls.length,
                            itemBuilder: (context, index) {
                              String a = ls[index].toString();

                              List snn = a.split('/');

                              String b = snn[snn.length - 1].toString();
                              List EDse = b.split('-');
                              song = EDse[0];
                              String c = EDse[1].toString();
                              List kkkk = c.split(',');
                              singer = kkkk[0];

                              return GestureDetector(
                                onTap: () async {
                                  print("ontapped");
                                  await play();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 13, right: 12, top: 11, bottom: 11),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                              "./images/music-logo-png-2350.png",
                                              fit: BoxFit.cover,
                                              color: BorW
                                                  ? Colors.grey.shade500
                                                  : Colors.grey.shade500)),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                          child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              song.toString(),
                                              style: TextStyle(
                                                  color: BorW
                                                      ? Colors.grey.shade200
                                                      : Colors.grey.shade900,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              singer.toString(),
                                              style: TextStyle(
                                                  color: BorW
                                                      ? Colors.grey.shade200
                                                      : Colors.grey.shade800),
                                            )
                                          ],
                                        ),
                                      )),
                                      Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                              color: BorW
                                                  ? Colors.grey.shade600
                                                  : Colors.grey.shade400,
                                              borderRadius:
                                                  BorderRadius.circular(200),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 3,
                                                    spreadRadius: 0,
                                                    offset: Offset(0, 3),
                                                    color: Colors.grey)
                                              ]),
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.more_vert,
                                                size: 17,
                                                color: Colors.white,
                                              ))),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Text("Empty Favorates"),
                          )),
                Container(
                  height: 85,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: .5,
                          color: BorW
                              ? Colors.grey.shade400
                              : Colors.grey.shade800)),
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
                            // padding: EdgeInsets.all(8),
                            // child: Image.asset(
                            //   './images/bio.png',
                            //   // color: BorW
                            //             // ? Colors.grey.shade400
                            //             // : Colors.grey.shade800,
                            //   fit: BoxFit.contain,
                            // ),
                            child: Lottie.network(
                              'https://lottie.host/0e905ffb-b376-44bb-8c4f-7370e20bbdbe/TeO8913cwR.json',
                              animate: _isPlayingorNot ? false : true,
                              fit: BoxFit.fill,
                              // delegates:LottieDelegates(values: [ValueDelegate.color(const ['Shape Layer 1', 'Rectangle', 'Fill 1'],value: Colors.red)])
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                              width: 100,
                              child: Text(
                                Songnamelist[h].toString(),
                                // "sss",
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
                            previous();
                            setState(() {
                              h = h - 1;
                            });
                          },
                          icon: Icon(Icons.skip_previous_rounded,
                              color: BorW
                                  ? Colors.grey.shade200
                                  : Colors.grey.shade800)),
                      _isPlayingorNot
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  play();
                                  _isPlayingorNot = false;
                                });
                              },
                              icon: Icon(Icons.play_arrow,
                                  color: BorW
                                      ? Colors.grey.shade200
                                      : Colors.grey.shade800))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  pause();
                                  _isPlayingorNot = true;
                                });
                              },
                              icon: Icon(Icons.pause,
                                  color: BorW
                                      ? Colors.grey.shade200
                                      : Colors.grey.shade800)),
                      IconButton(
                          onPressed: () {
                            next();
                            setState(() {
                              h = h + 1;
                            });
                          },
                          icon: Icon(Icons.skip_next_rounded,
                              color: BorW
                                  ? Colors.grey.shade200
                                  : Colors.grey.shade800))
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
