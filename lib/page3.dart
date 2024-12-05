
import 'package:flutter/material.dart';
class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color:  const Color.fromARGB(255, 255, 255, 255),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          Container(
            height: 115,
            width: double.infinity,
            // alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10,right: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                    height: double.infinity,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Favorates",style: TextStyle(
                          fontSize: 24,fontWeight: FontWeight.bold,color: Colors.grey.shade600),),
                        Text("Playlist Songs",style: TextStyle(fontSize: 12,color: Colors.grey),)
                      ],
                    ),
                  ),
               

                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Icon(Icons.favorite,color: Colors.redAccent,size: 25,),
                )
              ],
            ),
          ),
          
             Expanded(child: Container(
                    color: Colors.grey.shade100,
                    child: Column(
                      children: [
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 35,width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                alignment: Alignment.center,
                              child: Text("1",style: TextStyle(color: Colors.grey.shade600),),),
                              SizedBox(width: 15,),
                              Expanded(child: Container(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("BELEIVER",style: TextStyle(color: Colors.grey.shade600),),
                                    Text("Justin biever",style: TextStyle(color: Colors.grey.shade600),)
                                  ],
                                ),
                              )),
                              Container(
                                height: 39,width: 39,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade500,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                // alignment: Alignment.center,
                              child:IconButton(onPressed: () {
                                
                              }, icon: Icon(Icons.play_arrow,color: Colors.white,))),
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