import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/services.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({Key? key}) : super(key: key);

  @override
  State<ScanQr> createState() => _ScanQrState();
}

var qrresult = "\"Your Result Will Appear Here\"";

class _ScanQrState extends State<ScanQr> {
  Future qrscan() async {
    var camStatus = await Permission.camera.status;
    if (camStatus.isGranted) {
      String? qrdata = await scanner.scan();
      setState(() {
        qrresult = qrdata!;
      });
    } else {
      var isGrant = await Permission.camera.request();
      if (isGrant.isGranted) {
        String? qrdata = await scanner.scan();
        print(qrdata);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QR Scanner'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.pinkAccent])),
        ),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SelectableText(
              qrresult,
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 300,
          ),
          InkWell(
            onTap: () {
              final data = ClipboardData(text: qrresult);
              Clipboard.setData(data);
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
                  'Copy',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          InkWell(
            onTap: () {
              qrscan();
            },
            borderRadius: BorderRadius.circular(15),
            splashColor: Colors.white,
            child: Ink(
              height: 260,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      colors: [Colors.deepPurple, Colors.pink])),
              child: const Center(
                child: Text(
                  'Get QR',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
