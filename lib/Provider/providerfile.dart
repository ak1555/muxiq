import 'package:flutter/material.dart';
import 'package:muxiq/main.dart';

class ProviderFile extends ChangeNotifier{
List LS =[false,true];

void blckandwhte(bool t){
// late bool white = false;

// white = t;
// print(white);

//  list [0] = black or white
LS[0] = t;


notifyListeners();

}
}