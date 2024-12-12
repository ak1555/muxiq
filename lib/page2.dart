import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:muxiq/Provider/providerfile.dart';
import 'package:muxiq/main.dart';
import 'package:muxiq/page1.dart';
import 'package:provider/provider.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {



  bool play = true;
  bool lyrics = false;
  bool favorite = false;
  bool pause = true;

String? index;
List ls=[];

  var mybox = Hive.box('mybox');
    final AudioPlayer _audioPlayer = AudioPlayer();

     bool isMuted = false;

     void toggleMute() {
      _audioPlayer.setAsset('index');
      print("<<<<<<<<<<<<<<<<<<<mutedfunction>>>>>>>>>>>>>>>>>>>");
      print(index);
    setState(() {
      if (isMuted) {
        _audioPlayer.setVolume(1.0);  // Unmute
      } else {
        _audioPlayer.setVolume(0);  // Mute
      }
      isMuted = !isMuted;
    });
   
  }


  double sliderValue = 0;
  Duration max = const Duration(seconds: 120);

  Duration _songDuration = Duration.zero;
  Duration _currentPosition = Duration.zero;

  late bool BorW;
  late bool _issongPlayed;

  void d() {
    //  Provider.of<ProviderFile>(context,listen: false).blckandwhte(true);

    setState(() {
      BorW = Provider.of<ProviderFile>(context, listen: false).LS[0];
      _issongPlayed = Provider.of<ProviderFile>(context, listen: false).LS[1];
       ls=mybox.get(22);
      // if(mybox.get(22)!=null){
      //   ls=mybox.get(22);
      // }
      // else{
      //   print("==========mybox 22 is null");
      // }
      print("MMMMMMMMMMM HIVE LS");
      print(ls);
    });
    print(BorW);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    d();
  }

  @override
  Widget build(BuildContext context) {
     index = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            BorW ? const Color.fromARGB(255, 66, 66, 66) : Colors.grey.shade100,
        title: Text(
          "PLAYLIST",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: BorW ? Colors.grey.shade200 : Colors.black),
        ),
      ),
      body: Container(
        // color: const Color.fromARGB(255, 255, 255, 255),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: BorW
                    ? [Colors.black, const Color.fromARGB(255, 66, 66, 66)]
                    : [Colors.grey.shade100, Colors.grey.shade50])),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Container(
            //   height: 50,
            //   width: double.infinity,
            //   child: Center(
            //     child: Text(
            //       "PLAYLIST",
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 19,
            //           color: BorW ? Colors.grey.shade200 : Colors.black),
            //     ),
            //     // child: Text(
            //     //   "Now Playing",
            //     //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            //     // ),
            //   ),
            // ),
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
                            // gradient: RadialGradient(
                            //   colors: [
                            //     Colors.grey.shade50,
                            //     Colors.grey.shade400
                            //   ],
                            // )
                          ),
                          // child: ClipRRect(
                          //   borderRadius: BorderRadius.circular(150),
                          //   child: Image.asset(
                          //     "./images/mm.png",
                          //     fit: BoxFit.cover,
                          //     color: Colors.grey.shade300,
                          //     colorBlendMode: BlendMode.modulate,
                          //   ),
                          // ),
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              pause
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
                                      "./images/music-logo-png-2350.png",
                                      fit: BoxFit.cover,
                                      color: Colors.grey.shade300,
                                      colorBlendMode: BlendMode.modulate,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // child: Container(
                          //   height: 240,
                          //   width: 240,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(150),
                          //     color: Colors.white,
                          //   ),
                          //   child: ClipRRect(
                          //   borderRadius: BorderRadius.circular(150),
                          //   child: Image.asset(
                          //     "./images/music-logo-png-2350.png",
                          //     fit: BoxFit.cover,
                          //     color: Colors.grey.shade300,
                          //     colorBlendMode: BlendMode.modulate,
                          //   ),
                          // ),
                          // ),
                        ),
                        // SizedBox(height: 50,),
                        // Text("Song Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
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
                              child: Text(
                                  Provider.of<ProviderFile>(context,
                                          listen: false)
                                      .i,
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
                                // toggleMute();
                              },
                              icon: Icon(
                                Icons.mic_off,
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
//                                 // width: double.infinity,
//                                 // color: BorW
//                                 //     ? Colors.grey.shade200
//                                 //     : Colors.grey.shade900,
                                child: Slider(
                                  min: 0.0,
                                  max: _songDuration.inSeconds.toDouble(),
                                  value: _currentPosition.inSeconds
                                      .toDouble()
                                      .clamp(0.0,
                                          _songDuration.inSeconds.toDouble()),
                                  onChanged: (value) {
                                    // Seek to the new position
                                    // Provider.of<ProviderFile>(context,listen: false).seeeek(Duration(seconds: value.toInt()));
                                  },
                                ),

// Row(
//             children: [
//               Text('${sliderValue.toInt()}'),
//               Slider(
//                   value: sliderValue,
//                   min: 0,
//                   max: max.inSeconds.toDouble(),
//                   onChanged: (double value){
//                     // setState(() {
//                     //   sliderValue = value;
//                     // });
//                   }
//               ),
//               Text('${max.inMinutes}')
//             ],
//           ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "    0:00",
                                style: TextStyle(
                                  color: BorW
                                      ? Colors.grey.shade200
                                      : Colors.grey.shade900,
                                ),
                              ),
                              Text(
                                "04:30",
                                style: TextStyle(
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

                  // SizedBox(
                  //   height: 25,
                  // ),
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
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_previous_outlined,
                            size: 32,
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade900,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Provider.of<ProviderFile>(context,listen: false).toggleAudio(index);
                            Provider.of<ProviderFile>(context, listen: false)
                                .mute();
                            d();
                          },
                          icon: _issongPlayed
                              ? Icon(
                                  Icons.play_circle_outline_rounded,
                                  size: 53,
                                  color: BorW
                                      ? Colors.grey.shade200
                                      : Colors.grey.shade900,
                                )
                              : Icon(
                                  Icons.pause_circle_outline_rounded,
                                  size: 53,
                                  color: BorW
                                      ? Colors.grey.shade200
                                      : Colors.grey.shade900,
                                ),
                        ),
                        IconButton(
                          onPressed: () {
                           print(ls.length);
                            for (int i = 0;i<ls.length;i++){
                             
                              if(ls[i]==index){
                              print(i);
                            }
                            else{
                              print("no");
                            }
                            }
                            print("skip");
                            Provider.of<ProviderFile>(context, listen: false)
                                .next();
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
                                .playAudio(index!);
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
