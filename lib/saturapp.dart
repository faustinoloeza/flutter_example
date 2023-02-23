import 'package:flutter/material.dart';
import 'package:maxiapp/utils.dart';
import 'saturmap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class SaturAPP extends StatelessWidget {
  const SaturAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saturmex',
      theme: ThemeData.dark(),
      home: HomeSatur(title: 'Flutter Demo Home Page'),
    );
  }
}

void gotoPage(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SaturMap()));
}

class HomeSatur extends StatelessWidget {
  //const HomeSatur({Key? key}) : super(key: key);
  const HomeSatur({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    String platform = detectPlatform();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("SATURMEX"),
        ),
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Hello World!'),
                    ),
                    Icon(
                      Icons.route_outlined,
                      color: Color.fromARGB(255, 233, 30, 30),
                      size: 48.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ],
                ),
              ),
              color: Colors.orange[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: const <Widget>[
                  Text('Deliver features faster'),
                  Text('Craft beautiful UIs'),
                  Expanded(
                    child: FittedBox(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 10.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                    ),
                  ),
                ],
              ),
              color: Colors.green[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(title),
              ),
              color: Colors.red[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(title),
              ),
              color: Colors.purple[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(title),
              ),
              color: Colors.blueGrey[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextButton(
                onPressed: () => {
                  gotoPage(context),
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                      fontSize: 24),
                ),
              ),
              color: Colors.yellow[400],
            ),
            Menu(
              Icons.add_alert_outlined,
              "Routes",
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 158, 223, 255),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(title),
              ),
              color: Colors.green[400],
            ),
            Menu(
              Icons.add_to_queue,
              "Routes",
              Color.fromARGB(255, 18, 255, 58),
              Color.fromARGB(255, 218, 255, 7),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(title),
              ),
              color: Color.fromARGB(255, 255, 52, 52),
            ),
            Menu(
              Icons.phone_iphone_rounded,
              "Routes",
              Color.fromARGB(255, 46, 206, 255),
              Color.fromARGB(255, 255, 163, 25),
            ),
            Menu(
              Icons.phone_android,
              "Routes",
              Color.fromARGB(255, 94, 255, 1),
              Color.fromARGB(255, 11, 174, 255),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(title),
              ),
              color: Color.fromARGB(255, 255, 35, 6),
            ),
            Menu(
              Icons.phone_android,
              "Routes",
              Color.fromARGB(255, 94, 255, 1),
              Color.fromARGB(255, 110, 94, 248),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(title),
              ),
              color: Color.fromARGB(255, 255, 35, 6),
            ),
          ],
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  Menu(this.myIcon, this.title, this.color, this.background);
  IconData myIcon;
  String title;
  Color color;
  Color background;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(title),
            ),
            Icon(
              myIcon,
              color: color,
              size: 48.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ],
        ),
      ),
      color: background,
    );
  }
}
