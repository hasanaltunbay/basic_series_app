import 'package:dizilerim/Diziler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  Diziler dizi;


  DetaySayfa({required this.dizi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.dizi.dizi_adi),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Image.asset("resimler/${widget.dizi.dizi_resim_adi}"),
          Text(widget.dizi.dizi_yili.toString(),style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              child: Text("Diziye Git"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: (){
                print("${widget.dizi.dizi_adi } dizisine gidildi");
              },
            ),
          ),

      ],
          ),
        ),
      ),
    );
  }
}
