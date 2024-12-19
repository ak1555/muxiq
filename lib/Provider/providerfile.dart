import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:just_audio/just_audio.dart';
import 'package:muxiq/main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ProviderFile extends ChangeNotifier {
  final AudioPlayer audioPlayer = AudioPlayer();
  // final AudioPlayer _playaudio = AudioPlayer();
  List<File> Songss = [];
  List lils = [];
    var mybox = Hive.box('mybox');

    List SOngNAme=[];

  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
int ListIndex=0;
  //  bool ppp=false;
    bool isMuted = false;
  List LS = [false];
  int _currentIndex = 0;
  dynamic i;
// bool? Isplay;

 bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  // int get currentIndex => _currentIndex;

  // void setnames(songname) {
  //   i = songname;
  //   notifyListeners();
  // }

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
    // initializePlaylist();
  if(mybox.get(11)!=null){
    lils= mybox.get(11);
  }
  else{
    print("HIVE NULLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
  }
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
        print(Songss);
        mybox.put(10, Songss);

        setnames();
      }
    } catch (e) {
      print("EXCEPTION");
      print(e);
    }
    notifyListeners();
  }


  void setnames(){
    try {    
for(int k=0;k<=Songss.length;k++){
    String a = Songss[k].toString();

                    List snn = a.split('/');

                    String b = snn[snn.length - 1].toString();
                    List EDse = b.split('-');
                   String song = EDse[0];
                    SOngNAme.add(song);
                    // List kkkk = c.split(',');
                    // singer = kkkk[0];
}
    } catch (e) {
      print(e);
    }
notifyListeners();


  }

  void playAudio(String filePath) async {
    try {
      await audioPlayer.setFilePath(filePath);
      audioPlayer.play();
      _isPlaying=true;
      _isPlaying=true;
    } on PlayerException catch (e) {
      print("Error loading file: $e");
    }

    notifyListeners();
  }

  void pauseAudio(String filePath) async {
    try {
      await audioPlayer.setFilePath(filePath);
      audioPlayer.stop();
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
    if(audioPlayer.volume ==0){
  await audioPlayer.setVolume(100);
    await audioPlayer.play();
  _isPlaying=false;
    }else{
        await audioPlayer.stop();
        await audioPlayer.setVolume(0);
        _isPlaying=true;
    }
  notifyListeners();
  }






  void toggleMute() {
    isMuted = !isMuted;
    audioPlayer.setVolume(isMuted ? 0.0 : 1.0);  
    notifyListeners();  
  }


    Future<void> playNext() async {
    //   print("playnext");
    // if (_currentIndex < Songss.length - 1) {
    //   _currentIndex++;
    //   await audioPlayer.seek(Duration.zero, index: _currentIndex);
    //   await audioPlayer.play();
    //   notifyListeners();
    // }
    audioPlayer.seekToNext();
  }



  void AddtoHive(v){
   List FavHiveList=[];
  if(mybox.get(1)!=null){
     List a=mybox.get(1);
   a.add(v);
    mybox.put(1, FavHiveList);
    }else{
      List a=v;
  mybox.put(1, a);
    }
  }



void PLAY() async {
    // await audioPlayer.setFilePath(filePath);
    //   audioPlayer.play();
    try {
     
      String sngnme = Songss[ListIndex!].path;
       print("lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
      print(sngnme);
       print("lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
      await audioPlayer.setFilePath(sngnme);
      audioPlayer.play();
      _isPlaying=true;
      _isPlaying=true;
    } on PlayerException catch (e) {
      print("Error loading file:============================================================================================ $e");
    }

    notifyListeners();
  }

void NEXTSONG() async {
    // await audioPlayer.setFilePath(filePath);
    //   audioPlayer.play();
    try {
     int r=ListIndex+1;
      String sngnme = Songss[r].path;
       print("lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
      print(sngnme);
       print("lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
      await audioPlayer.setFilePath(sngnme);
      audioPlayer.play();
      _isPlaying=true;
      _isPlaying=true;

      ListIndex=r;
    } on PlayerException catch (e) {
      print("Error loading file:============================================================================================ $e");
    }

    notifyListeners();
  }



void PRESONG() async {
    // await audioPlayer.setFilePath(filePath);
    //   audioPlayer.play();
    try {
     int r=ListIndex-1;
      String sngnme = Songss[r].path;
       print("lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
      print(sngnme);
       print("lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
      await audioPlayer.setFilePath(sngnme);
      audioPlayer.play();
      _isPlaying=true;
      _isPlaying=true;

      ListIndex=r;
    } on PlayerException catch (e) {
      print("Error loading file:============================================================================================ $e");
    }

    notifyListeners();
  }


  @override
  void dispose() {
    audioPlayer.dispose();
    // _playaudio.dispose();
    super.dispose();
  }
}
