import 'package:flutter/material.dart';
import 'package:muxiq/Provider/providerfile.dart';
import 'package:provider/provider.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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
    return Container(
      // color:  const Color.fromARGB(255, 255, 255, 255),
 decoration: BoxDecoration(
 gradient: LinearGradient(
              colors: BorW
                  ? [Colors.black, const Color.fromARGB(255, 66, 66, 66)]
                  : [Colors.grey.shade100, Colors.grey.shade50])
 ),
      child: Column(
        children: [
          Container(
            height: 155,
            width: double.infinity,
            // alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        " Favorates",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          color: BorW ? Colors.grey.shade200 : Colors.grey.shade800),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Playlist Songs",
                        style: TextStyle(fontSize: 12,  color: BorW ? Colors.grey.shade200 : Colors.grey),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: BorW ? Colors.grey.shade200 : Colors.grey)),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 23,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            // color: Colors.grey.shade100,
            decoration: BoxDecoration(gradient: LinearGradient(
              colors: BorW
                  ? [Colors.black, const Color.fromARGB(255, 66, 66, 66)]
                  : [Colors.grey.shade100, Colors.grey.shade50])),
            child: Column(
              children: [
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 13, right: 12),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          // color: Colors.grey.shade400,
                          color: BorW ? Colors.grey.shade600 : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "1",
                          style: TextStyle(color: BorW ? Colors.grey.shade100 : Colors.grey.shade800),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BELEIVER",
                              style: TextStyle(
                                 color: BorW ? Colors.grey.shade200 : Colors.grey.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Justin biever",
                              style: TextStyle(color: BorW ? Colors.grey.shade200 : Colors.grey.shade800),
                            )
                          ],
                        ),
                      )),
                      Container(
                          height: 39,
                          width: 39,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(200),
                             boxShadow: [BoxShadow(blurRadius: 3,spreadRadius: 0,offset: Offset(0, 3),color: Colors.grey)]
                          ),
                          // alignment: Alignment.center,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ))),
                      // IconButton(onPressed: () {

                      // }, icon: Icon(Icons.play_circle_outline_sharp,size: 35,color: Colors.grey.shade600,))
                    ],
                  ),
                ),

                SizedBox(height: 22),
                  Container(
                  margin: EdgeInsets.only(left: 13, right: 12),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          // color: Colors.grey.shade400,
                          color: BorW ? Colors.grey.shade600 : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "2",
                          style: TextStyle(color: BorW ? Colors.grey.shade100 : Colors.grey.shade800),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SHAPE OF YOU",
                              style: TextStyle(
                                  color: BorW ? Colors.grey.shade200 : Colors.grey.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Justin biever",
                              style: TextStyle(color: BorW ? Colors.grey.shade200 : Colors.grey.shade800),
                            )
                          ],
                        ),
                      )),
                      Container(
                          height: 39,
                          width: 39,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            borderRadius: BorderRadius.circular(200),
                          ),
                          // alignment: Alignment.center,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ))),
                      // IconButton(onPressed: () {

                      // }, icon: Icon(Icons.play_circle_outline_sharp,size: 35,color: Colors.grey.shade600,))
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
