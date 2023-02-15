import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'google.dart';

class SaturMap extends StatelessWidget {
  const SaturMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    dynamic polyline = decodePolyline(
            r'o`~_CxnnqO}nGwbP\o@bN_@vEDnCIzBe@`]_AfBl@`AIv@{@ta@cAdBLjCq@~a@uApBJb\wAlLU')
        .unpackPolyline();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Rute Name"),
        ),
      ),
      body: SlidingUpPanel(
        panelBuilder: (ScrollController sc) => _scrollingList(sc),
        collapsed: Container(
          decoration:
              BoxDecoration(color: Colors.blueGrey, borderRadius: radius),
          child: Center(
            child: Text(
              "This is the collapsed Widget",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: FlutterMap(
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
            PolylineLayer(
              polylineCulling: false,
              polylines: [
                Polyline(
                  strokeWidth: 5.5,
                  isDotted: true,
                  points: polyline,
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        tooltip: "Show my location",
        backgroundColor: Colors.green,
        child: const Icon(Icons.location_on),
      ),
    );
  }
}

Widget _scrollingList(ScrollController sc) {
  return ListView.builder(
    controller: sc,
    itemCount: 50,
    itemBuilder: (BuildContext context, int i) {
      return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.orange,
            border: Border.all(
                color: Color.fromARGB(255, 233, 7, 105), // Set border color
                width: 3.0), // Set border width
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)), // Set rounded corner radius
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
            ] // Make rounded corner of border
            ),
        child: Text('My demo $i'),
      );
    },
  );
}
