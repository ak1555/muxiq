import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:just_audio/just_audio.dart';
import 'package:muxiq/main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class ProviderFile extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioPlayer _playaudio = AudioPlayer();
  List<File> Songss = [];
  List lils = [];
    var mybox = Hive.box('mybox');

  //  bool ppp=false;
    bool isMuted = false;
  List LS = [false];
  int _currentIndex = 0;
  dynamic? i;
// bool? Isplay;

 bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  // int get currentIndex => _currentIndex;

  void setnames(songname) {
    i = songname;
    notifyListeners();
  }

  // void setplayorpause(playpause) {
  //   LS[1] = playpause;
  //   notifyListeners();
  // }

  void blckandwhte(bool t) {
    LS[0] = t;
    notifyListeners();
  }

  void ak() {
    // _loadAudioFiles();
    _requestPermissions();
    initializePlaylist();
   lils= mybox.get(11);
  }

  void _requestPermissions() async {
    // unnecessaryyyyyyyyyyyyyyy
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();

    var storage = statuses[Permission.storage];
    var manageExternalStorage = statuses[Permission.manageExternalStorage];
    // unnecessaryyyyyyyyyyyyyyy

    var status = await Permission.storage.request();
    if (status.isGranted || await Permission.manageExternalStorage.isGranted) {
      _loadAudioFiles();
    } else {
      // Handle permission denial
      print('Permission denied');
    }
    notifyListeners();
  }

  Future<void> _loadAudioFiles() async {
    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      print("Failed to get external directory");
      return;
    }
    print("AUDIO FILES======================");
    print(directory);

    // Assuming that music files are in the `Music` folder, you can change this path as per your needs.
    try {
      final musicDirectory = Directory('${directory.path}');
      // final musicDirectory = Directory('/storage/emulated/0/Music');
      if (await musicDirectory.exists()) {
        final audioFiles = musicDirectory
            .listSync()
            .where((file) =>
                file is File &&
                (file.path.endsWith('.mp3') || file.path.endsWith('.m4a')))
            .map((file) => file as File)
            .toList();

        Songss = audioFiles;
               print("<<<<<<<<<<<<<<<<<<<<<<+++++++++++++++++++SONGS LIST+++++++++++++++++++++++++++>>>>>>>>>>>>>>>>>>>>>>");
        print(Songss[1].toString());
        mybox.put(10, Songss);
        
      }
    } catch (e) {
      print("EXCEPTION");
      print(e);
    }
    notifyListeners();
  }

  void playAudio(String filePath) async {
    try {
      await _audioPlayer.setFilePath(filePath);
      _audioPlayer.play();
      _isPlaying=true;
      _isPlaying=true;
    } on PlayerException catch (e) {
      print("Error loading file: $e");
    }

    notifyListeners();
  }

  void pauseAudio(String filePath) async {
    try {
      await _audioPlayer.setFilePath(filePath);
      _audioPlayer.stop();
         _isPlaying=false;
        _isPlaying=false;
    } on PlayerException catch (e) {
      print("Error loading file: $e");
    }

    notifyListeners();
  }

    void toggleAudio(String url) async {
    if (_isPlaying) {
       pauseAudio(url);
    } else {
       playAudio(url);
    }
    notifyListeners();
  }



  void mute()async{
    if(_audioPlayer.volume ==0){
  await _audioPlayer.setVolume(100);
    await _audioPlayer.play();
  _isPlaying=false;
    }else{
        await _audioPlayer.stop();
        await _audioPlayer.setVolume(0);
        _isPlaying=true;
    }
  notifyListeners();
  }






  void toggleMute() {
    isMuted = !isMuted;
    _audioPlayer.setVolume(isMuted ? 0.0 : 1.0);  
    notifyListeners();  
  }


    Future<void> playNext() async {
    //   print("playnext");
    // if (_currentIndex < Songss.length - 1) {
    //   _currentIndex++;
    //   await _audioPlayer.seek(Duration.zero, index: _currentIndex);
    //   await _audioPlayer.play();
    //   notifyListeners();
    // }
    _audioPlayer.seekToNext();
  }


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  Future<void> initializePlaylist() async {
    final playlist = ConcatenatingAudioSource(
      children: lils.map((song) => AudioSource.uri(Uri.parse(song))).toList(),
    );

    // Set the playlist
    await _playaudio.setAudioSource(playlist);
    notifyListeners();
  }

  Future<void> favplay() async {
 try {
      print(_playaudio);
    _playaudio.play();
     notifyListeners();
 } catch (e) {
   print(e);
 }
  }

  Future<void> favpause() async {
    _playaudio.pause();
     notifyListeners();
  }

  Future<void> favnxt() async {
    _playaudio.seekToNext();
     notifyListeners();
  }

  Future<void> favprevious() async {
    _playaudio.seekToPrevious();
     notifyListeners();
  }

  // void dispose() {
  //   _audioPlayer.dispose();
  // }
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




  @override
  void dispose() {
    _audioPlayer.dispose();
    _playaudio.dispose();
    super.dispose();
  }
}
