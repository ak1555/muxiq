import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.grey.shade400, Colors.grey.shade200])),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Autharization",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(left: 23, right: 20),
                  // child: Text(
                  //   "Secure authentication for your safety and enhanced encryption protection.",
                  //   style: TextStyle(color: Colors.grey.shade700),
                  // ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome Back! Please Authenticate",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                // Container(
                //   height: 55,
                //   width: double.infinity,
                //     padding: EdgeInsets.only(left: 15,right: 15),
                //   margin: EdgeInsets.only(left: 15, right: 15),
                //   decoration: BoxDecoration(
                //     color: Colors.grey.shade50,
                //     border: Border.all(color: Colors.grey),
                //     borderRadius: BorderRadius.circular(100),
                //   ),
                //   child: Row(
                //     children: [
                //       Icon(Icons.person),
                //       SizedBox(width: 5,),
                //       Expanded(child: TextField(
                //         decoration: InputDecoration(border: InputBorder.none),
                //       )),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 5,offset: Offset(0, 4))]
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Email"),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // Container(
                //   height: 55,
                //   width: double.infinity,
                //   margin: EdgeInsets.only(left: 15, right: 15),
                //   decoration: BoxDecoration(
                //     color: Colors.grey[800],
                //     border: Border.all(color: Colors.grey),
                //     borderRadius: BorderRadius.circular(100),
                //   ),
                //   child: MaterialButton(
                //     onPressed: () {},
                //     child: Text(
                //       "LOGIN",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 18),
                //     ),
                //   ),
                // ),

                Container(
                  height: 55,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [BoxShadow(blurRadius: 3,offset: Offset(0, 4),color: Colors.grey)]
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "SIGNIN",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // Container(
                //   margin: EdgeInsets.only(left: 18, right: 18),
                //   child: Text(
                //     "Secure authentication for your safety and enhanced encryption protection.",
                //     style: TextStyle(color: Colors.grey.shade700),
                //   ),
                // ),

                SizedBox(
                  height: 30,
                ),
                // Divider(),
                Container(
                  margin: EdgeInsets.only(left: 17, right: 17),
                  child: Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(" OR ",style: TextStyle(fontWeight: FontWeight.bold),),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 39,
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(100),
                     boxShadow: [BoxShadow(blurRadius: 3,offset: Offset(0, 4),color: Colors.grey)]
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Google Singnup",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "Secure authentication for your safety and enhanced encryption protection.",
                    style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
