import 'package:dizilerim/DetaySayfa.dart';
import 'package:dizilerim/Diziler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Diziler>> dizileriGetir() async{
    
    var dizilerListesi=<Diziler>[];
    
    var d1=Diziler(1, "La Casa De Papel", "la_casa_de_papel.jpg", 2017);
    var d2=Diziler(2, "Fast And Furious", "hizli_ve_ofkeli.jpg", 2001);
    var d3=Diziler(3, "See", "see.jpg", 2019);
    var d4=Diziler(4, "Breaking Bad", "breaking_bad.jpg", 2008);
    var d5=Diziler(5, "Gibi", "gibi.jpg", 2021);
    var d6=Diziler(6, "Black Mirror", "black_mirror.jpg", 2011);
    var d7=Diziler(7, "Narcos", "narcos.jpg", 2015);
    var d8=Diziler(8, "Peaky Blinders", "peaky_blinders_.jpg", 2013);
    var d9=Diziler(9, "Prison Break", "prison_break.jpg", 2005);
    var d10=Diziler(10, "The Walking Dead", "the_walking_dead.jpg", 2010);

    dizilerListesi.add(d1);
    dizilerListesi.add(d2);
    dizilerListesi.add(d3);
    dizilerListesi.add(d4);
    dizilerListesi.add(d5);
    dizilerListesi.add(d6);
    dizilerListesi.add(d7);
    dizilerListesi.add(d8);
    dizilerListesi.add(d9);
    dizilerListesi.add(d10);

    return dizilerListesi;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Dizilerim"),
      ),
      body: FutureBuilder<List<Diziler>>(
        future: dizileriGetir(),
        builder: (context,veri){
          if(veri.hasData){

            var dizilerListesi=veri.data;

            return GridView.builder(
              itemCount: dizilerListesi!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
              ),
              itemBuilder: (context,index){
                var dizi=dizilerListesi[index];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetaySayfa(dizi: dizi)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 200,
                            height: 200,
                            child: Image.asset("resimler/${dizi.dizi_resim_adi}")),
                        Text(dizi.dizi_adi,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text(dizi.dizi_yili.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              },
            );

          }else{
            return Center();
          }
        },


      ),
    );
  }
}
