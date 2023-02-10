import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

void myLog(context) async {
  Location location = new Location();
  //location.enableBackgroundMode(enable: true);
  //location.enableBackgroundMode(enable: true);

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _locationData = await location.getLocation();
  //return _locationData;
  print("____________________");
  print('$_locationData.latitude, $_locationData.longitude');
  print("OK");
  showAlertDialog(context, _locationData.latitude, _locationData.longitude);
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
              child: Center(child: Text(title)),
              color: Colors.yellow[400],
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.blueAccent,
              child: TextButton(
                onPressed: () => {myLog(context)},
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
            ),
          ],
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context, dynamic latitud, dynamic longitud) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text('$latitud, $longitud'),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
