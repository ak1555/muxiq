import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:muxiq/LoginPage.dart';
import 'package:muxiq/Provider/providerfile.dart';
import 'package:muxiq/_testfile.dart';
import 'package:muxiq/favext.dart';
// import 'package:muxiq/_testfile.dart';
import 'package:muxiq/page1.dart';
import 'package:muxiq/page2.dart';
import 'package:muxiq/page3.dart';
import 'package:muxiq/page4.dart';
import 'package:provider/provider.dart';

void main()async {
  await Hive.initFlutter();
 var box = await Hive.openBox("mybox");
  runApp(
    // MyApp()
    ChangeNotifierProvider(create: (context) =>ProviderFile() ,
    child: MaterialApp(
      home: HomePage(),
      routes: {
        "main":(context)=>HomePage(),
        'page2':(context)=>Page2(),
        "fav":(context)=>FavPage2()
      },
    )
    )

    );

}


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyApp(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int pageIndex = 0;

  final pages = [
    const Page1(),
    const Page3(),
    const Page4(),
  ];

   late  bool BorW;

    void d(){
  //  Provider.of<ProviderFile>(context,listen: false).blckandwhte(true);
  BorW = Provider.of<ProviderFile>(context,listen: false).LS[0];
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

    return Scaffold(
      backgroundColor:BorW? Colors.grey.shade900:const Color.fromARGB(255, 255, 255, 255),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 62,
      margin: EdgeInsets.only(bottom: 5, left: 12, right: 12),
      decoration: BoxDecoration(
          // color: Theme.of(context).primaryColor,
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(20),
          //   topRight: Radius.circular(20),
          // ),
          gradient: LinearGradient(colors: BorW ? [Colors.black,const Color.fromARGB(255, 46, 46, 46)]:[Colors.grey.shade200,Colors.grey.shade100]),
          border: Border.all(
            // color: Colors.grey.shade700,
             color: BorW ? Colors.grey.shade300 : Colors.grey.shade700,
            width: 2),
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
                ?  Icon(
                    Icons.home_filled,
                    color: BorW ? Colors.grey.shade400:const Color.fromARGB(255, 73, 73, 73),
                    size: 33,
                  )
                :  Icon(
                    Icons.home_outlined,
                    color: BorW ? Colors.grey.shade400:const Color.fromARGB(255, 73, 73, 73),
                    //  color:Color.fromARGB(255, 117, 117, 117),

                    size: 33,
                  ),
          ),
          // MaterialButton(
          //     enableFeedback: false,
          //     onPressed: () {
          //       setState(() {
          //         pageIndex = 1;
          //       });
          //     },
          //     child: Image(height: 34,width: 34
          //     ,color:BorW ? Colors.grey.shade400:const Color.fromARGB(255, 73, 73, 73),
          //         image: pageIndex == 1
          //             ? AssetImage("./images/music-logo-png-2350.png")
          //             : AssetImage("./images/music.png"))

          //     ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.favorite,
                  //  color: const Color.fromARGB(255, 73, 73, 73),
                  color: Color.fromARGB(255, 228, 93, 83),
                    size: 33,
                  )
                :  Icon(
                    Icons.favorite_border,
                    // color: const Color.fromARGB(255, 73, 73, 73),
                    color:BorW ? Colors.grey.shade400:const Color.fromARGB(255, 73, 73, 73),
                    size: 33,
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
                ?  Icon(
                    Icons.person,
                   color:BorW ? Colors.grey.shade400:const Color.fromARGB(255, 73, 73, 73),
                    size: 33,
                  )
                :  Icon(
                    Icons.person_outline,
                  //  color: const Color.fromARGB(255, 73, 73, 73),
                   color:BorW ? Colors.grey.shade400:const Color.fromARGB(255, 73, 73, 73),
                    size: 33,
                  ),
          ),
        ],
      ),
    );
  }
}



// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa









// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:file_picker/file_picker.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Audio Player',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: AudioPlayerExample(),
//     );
//   }
// }

// class AudioPlayerExample extends StatefulWidget {
//   @override
//   _AudioPlayerExampleState createState() => _AudioPlayerExampleState();
// }

// class _AudioPlayerExampleState extends State<AudioPlayerExample> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   late final _filePath;

//   @override
//   void initState() {
//     super.initState();
//   }

//   // Request storage permissions
//   Future<void> _requestPermissions() async {
//     PermissionStatus status = await Permission.storage.request();
//     if (status.isGranted) {
//       print("Storage permission granted.");
//     } else {
//       print("Storage permission denied.");
//     }
//   }

//   // Pick a file from the device's storage
//   Future<void> _pickFile() async {
//     FilePickerResult? result =
//         await FilePicker.platform.pickFiles(type: FileType.audio);
//     if (result != null) {
//       setState(() {
//         _filePath = result.files.single.path;
//       });
//       _playAudio();
//     } else {
//       print("No file selected");
//     }
//   }

//   // Play the selected audio file
//   void _playAudio() async {
//     if (_filePath != null) {
//       // await _audioPlayer.play(_filePath!, isLocal: true);
//       await _audioPlayer.play(_filePath!, volume: 100);
//     }
//   }

//   // Stop the audio playback
//   void _stopAudio() async {
//     await _audioPlayer.stop();
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Play Audio from Phone'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () async {
//                 await _requestPermissions();
//                 _pickFile();
//               },
//               child: Text('Pick and Play Audio'),
//             ),
//             ElevatedButton(
//               onPressed: _stopAudio,
//               child: Text('Stop Audio'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
