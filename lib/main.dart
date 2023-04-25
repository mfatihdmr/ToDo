import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Alışveriş Listesi Uygulaması"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  TextEditingController t1 = TextEditingController();
  List alisverisListesi = [];

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  List alisverisListesi = [];
  TextEditingController t1 = TextEditingController();

  elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: alisverisListesi.length,
                itemBuilder: (context, indeksnumarasi) => ListTile(
                      title: Text(alisverisListesi[indeksnumarasi]),
                    )),
          ),
          TextField(
            controller: t1,
          ),
          SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: elemanEkle,
              child: Text("Ekle"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color.fromARGB(255, 214, 126, 25)),
              ),
            ),
            ElevatedButton(
              onPressed: elemanCikar,
              child: Text("Çıkar"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color.fromARGB(255, 214, 126, 25)),
              ),
            ),
          ]),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
