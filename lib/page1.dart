import 'package:flutter/material.dart';
import 'package:muxiq/Provider/providerfile.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
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
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
             gradient: LinearGradient(
              colors: BorW
                  ? [Colors.black, const Color.fromARGB(255, 66, 66, 66)]
                  : [Colors.grey.shade100, Colors.grey.shade50])

              ),
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
                          color: BorW ? Colors.grey.shade200 : Colors.grey.shade800
                          ),
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
                      child: Icon(
                        Icons.now_widgets_outlined,
                        size: 25,
                        color: BorW ? Colors.grey.shade200 : Colors.grey.shade600
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 40,
                      decoration: BoxDecoration(
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.more_vert,
                        size: 24,
                         color: BorW ? Colors.grey.shade200 : Colors.grey.shade600
                      ),
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
                color: BorW ? Colors.grey.shade400 : Colors.grey.shade300 ),
            child: Row(
              children: [
                Expanded(
                    child: TextField(style: TextStyle( color: BorW ? Colors.grey.shade900 :  Colors.blueGrey.shade800),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search your song...",
                      hintStyle: TextStyle(
                         color: BorW ? Colors.grey.shade600 : Colors.grey.shade600,
                        fontSize: 18,
                      )),
                )),
                IconButton(
                    padding: EdgeInsets.all(11),
                    style:
                        IconButton.styleFrom(backgroundColor: Colors.blueGrey.shade500),
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
              child: Text("All Songs",style: TextStyle(  color: BorW ? Colors.grey.shade200 : Colors.grey.shade800),)),
          SizedBox(
            height: 2,
          ),
          Divider(),

         SizedBox(height: 400,),


          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all(color:  BorW ? Colors.grey.shade400 : Colors.grey.shade800)),
          )
        ],
      ),
    );
  }
}
