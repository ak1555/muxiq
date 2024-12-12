// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:just_audio/just_audio.dart';

// class AudioPlayerService extends ChangeNotifier {
//   final AudioPlayer _audioPlayer = AudioPlayer();

//   // List of song URIs (local or remote)
//    List<String> ls = [];
// var mybox = Hive.box("mybox");
// void addtolist(){
//   ls=mybox.get(11);
// }

//   Future<void> initializePlaylist() async {
//     final playlist = ConcatenatingAudioSource(
//       children: ls.map((song) => AudioSource.uri(Uri.parse(song))).toList(),
//     );

//     // Set the playlist
//     await _audioPlayer.setAudioSource(playlist);
//     notifyListeners();
//   }

//   Future<void> play() async {
//     _audioPlayer.play();
//   }

//   Future<void> pause() async {
//     _audioPlayer.pause();
//   }

//   Future<void> next() async {
//     _audioPlayer.seekToNext();
//   }

//   Future<void> previous() async {
//     _audioPlayer.seekToPrevious();
//   }

//   void dispose() {
//     _audioPlayer.dispose();
//   }
// }
