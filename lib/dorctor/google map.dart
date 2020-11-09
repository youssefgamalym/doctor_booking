import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking/main.dart';
import 'package:doctor_booking/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../methods.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

LatLng cairoAirPortLocation = LatLng(30.1128314, 31.4019791);
Marker cairoAirportMarker = Marker(
    markerId: MarkerId("CairoAirPort"),
    position: cairoAirPortLocation,
    infoWindow: InfoWindow(title: "Cairo Air port", onTap: () {}),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));

GoogleMapController _googleMapController;

_onMapCreated(GoogleMapController googleMapController) {
  _googleMapController = googleMapController;
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  // final CollectionReference doctorLocationCollection =
  //     FirebaseFirestore.instance.collection('Location');

  LatLng cairoAirPortLocation = LatLng(30.1128314, 31.4019791);

  Marker cairoAirportMarker = Marker(
      markerId: MarkerId("CairoAirPort"),
      position: LatLng(30.1128314, 31.4019791),
      infoWindow: InfoWindow(title: "Cairo Air port", onTap: () {}),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));

  LatLng location = LatLng(29.995882, 31.183329);

  Future<Null> goToCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    LatLng currentLocation = LatLng(position.latitude, position.longitude);
    print(currentLocation);
    print(position.latitude);
    CameraPosition userCameraPosition =
        CameraPosition(target: currentLocation, zoom: 16);
    _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(userCameraPosition));
  }

  // List <Marker>
  @override
  Widget build(BuildContext context) {
    List<Marker> allMarkers = [
      Marker(
        infoWindow: InfoWindow(
            title: 'clinic is her',
            onTap: () {
              print('her');
            }),
        markerId: MarkerId('userPosition'),
        position: LatLng(29.995882, 31.183329),
      )
    ];

    return Scaffold(
      appBar: appBarMain(context, 'Add Location'),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.3,
              child: GoogleMap(
                  onTap: (LatLng latLng) {
                    print('a');
                    allMarkers.add(
                        Marker(markerId: MarkerId('mark'), position: latLng));
                    setState(() {});
                  },
                  // allMarkers.add(Marker(markerId: 'null'));
                  onMapCreated: _onMapCreated,
                  mapType: MapType.normal,
                  markers: Set.from(allMarkers),
                  initialCameraPosition:
                      CameraPosition(target: location, zoom: 13.0)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    goToCurrentLocation();
                    // print(currentLocation);
                    //
                    // var userPosition = {
                    //   'latitude': position.latitude,
                    //   'longitude': position.longitude
                    // };
                    // doctorLocationCollection
                    //     .doc(goToCurrentLocation().toString())
                    //     .set(userPosition)
                    //     .catchError((error) {
                    //   print("Error: $error");
                    // });
                    // Navigator.pushReplacementNamed(
                    //     context, MyApp.DOCTOR_PROFILE);
                  },
                  child: Text(
                    'Add ',
                    style: simpleNo_Style(),
                  ),
                  color: Colors.orange,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
