import 'dart:io';

import 'package:flutter/material.dart';
import 'generate.dart';
import 'scan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Qr Scanner'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.exit_to_app_sharp,
            ),
            onPressed: () {
              exit(0);
            },
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.pinkAccent])),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
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
                      'Generate QR',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScanQr()),
                  );
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
                      'Scan QR',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
