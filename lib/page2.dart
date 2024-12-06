import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:muxiq/Provider/providerfile.dart';
import 'package:muxiq/main.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  bool play = true;
  bool lyrics = false;
  bool favorite = false;
  bool pause = false;

  late bool BorW;
  void d() {
    //  Provider.of<ProviderFile>(context,listen: false).blckandwhte(true);
    BorW = Provider.of<ProviderFile>(context, listen: false).LS[0];
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
    return Container(
      // color: const Color.fromARGB(255, 255, 255, 255),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: BorW
                  ? [Colors.black, const Color.fromARGB(255, 66, 66, 66)]
                  : [Colors.grey.shade100, Colors.grey.shade50])),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: Center(
              child: Text(
                "PLAYLIST",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: BorW ? Colors.grey.shade200 : Colors.black),
              ),
              // child: Text(
              //   "Now Playing",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              // ),
            ),
          ),
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
                      color: BorW ? Colors.grey.shade200 : Colors.grey.shade900,
                    )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("Song Name",
                          style: TextStyle(
                              color: BorW
                                  ? Colors.grey.shade200
                                  : Colors.grey.shade900,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                    Text(
                      "playlist",
                      style: TextStyle(
                        color:
                            BorW ? Colors.grey.shade200 : Colors.grey.shade900,
                      ),
                    )
                  ],
                )),
                IconButton(
                    onPressed: () {
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
            height: 65,
            width: double.infinity,
            margin: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      size: 17,
                      color: BorW ? Colors.grey.shade200 : Colors.grey.shade900,
                    ),
                    SizedBox(
                      width: 2.5,
                    ),
                    Expanded(
                      child: Container(
                        height: 1.5,
                        // width: double.infinity,
                        color:
                            BorW ? Colors.grey.shade200 : Colors.grey.shade900,
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
          SizedBox(
            height: 11,
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
                  icon: Icon(Icons.shuffle_rounded, size: 32, color:  BorW?Colors.grey.shade200:Colors.grey.shade900, ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous_outlined,
                    size: 32,
                     color:  BorW?Colors.grey.shade200:Colors.grey.shade900,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      pause = !pause;
                    });
                  },
                  icon: pause
                      ? Icon(
                          Icons.pause_circle_outline_rounded,
                          size: 52,
                           color:  BorW?Colors.grey.shade200:Colors.grey.shade900,
                        )
                      : Icon(
                          Icons.play_circle_outline_rounded,
                          size: 52,
                           color:  BorW?Colors.grey.shade200:Colors.grey.shade900,
                        ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_next_outlined, size: 32, color:  BorW?Colors.grey.shade200:Colors.grey.shade900,),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.repeat, size: 32, color:  BorW?Colors.grey.shade200:Colors.grey.shade900,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
