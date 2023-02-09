import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Application',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplication Test"),
      ),
      body: Center(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          primary: false,
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.orange[200],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.green[200],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.red[200],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.purple[200],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.blueGrey[200],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.yellow[200],
            ),
          ],
        ),
      ),
    );
  }
}
