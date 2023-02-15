import 'package:flutter/material.dart';
import 'package:maxiapp/utils.dart';
import 'saturmap.dart';

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
                child: Text(platform),
              ),
              color: Colors.orange[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.green[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.red[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.purple[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
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
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.orange[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.green[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.red[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
              color: Colors.purple[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(title)),
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
          ],
        ),
      ),
    );
  }
}
