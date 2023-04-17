import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<String> streamController = StreamController();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            StreamBuilder<String>(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.toString());
                  } else {
                    return const Text("Null Data");
                  }
                  ;
                }),
            SizedBox(
              child: TextField(controller: textEditingController),
            ),
            ElevatedButton(
              onPressed: () {
                streamController.add(textEditingController.text);
              },
              child: const Text("change text"),
            ),
          ],
        ),
      ),
    );
  }
}
