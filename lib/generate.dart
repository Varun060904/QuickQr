import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  var text = "Hello Welcome to QR Scanner app by Varun";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Center(child: Text("Generate QR")),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.pinkAccent])),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          QrImage(
            data: text,
            size: 300,
            version: QrVersions.auto,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple),borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: 'Enter Your Text here..'),
            ),
          ),
          InkWell(
            onTap: () async {
              final data = await Clipboard.getData('text/plain');
              final text = data == null ? '' : data.text!;
              setState(() => controller.text = text);
            },
            borderRadius: BorderRadius.circular(15),
            splashColor: Colors.white,
            child: Ink(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      colors: [Colors.deepPurple, Colors.pink])),
              child: const Center(
                child: Text(
                  'Paste',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
      InkWell(
        onTap: (){
          setState(() {
            text = controller.text;
            controller.clear();
          });
        },
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.white,
        child: Ink(
          height: 220,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.pink])),
          child: const Center(
            child: Text('Get QR',
              style: TextStyle(fontSize: 25,color: Colors.white)
              ,),
          ),
        ),
      ),

        ],
      ),
    );
  }
}
