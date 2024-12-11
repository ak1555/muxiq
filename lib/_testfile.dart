// // import 'package:flutter/material.dart';
// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:file_picker/file_picker.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Audio Player',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: AudioPlayerExample(),
// //     );
// //   }
// // }

// // class AudioPlayerExample extends StatefulWidget {
// //   @override
// //   _AudioPlayerExampleState createState() => _AudioPlayerExampleState();
// // }

// // class _AudioPlayerExampleState extends State<AudioPlayerExample> {
// //   final AudioPlayer _audioPlayer = AudioPlayer();
// //   late final _filePath;

// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   // Request storage permissions
// //   Future<void> _requestPermissions() async {
// //     PermissionStatus status = await Permission.storage.request();
// //     if (status.isGranted) {
// //       print("Storage permission granted.");
// //     } else {
// //       print("Storage permission denied.");
// //     }
// //   }

// //   // Pick a file from the device's storage
// //   Future<void> _pickFile() async {
// //     FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);
// //     if (result != null) {
// //       setState(() {
// //         _filePath = result.files.single.path;
// //       });
// //       _playAudio();
// //     } else {
// //       print("No file selected");
// //     }
// //   }

// //   // Play the selected audio file
// //   void _playAudio() async {
// //     if (_filePath != null) {
// //       // await _audioPlayer.play(_filePath!, isLocal: true);
// //        await _audioPlayer.play(_filePath!,volume: 100);
// //     }
// //   }

// //   // Stop the audio playback
// //   void _stopAudio() async {
// //     await _audioPlayer.stop();
// //   }

// //   @override
// //   void dispose() {
// //     _audioPlayer.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Play Audio from Phone'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             ElevatedButton(
// //               onPressed: () async {
// //                 await _requestPermissions();
// //                 _pickFile();
// //               },
// //               child: Text('Pick and Play Audio'),
// //             ),
// //             ElevatedButton(
// //               onPressed: _stopAudio,
// //               child: Text('Stop Audio'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }









// // :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// // :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// // :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// // :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

// import 'package:file_picker/file_picker.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'song.dart';  // Import your Song model

// class SongPickerScreen extends StatefulWidget {
//   @override
//   _SongPickerScreenState createState() => _SongPickerScreenState();
// }

// class _SongPickerScreenState extends State<SongPickerScreen> {
//   late Box<Song> songBox;

//   @override
//   void initState() {
//     super.initState();
//     _initHive();
//   }

//   // Initialize Hive box
//   Future<void> _initHive() async {
//     songBox = await Hive.openBox<Song>('songs');
//   }

//   // Pick and store song
//   Future<void> _pickAndStoreSong() async {
//     // Request storage permission
//     await requestPermission();

//     // Pick a song file
//     FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);

//     if (result != null) {
//       String filePath = result.files.single.path!;
//       String fileName = result.files.single.name;

//       // Create a Song object and store in Hive
//       Song song = Song(name: fileName, filePath: filePath);
//       await songBox.add(song);

//       setState(() {});
//     }
//   }

//   // Display stored songs
//   List<Widget> _buildSongList() {
//     return songBox.values.map((song) {
//       return ListTile(
//         title: Text(song.name),
//         subtitle: Text(song.filePath),
//       );
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Pick Songs')),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: _pickAndStoreSong,
//             child: Text('Pick and Store Song'),
//           ),
//           Expanded(
//             child: ListView(
//               children: _buildSongList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// // ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// // ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// import 'package:audioplayers/audioplayers.dart';

// class SongPlayerScreen extends StatefulWidget {
//   final Song song;

//   SongPlayerScreen({required this.song});

//   @override
//   _SongPlayerScreenState createState() => _SongPlayerScreenState();
// }

// class _SongPlayerScreenState extends State<SongPlayerScreen> {
//   late AudioPlayer _audioPlayer;

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer = AudioPlayer();
//   }

//   void _playSong() async {
//     await _audioPlayer.play(widget.song.filePath, isLocal: true);
//   }

//   void _stopSong() async {
//     await _audioPlayer.stop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.song.name)),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: _playSong,
//             child: Text('Play'),
//           ),
//           ElevatedButton(
//             onPressed: _stopSong,
//             child: Text('Stop'),
//           ),
//         ],
//       ),
//     );
//   }
// }



// // ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// // ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// // ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// // ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;








// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/services.dart';

// class AudioPlayerPage extends StatefulWidget {
//   @override
//   _AudioPlayerPageState createState() => _AudioPlayerPageState();
// }

// class _AudioPlayerPageState extends State<AudioPlayerPage> {

  
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   List<File> _audioFiles = [];

//   @override
//   void initState() {
//     super.initState();
//     _requestPermissions();
//   }

//   // Request necessary permissions
//   void _requestPermissions() async {
//     var status = await Permission.storage.request();
//     if (status.isGranted) {
//       _loadAudioFiles();
//     } else {
//       // Handle permission denial
//       print('Permission denied');
//     }

//   }

//   // Load audio files from the device
//   Future<void> _loadAudioFiles() async {
//     final directory = await getExternalStorageDirectory();
//     if (directory == null) {
//       print("Failed to get external directory");
//       return;
//     }
//          print("AUDIO FILES======================");
//     print(directory);
    
//     // Assuming that music files are in the `Music` folder, you can change this path as per your needs.
//    try {
//       // final musicDirectory = Directory('${directory.path}/Music');
//       final musicDirectory = Directory('/storage/emulated/0/Music');
//     if (await musicDirectory.exists()) {
//       final audioFiles = musicDirectory
//           .listSync()
//           .where((file) =>
//               file is File && (file.path.endsWith('.mp3') || file.path.endsWith('.wav')))
//           .map((file) => file as File)
//           .toList();

//       setState(() {
//         _audioFiles = audioFiles;
//       });
     
    
//     }
//    } catch (e) {
//     print("EXCEPTION");
//      print(e);
//    }
    
//   }

//   // Play selected audio
//   void _playAudio(String filePath) async {
//     try {
//       await _audioPlayer.setFilePath(filePath);
//       _audioPlayer.play();
//     } on PlayerException catch (e) {
//       print("Error loading file: $e");
//     }
//   }


//    void _pauseAudio(String filePath) async {
//     try {
//       await _audioPlayer.setFilePath(filePath);
//       _audioPlayer.stop();
//     } on PlayerException catch (e) {
//       print("Error loading file: $e");
//     }
//   }


//   void _loop(String filePath) async {
//     try {
//       await _audioPlayer.setFilePath(filePath);
//       _audioPlayer.setVolume(100);
//     } on PlayerException catch (e) {
//       print("Error loading file: $e");
//     }
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
//         title: Text('Local Music Player'),
//       ),
//       body: _audioFiles.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: _audioFiles.length,
//               itemBuilder: (context, index) {
//                 final audioFile = _audioFiles[index];
//                 return ListTile(
//                   title: Text(audioFile.uri.pathSegments.last),
//                   onTap: () => _playAudio(audioFile.path),
//                   trailing: IconButton(onPressed: () {
//                     _pauseAudio(audioFile.path);
//                   }, icon: Icon(Icons.abc)),
//                 );
//               },
//             ),
//     );
//   }
// }

















// import 'package:flutter/material.dart';
// import 'package:audio_waveforms/audio_waveforms.dart';

// class WaveformPlayer extends StatefulWidget {
//   @override
//   _WaveformPlayerState createState() => _WaveformPlayerState();
// }

// class _WaveformPlayerState extends State<WaveformPlayer> {
//   late WaveController _waveController;

//   @override
//   void initState() {
//     super.initState();
//     _waveController = WaveController();
//     // Load waveform data from audio file
//     _waveController.loadAudioFile(path: "assets/song.mp3");
//   }

//   @override
//   void dispose() {
//     _waveController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Waveform Slider'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Display waveform
//             AudioFileWaveforms(
//               size: Size(MediaQuery.of(context).size.width, 100),
//               waveController: _waveController,
//               playerWaveStyle: PlayerWaveStyle(
//                 waveColor: Colors.blue,
//                 scaleFactor: 1.5,
//               ),
//             ),
//             SizedBox(height: 20),
//             // Play / Pause Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.play_arrow),
//                   onPressed: () {
//                     _waveController.play();
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.pause),
//                   onPressed: () {
//                     _waveController.pause();
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// permissions{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
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

// }}}}}}}}}}}}}}}}}}}}}}}}}}}}}