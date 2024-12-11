import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:muxiq/main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class ProviderFile extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<File> Songss = [];
  List LS = [false,false];

  dynamic? i;
// bool? Isplay;

 bool _isPlaying = false;
  bool get isPlaying => _isPlaying;


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
      // LS[1]=true;
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
        //  LS[1]=false;
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
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
