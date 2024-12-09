import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:muxiq/Provider/providerfile.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
List<File> _audioFiles = [];

  late bool BorW;
  void d() async{
    //  Provider.of<ProviderFile>(context,listen: false).blckandwhte(true);
    BorW = Provider.of<ProviderFile>(context, listen: false).LS[0];
    //  await Provider.of<ProviderFile>(context,listen: false)._loadAudioFiles;
     Provider.of<ProviderFile>(context,listen: false).ak();
    ProviderFile p =ProviderFile();
    
    print(BorW);
  }

  @override
  void initState() async{
    // TODO: implement initState
    super.initState();
    d();
    // _requestPermissions();
    Provider.of(context,listen: false)._requestPermissions;
    
  }

  //______________________________________________________________________________________________________________________________________________________
  // final AudioPlayer _audioPlayer = AudioPlayer();
  // List<File> _audioFiles = [];

  // // @override
  // // void initState() {
  // //   super.initState();
  // //   _requestPermissions();
  // // }

  // // Request necessary permissions

  // void _requestPermissions() async {
  //   // unnecessaryyyyyyyyyyyyyyy
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.storage,
  //     Permission.manageExternalStorage,
  //   ].request();

  //   var storage = statuses[Permission.storage];
  //   var manageExternalStorage = statuses[Permission.manageExternalStorage];
  //   // unnecessaryyyyyyyyyyyyyyy

  //   var status = await Permission.storage.request();
  //   if (status.isGranted || await Permission.manageExternalStorage.isGranted) {
  //     _loadAudioFiles();
  //   } else {
  //     // Handle permission denial
  //     print('Permission denied');
  //   }
  // }

  // // Load audio files from the device
  // Future<void> _loadAudioFiles() async {
  //   final directory = await getExternalStorageDirectory();
  //   if (directory == null) {
  //     print("Failed to get external directory");
  //     return;
  //   }
  //   print("AUDIO FILES======================");
  //   print(directory);

  //   // Assuming that music files are in the `Music` folder, you can change this path as per your needs.
  //   try {
  //     final musicDirectory = Directory('${directory.path}');
  //     // final musicDirectory = Directory('/storage/emulated/0/Music');
  //     if (await musicDirectory.exists()) {
  //       final audioFiles = musicDirectory
  //           .listSync()
  //           .where((file) =>
  //               file is File &&
  //               (file.path.endsWith('.mp3') || file.path.endsWith('.m4a')))
  //           .map((file) => file as File)
  //           .toList();

  //       setState(() {
  //         _audioFiles = audioFiles;
  //       });
  //     }
  //   } catch (e) {
  //     print("EXCEPTION");
  //     print(e);
  //   }
  // }

  // // Play selected audio
  // void _playAudio(String filePath) async {
  //   try {
  //     await _audioPlayer.setFilePath(filePath);
  //     _audioPlayer.play();
  //   } on PlayerException catch (e) {
  //     print("Error loading file: $e");
  //   }
  // }

  // void _pauseAudio(String filePath) async {
  //   try {
  //     await _audioPlayer.setFilePath(filePath);
  //     _audioPlayer.stop();
  //   } on PlayerException catch (e) {
  //     print("Error loading file: $e");
  //   }
  // }

  // void _loop(String filePath) async {
  //   try {
  //     await _audioPlayer.setFilePath(filePath);
  //     _audioPlayer.setVolume(100);
  //   } on PlayerException catch (e) {
  //     print("Error loading file: $e");
  //   }
  // }

  // @override
  // void dispose() {
  //   _audioPlayer.dispose();
  //   super.dispose();
  // }

  // PermissionStatus _permissionStatus = PermissionStatus.denied;

  // Future<void> _askStoragePermission() async {
  //   debugPrint(" ---------------- Asking for permission...");
  //   await Permission.manageExternalStorage.request();
  //   if (await Permission.manageExternalStorage.request().isGranted) {
  //     print("granded??");
  //     PermissionStatus permissionStatus =
  //         await Permission.manageExternalStorage.status;
  //     setState(() {
  //       _permissionStatus = permissionStatus;
  //     });
  //   }
  // }

  // _____________________________________________________________________________________________________________________________________________________

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
                          // border: Border.all(),
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
                          // border: Border.all(),
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
                // gradient: LinearGradient(colors: [Colors.grey.shade200,Colors.grey.shade50,Colors.grey.shade50])
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

          //  SizedBox(height: 400,),
          Container(
            height: 400,
            width: double.infinity,
            child: ListView.builder(
             
              itemCount: _audioFiles.length,
              itemBuilder: (context, index) {
                final audioFile = _audioFiles[index];
                return ListTile(
                  title: Text(
                    audioFile.uri.pathSegments.last,
                    style: TextStyle(
                        color:
                            BorW ? Colors.grey.shade200 : Colors.grey.shade800),
                  ),
                  onTap: () {
                    // _playAudio(audioFile.path);
                    Provider.of(context,listen: false)._playAudio(audioFile.path);
                    print("''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''");
                     print(audioFile);
                    print("''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''");
                   
                  },
                  trailing: IconButton(
                      onPressed: () {
                        // _pauseAudio(audioFile.path);
                         Provider.of(context,listen: false)._pauseAudio(audioFile.path);
                      },
                      icon: Icon(Icons.play_arrow,
                          color: BorW
                              ? Colors.grey.shade200
                              : Colors.grey.shade800)),
                );
              },
            ),
          ),

          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                    color: BorW ? Colors.grey.shade400 : Colors.grey.shade800)),
            // child: TextButton(
                // onPressed: _askStoragePermission, child: Text("permission")),
          )
        ],
      ),
    );
  }
}
