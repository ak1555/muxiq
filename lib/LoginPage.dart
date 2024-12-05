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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Autharization",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(
                  height: 40,
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
                  height: 25,
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 15,right: 15),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(100),
                  ),
                   child: Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 5,),
                      Expanded(child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
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
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
             
                  SizedBox(height: 20,),
                Divider(),
                SizedBox(height: 29,),
                Container(
                  height: 55,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(100),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
