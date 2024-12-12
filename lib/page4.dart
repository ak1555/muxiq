import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muxiq/Provider/providerfile.dart';
import 'package:muxiq/main.dart';
import 'package:provider/provider.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
TextEditingController _username = TextEditingController();
TextEditingController _bio = TextEditingController();
var hive = Hive.box("mybox");
  late bool BorW;
   bool uname=false;
   bool bio=false;
  String? username ;
  String? Bio;


void getusername(){
  if(hive.get(1)!=null){
setState(() {
  username=hive.get(1);
  uname=true;
});
  }
  if(hive.get(2)!=null){
    setState(() {
      Bio = hive.get(2);
      bio =true;
    });
  }
  print(hive.get(1));
  print(hive.get(2));
}


  void d() {
    //  Provider.of<ProviderFile>(context,listen: false).blckandwhte(true);
    BorW = Provider.of<ProviderFile>(context, listen: false).LS[0];
    print(BorW);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    d();
    getusername();
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
                  : [Colors.grey.shade100, Colors.grey.shade50])),
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                border:
                    Border.all(color: BorW ? Colors.grey.shade50 : Colors.grey),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(Icons.person,color: Colors.grey,size: 99,),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child:uname? Text(username!,
                style: TextStyle(
                  fontSize: 20,
                  color: BorW ? Colors.grey.shade200 : Colors.grey.shade800,
                ),
              ):Text(
                "User Name",
                style: TextStyle(
                  fontSize: 20,
                  color: BorW ? Colors.grey.shade200 : Colors.grey.shade800,
                ),
              )),
              Container(
              width: double.infinity,
              alignment: Alignment.center,
              child:bio? Text(Bio!,style: TextStyle(
                 fontSize: 12,
                  color: BorW ? Colors.grey.shade200 : Colors.grey.shade800,
              ),)
              :Text(
                "Bio",
                style: TextStyle(
                  fontSize: 12,
                  color: BorW ? Colors.grey.shade200 : Colors.grey.shade800,
                ),
              )),
          SizedBox(
            height: 35,
          ),
          Container(
            height: 365,
            width: double.infinity,
            margin: EdgeInsets.only(left: 11, right: 11),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: BorW ? Colors.grey.shade500 : Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.only(bottom: 1),
                            alignment: Alignment.bottomCenter),
                        onPressed: () {
                           showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: Container(
                                height: 200,
                                width: 250,
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Expanded(child: TextField(
                                        controller: _username,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,hintText: "Enter your Name"
                                          ,hintStyle: TextStyle(color: Colors.grey)),
                                        )),
                                    ),

                                       Container(
                                      height: 50,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Expanded(child: TextField(
                                        controller: _bio,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,hintText: "Enter your bio"
                                          ,hintStyle: TextStyle(color: Colors.grey)),
                                        )),
                                    ),

                                  ],
                                ) ),
                                actions: [
                                  Container(
                                 decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                   gradient: LinearGradient(
              colors: BorW
                  ? [Colors.black, const Color.fromARGB(255, 66, 66, 66)]
                  : [Colors.grey.shade300, Colors.grey.shade200])
                                 ),
                                    child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,shadowColor: Colors.transparent,
                                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                      padding: EdgeInsets.only(left: 35,right: 35,top: 15,bottom: 15),
                                    ),
                                    onPressed: () {


                                    // setUsername();

  if(_username.text==''){
   print("name null");
}else{

   hive.put(1, _username.text);
}

if(_bio.text==''){
  print("bio null");
}else{
  
      hive.put(2, _bio.text);
}



                                     }, child: Text("set",style: TextStyle(
                                      color: BorW ? Colors.grey.shade200 : Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                    ),)),
                                  )],
                            );
                          },);
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 18,
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade800,
                          ),
                        ),
                      ),
                      IconButton(
                          style: IconButton.styleFrom(
                              padding: EdgeInsets.only(top: 1),
                              alignment: Alignment.topCenter),
                          onPressed: () {
                             showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: Container(
                                height: 200,
                                width: 250,
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Expanded(child: TextField(
                                        controller: _username,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,hintText: "Enter your Name"
                                          ,hintStyle: TextStyle(color: Colors.grey)),
                                        )),
                                    ),

                                       Container(
                                      height: 50,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Expanded(child: TextField(
                                        controller: _bio,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,hintText: "Enter your bio"
                                          ,hintStyle: TextStyle(color: Colors.grey)),
                                        )),
                                    ),

                                  ],
                                ) ),
                                actions: [
                                  Container(
                                 decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                   gradient: LinearGradient(
              colors: BorW
                  ? [Colors.black, const Color.fromARGB(255, 66, 66, 66)]
                  : [Colors.grey.shade300, Colors.grey.shade200])
                                 ),
                                    child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,shadowColor: Colors.transparent,
                                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                      padding: EdgeInsets.only(left: 35,right: 35,top: 15,bottom: 15),
                                    ),
                                    onPressed: () {
                                    // setUsername();
  if(_username.text==''){
   print("name null");
}else{

   hive.put(1, _username.text);
}

if(_bio.text==''){
  print("bio null");
}else{
  
      hive.put(2, _bio.text);
}
                                                                    }, child: Text("set",style: TextStyle(
                                      color: BorW ? Colors.grey.shade200 : Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                    ),)),
                                  )],
                            );
                          },);
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade800,
                          )),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.only(bottom: 1),
                              alignment: Alignment.bottomCenter),
                          onPressed: () {
                            bool t = Provider.of<ProviderFile>(context,
                                    listen: false)
                                .LS[0];
                            Provider.of<ProviderFile>(context, listen: false)
                                .blckandwhte(!t);
                            d();
                            try {
                              Navigator.pushNamed(context, "main");
                            } catch (e) {
                              print(e);
                            }

                            print(BorW);
                          },
                          child: Text(
                            "Theme",
                            style: TextStyle(
                              fontSize: 18,
                              color: BorW
                                  ? Colors.grey.shade200
                                  : Colors.grey.shade800,
                            ),
                          ),
                        ),
                        IconButton(
                            style: IconButton.styleFrom(
                                padding: EdgeInsets.only(top: 1),
                                alignment: Alignment.topCenter),
                            onPressed: () {
                              bool t = Provider.of<ProviderFile>(context,
                                      listen: false)
                                  .LS[0];
                              Provider.of<ProviderFile>(context, listen: false)
                                  .blckandwhte(!t);
                              d();
                              try {
                                Navigator.pushNamed(context, "main");
                              } catch (e) {
                                print(e);
                              }

                              print(BorW);
                            },
                            icon: Icon(
                              Icons.change_circle_outlined,
                              color: BorW
                                  ? Colors.grey.shade200
                                  : Colors.grey.shade800,
                            )),
                      ],
                    )),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.only(bottom: 1),
                            alignment: Alignment.bottomCenter),
                        onPressed: () {
                           showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: Container(
                                height: 150,
                                width: 250,
                                
                                // alignment: Alignment.center,
                                child: Text("Currently you can't Access this Feature")),
                            );
                          },);
                        },
                        child: Text(
                          "Share",
                          style: TextStyle(
                            fontSize: 18,
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade800,
                          ),
                        ),
                      ),
                      IconButton(
                          style: IconButton.styleFrom(
                              padding: EdgeInsets.only(top: 1),
                              alignment: Alignment.topCenter),
                          onPressed: () {
                             showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: Container(
                                height: 150,
                                width: 250,
                                
                                // alignment: Alignment.center,
                                child: Text("Currently you can't Access this Feature")),
                            );
                          },);
                          },
                          icon: Icon(
                            Icons.switch_access_shortcut_add_outlined,
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade800,
                          )),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                       child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.only(bottom: 1),
                            alignment: Alignment.bottomCenter),
                        onPressed: () {
                           showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: Container(
                                height: 150,
                                width: 250,
                                
                                // alignment: Alignment.center,
                                child: Text("Currently you can't Access this Feature")),
                            );
                          },);
                        },
                        child: Text(
                          "Set us",
                          style: TextStyle(
                            fontSize: 18,
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade800,
                          ),
                        ),
                      ),
                      IconButton(
                          style: IconButton.styleFrom(
                              padding: EdgeInsets.only(top: 1),
                              alignment: Alignment.topCenter),
                          onPressed: () {
                             showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: Container(
                                height: 150,
                                width: 250,
                                // alignment: Alignment.center,
                                child: Text("Currently you can't Access this Feature")),
                            );
                          },);
                          },
                          icon: Icon(
                            Icons.settings_phone_sharp,
                            // Icons.roundabout_right_outlined,
                            color: BorW
                                ? Colors.grey.shade200
                                : Colors.grey.shade800,

                        
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
