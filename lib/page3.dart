import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muxiq/Provider/providerfile.dart';
import 'package:provider/provider.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List ls = [];
  late bool BorW;
  var mybox = Hive.box("mybox");
   String?  song;
   String? singer;
  void d() {
    //  Provider.of<ProviderFile>(context,listen: false).blckandwhte(true);
    BorW = Provider.of<ProviderFile>(context, listen: false).LS[0];
    print(BorW);
    if (mybox.get(11) != null) {
      ls = mybox.get(11);
    } else {
      print(
          "{{{{{{{{{{{{{{{{{{{{{{{{{{{ EMPTY MYBOX }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}");
    }
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
                  : [Colors.grey.shade100, Colors.grey.shade50])),
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
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade800),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Playlist Songs",
                        style: TextStyle(
                            fontSize: 12,
                            color: BorW ? Colors.grey.shade200 : Colors.grey),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: BorW ? Colors.grey.shade200 : Colors.grey)),
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
            decoration: BoxDecoration(
                gradient: LinearGradient(
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
                  height: 10,
                ),
                Expanded(child: ListView.builder(
                  itemCount: ls.length,
                  itemBuilder: (context, index) {

                      String a = ls[index].toString();

                    List snn = a.split('/');
                    
                      String b = snn[snn.length - 1].toString();
                       List EDse = b.split('-');
                      song =EDse[0];
                      String c=EDse[1].toString();
                    List kkkk = c.split(',');
                    singer=kkkk[0];

                    return Container(
                      margin: EdgeInsets.only(
                          left: 13, right: 12, top: 11, bottom: 11),
                      child: Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              // color: Colors.grey.shade400,
                              color: BorW
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                             "1",
                              style: TextStyle(
                                  color: BorW
                                      ? Colors.grey.shade100
                                      : Colors.grey.shade800),
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
                                 song.toString(),
                                  style: TextStyle(
                                      color: BorW
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 3,),
                                Text(
                                  singer.toString(),
                                  style: TextStyle(
                                      color: BorW
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade800),
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
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        spreadRadius: 0,
                                        offset: Offset(0, 3),
                                        color: Colors.grey)
                                  ]),
                              // alignment: Alignment.center,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  ))),
                        ],
                      ),
                    );
                  },
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
