import 'package:flutter/material.dart';
import 'package:muxiq/Provider/providerfile.dart';
import 'package:provider/provider.dart';


class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
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
              colors: [Colors.grey.shade100, Colors.grey.shade50])),
      child: ListView(
        children: [
          SizedBox(height: 5,),
          Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "User Name",
                style: TextStyle(fontSize: 20),
              )),
              SizedBox(height: 15,),
          Container(
            height: 350,
            width: double.infinity,
            margin: EdgeInsets.only(left: 10,right: 10),
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 5,mainAxisSpacing: 5),
              children: [
                Container(
                 decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5)
                 ),
                ),
                Container(
                  decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5)
                 ),
                 child: IconButton(onPressed: () {
                   Provider.of<ProviderFile>(context,listen: false).blckandwhte(true);
                 }, icon: Icon(Icons.change_circle)),
                ),
                Container(
                   decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5)
                 ),
                ),
                Container(
                  decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5)
                 ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50,),
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
                      "LOGOUT",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
