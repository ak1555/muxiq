// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:muxiq/Provider/providerfile.dart';
// import 'package:muxiq/main.dart';
// import 'package:muxiq/page1.dart';
import 'package:provider/provider.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
  bool play = true;
  bool lyrics = false;
  bool favorite = false;
  bool pause = true;
  bool t = true;
  String? index;
  List ls = [];
  bool pp=true;

  var mybox = Hive.box('mybox');
  final AudioPlayer _audioPlayer = AudioPlayer();

  double sliderValue = 0;
  Duration max = const Duration(seconds: 120);
  late bool BorW;
  // late bool _issongPlayed;
  int h = 0;
  List Songnamelist = [];

  void d() {
    setState(() {
      BorW = Provider.of<ProviderFile>(context, listen: false).LS[0];

          
      ls = Provider.of<ProviderFile>(context, listen: false).Songss;
      h = Provider.of<ProviderFile>(context, listen: false).ListIndex;
      Songnamelist = Provider.of<ProviderFile>(context, listen: false).SOngNAme;
      print("MMMMMMMMMMM HIVE LS");
      print(ls);
    });
    print(BorW);
  }

  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    d();
   setState(() {
      pp=true;
   });
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    Future.delayed(
      Duration(milliseconds: 5),
      () => Provider.of<ProviderFile>(context, listen: false).PLAY(),
    );
    Provider.of<ProviderFile>(context, listen: false)
        .audioPlayer
        .positionStream
        .listen((position) {
      if (mounted) {
        setState(() {
          _currentPosition = position;
        });
      }
    });

    Provider.of<ProviderFile>(context, listen: false)
        .audioPlayer
        .durationStream
        .listen((duration) {
      setState(() {
        _totalDuration = duration ?? Duration.zero;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    index = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            BorW ? const Color.fromARGB(255, 48, 47, 47) : Colors.grey.shade100,
        title: Text(
          "           PLAYLIST",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: BorW ? Colors.grey.shade200 : Colors.black),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: BorW
                    ? [Colors.black, const Color.fromARGB(255, 66, 66, 66)]
                    : [Colors.grey.shade100, Colors.grey.shade50])),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 5,
                    onPressed: () {
                      setState(() {
                        lyrics = false;
                        play = true;
                      });
                    },
                    child: play
                        ? Text(
                            "Play",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: BorW
                                    ? Colors.grey.shade200
                                    : Colors.grey.shade800,
                                fontSize: 15),
                          )
                        : Text(
                            "Play",
                            style: TextStyle(
                                color: BorW
                                    ? Colors.grey.shade200
                                    : Colors.grey.shade600,
                                fontSize: 13),
                          ),
                  ),
                  MaterialButton(
                    minWidth: 5,
                    onPressed: () {
                      setState(() {
                        lyrics = true;
                        play = false;
                      });
                    },
                    child: lyrics
                        ? Text("Lyrics",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: BorW
                                    ? Colors.grey.shade200
                                    : Colors.grey.shade800,
                                fontSize: 15))
                        : Text(
                            "Lyrics",
                            style: TextStyle(
                                color: BorW
                                    ? Colors.grey.shade200
                                    : Colors.grey.shade600,
                                fontSize: 13),
                          ),
                  )
                ],
              ),
            ),
            Container(
              height: 310,
              width: double.infinity,
              margin: EdgeInsets.only(left: 24, right: 24),
              decoration: BoxDecoration(
                  color: play ? Colors.transparent : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: play
                  ? Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 210,
                          width: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150),
                            color: Colors.grey,
                          ),
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              pp
                                  ? Lottie.asset('./lottie/ll.json')
                                  : Container(),
                              Positioned(
                                top: 25,
                                left: 25,
                                child: Container(
                                  height: 160,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(150),
                                    color: Colors.white,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(150),
                                    child: Image.asset(
                                      "./images/back.png",
                                      fit: BoxFit.cover,
                                      color: Colors.grey.shade300,
                                      colorBlendMode: BlendMode.modulate,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        "No Lyrics",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 90,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 24, right: 24),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share_outlined,
                              color: BorW
                                  ? Colors.grey.shade200
                                  : Colors.grey.shade900,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(Songnamelist[h].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: BorW
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade900,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "playlist",
                              style: TextStyle(
                                color: BorW
                                    ? Colors.grey.shade200
                                    : Colors.grey.shade900,
                              ),
                            )
                          ],
                        )),
                        IconButton(
                            onPressed: () {
                              if (mybox.get(11) != null) {
                                print("NOT NULL FAVORATE HIVE");
                                List ls = mybox.get(11);
                                ls.add(index);
                                mybox.put(11, ls);
                                print(
                                    "(((((((((((((((((((((((((((((FAVORATE IF HIVE)))))))))))))))))))))))))))))");
                                print(ls);
                              } else {
                                List ls = [];
                                ls.add(index);
                                mybox.put(11, ls);
                                print(
                                    "(((((((((((((((((((((((((((((FAVORATE ELSE HIVE)))))))))))))))))))))))))))))");
                                print(ls);
                              }

                              setState(() {
                                favorite = !favorite;
                              });
                            },
                            icon: favorite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: BorW
                                        ? Colors.grey.shade200
                                        : Colors.grey.shade900,
                                  )),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 24, right: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Provider.of<ProviderFile>(context,
                                        listen: false)
                                    .toggleMute();
                              },
                              icon: Provider.of<ProviderFile>(context).isMuted
                                  ? Icon(
                                      Icons.mic_off,
                                      size: 17,
                                      color: BorW
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade900,
                                    )
                                  : Icon(
                                      Icons.mic,
                                      size: 17,
                                      color: BorW
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade900,
                                    ),
                            ),
                            SizedBox(
                              width: 2.5,
                            ),
                            Expanded(
                              child: Container(
                                height: 15,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                      overlayShape:
                                          SliderComponentShape.noOverlay),
                                  child: Container(
                                    width: 350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Slider(
                                        activeColor: BorW
                                            ? Colors.grey.shade200
                                            : Colors.grey.shade600,
                                        inactiveColor: BorW
                                            ? Colors.grey.shade600
                                            : Colors.grey.shade300,
                                        thumbColor: Colors.grey,
                                        min: 0.0,
                                        max:
                                            _totalDuration.inSeconds.toDouble(),
                                        value: _currentPosition.inSeconds
                                            .toDouble()
                                            .clamp(
                                                0.0,
                                                _totalDuration.inSeconds
                                                    .toDouble()),
                                        onChanged: (value) {
                                          final newPosition =
                                              Duration(seconds: value.round());
                                          Provider.of<ProviderFile>(context,
                                                  listen: false)
                                              .audioPlayer
                                              .seek(newPosition);
                                        }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    _currentPosition.inMinutes.remainder(60).toString().padLeft(2,"0"),
                                    style: TextStyle(
                                      color: BorW
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade900,
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      color: BorW
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade900,
                                    ),
                                  ),
                                  Text(
                                    _currentPosition.inSeconds.remainder(60).toString().padLeft(2,"0"),
                                    style: TextStyle(
                                      color: BorW
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    _totalDuration.inMinutes.remainder(60).toString().padLeft(2,"0"),
                                    style: TextStyle(
                                      color: BorW
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade900,
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: TextStyle(
                                      color: BorW
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade900,
                                    ),
                                  ),
                                  Text(
                                    _totalDuration.inSeconds.remainder(60).toString().padLeft(2,"0"),
                                    style: TextStyle(
                                      color: BorW
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 24, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shuffle_rounded,
                            size: 32,
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade900,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Provider.of<ProviderFile>(context, listen: false)
                                .PRESONG();
                            d();
                          },
                          icon: Icon(
                            Icons.skip_previous_outlined,
                            size: 32,
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade900,
                          ),
                        ),
                    IconButton(onPressed: (){
                       setState(() {
                       pp? Provider.of<ProviderFile>(context, listen: false).mute(): Provider.of<ProviderFile>(context, listen: false).mmuute();
                         pp?   _controller.forward(): _controller.reverse();
                          pp=!pp;
                       });
                    } ,icon:AnimatedIcon(icon: AnimatedIcons.pause_play,size: 34, progress: _controller )),

                        IconButton(
                          onPressed: () async {
                            List l = Provider.of<ProviderFile>(context,
                                    listen: false)
                                .Songss;
                            int o = Provider.of<ProviderFile>(context,
                                    listen: false)
                                .ListIndex;
                            Provider.of<ProviderFile>(context, listen: false)
                                .NEXTSONG();
                            d();
                          },
                          icon: Icon(
                            Icons.skip_next_outlined,
                            size: 32,
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade900,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Provider.of<ProviderFile>(context, listen: false)
                                .playAudio(index.toString());
                          },
                          icon: Icon(
                            Icons.repeat,
                            size: 32,
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade900,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
