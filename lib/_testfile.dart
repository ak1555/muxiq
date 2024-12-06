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
//     FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);
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
//        await _audioPlayer.play(_filePath!,volume: 100);
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









// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

import 'package:file_picker/file_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'song.dart';  // Import your Song model

class SongPickerScreen extends StatefulWidget {
  @override
  _SongPickerScreenState createState() => _SongPickerScreenState();
}

class _SongPickerScreenState extends State<SongPickerScreen> {
  late Box<Song> songBox;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  // Initialize Hive box
  Future<void> _initHive() async {
    songBox = await Hive.openBox<Song>('songs');
  }

  // Pick and store song
  Future<void> _pickAndStoreSong() async {
    // Request storage permission
    await requestPermission();

    // Pick a song file
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);

    if (result != null) {
      String filePath = result.files.single.path!;
      String fileName = result.files.single.name;

      // Create a Song object and store in Hive
      Song song = Song(name: fileName, filePath: filePath);
      await songBox.add(song);

      setState(() {});
    }
  }

  // Display stored songs
  List<Widget> _buildSongList() {
    return songBox.values.map((song) {
      return ListTile(
        title: Text(song.name),
        subtitle: Text(song.filePath),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick Songs')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _pickAndStoreSong,
            child: Text('Pick and Store Song'),
          ),
          Expanded(
            child: ListView(
              children: _buildSongList(),
            ),
          ),
        ],
      ),
    );
  }
}
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
// ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
import 'package:audioplayers/audioplayers.dart';

class SongPlayerScreen extends StatefulWidget {
  final Song song;

  SongPlayerScreen({required this.song});

  @override
  _SongPlayerScreenState createState() => _SongPlayerScreenState();
}

class _SongPlayerScreenState extends State<SongPlayerScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  void _playSong() async {
    await _audioPlayer.play(widget.song.filePath, isLocal: true);
  }

  void _stopSong() async {
    await _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.song.name)),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _playSong,
            child: Text('Play'),
          ),
          ElevatedButton(
            onPressed: _stopSong,
            child: Text('Stop'),
          ),
        ],
      ),
    );
  }
}



























