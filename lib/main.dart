import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:maxiapp/saturapp.dart';

void main() {
  runApp(SaturAPP());
}

void myLog(context) async {
  Location location = new Location();
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

  FlutterMap mapa = FlutterMap(
    options: MapOptions(
      center: LatLng(21.166304, -86.8677313),
      zoom: 12.2,
      maxZoom: 18.4,
    ),
    nonRotatedChildren: [
      AttributionWidget.defaultWidget(
        source: 'OpenStreetMap contributors',
        onSourceTapped: null,
      ),
    ],
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      ),
      MarkerLayer(
        markers: [
          Marker(
            point: LatLng(latitud, longitud),
            width: 80,
            height: 80,
            builder: (context) => Image.network(
                "https://cdn-icons-png.flaticon.com/128/1397/1397898.png"),
          ),
        ],
      ),
    ],
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: mapa,
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return mapa;
    },
  );
}
