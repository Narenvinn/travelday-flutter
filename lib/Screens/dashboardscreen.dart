import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelpay/Routes/router.dart';
import 'package:travelpay/Screens/navdrawer.dart';
import 'package:travelpay/Utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  static const LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);

  static const CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  String googleApikey = "GOOGLE_MAP_API_KAY";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Search Location";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          title: Image.asset(Constants.traveltoplogo, fit: BoxFit.cover),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.message), onPressed: () {}),
          ],
        ),
        body:
            // const GoogleMap(
            //   initialCameraPosition: _kInitialPosition,
            // ),
            Stack(children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: startLocation, //initial position
              zoom: 14.0, //initial zoom level
            ),
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
          ),

          Positioned(
            top: 140,
            child: ElevatedButton(
                child: const Text('showModalBottomSheet'),
                onPressed: () {
                  // when raised button is pressed
                  // we display showModalBottomSheet

                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height / 3,

                        margin: const EdgeInsets.only(
                            left: 25.0, right: 25, top: 5, bottom: 35),
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                  leading: const Icon(Icons.list),
                                  trailing: const Text(
                                    "GFG",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 15),
                                  ),
                                  title: Text("List item $index"));
                            }),
                        // child: Wrap(
                        //   children: const [
                        //     ListTile(
                        //       leading: Icon(Icons.share),
                        //       title: Text('Share'),
                        //     ),
                        //     ListTile(
                        //       leading: Icon(Icons.copy),
                        //       title: Text('Copy Link'),
                        //     ),
                        //     ListTile(
                        //       leading: Icon(Icons.edit),
                        //       title: Text('Edit'),
                        //     ),

                        //   ],
                        // ),
                      );
                    },
                  );
                }),
          ),

          //search autoconplete input
          Positioned(
              //search input bar
              top: 10,
              child: InkWell(
                  onTap: () async {
                    // var place = await PlacesAutocomplete.show(
                    //         context: context,
                    //         apiKey: googleApikey,
                    //         mode: Mode.overlay,
                    //         types: [],
                    //         strictbounds: false,
                    //         components: [Component(Component.country, 'np')],
                    //                     //google_map_webservice package
                    //         onError: (err){
                    //            print(err);
                    //         }
                    // );

                    //  if(place != null){
                    // setState(() {
                    //   location = place.description.toString();
                    // });

                    //form google_maps_webservice package
                    //  final plist = GoogleMapsPlaces(apiKey:googleApikey,
                    //         apiHeaders: await GoogleApiHeaders().getHeaders(),
                    //                   //from google_api_headers package
                    //   );
                    //   String placeid = place.placeId ?? "0";
                    //   final detail = await plist.getDetailsByPlaceId(placeid);
                    //   final geometry = detail.result.geometry!;
                    //   final lat = geometry.location.lat;
                    //   final lang = geometry.location.lng;
                    //   var newlatlang = LatLng(lat, lang);

                    //move map camera to selected place with animation
                    // mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: newlatlang, zoom: 17)));
                    //  }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Card(
                      child: Container(
                          padding: const EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width - 40,
                          child: const ListTile(
                            leading: Icon(
                              Icons.location_on,
                              color: Colors.green,
                            ),
                            title: Text(
                              'Chennai central Railway st.',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.green),
                            ),
                            trailing: Icon(Icons.heart_broken),
                            dense: true,
                          )),
                    ),
                  ))),
          //search autoconplete input
          Positioned(
              //search input bar
              top: 70,
              child: InkWell(
                  onTap: () async {
                    // var place = await PlacesAutocomplete.show(
                    //         context: context,
                    //         apiKey: googleApikey,
                    //         mode: Mode.overlay,
                    //         types: [],
                    //         strictbounds: false,
                    //         components: [Component(Component.country, 'np')],
                    //                     //google_map_webservice package
                    //         onError: (err){
                    //            print(err);
                    //         }
                    // );

                    //  if(place != null){
                    // setState(() {
                    //   location = place.description.toString();
                    // });

                    //form google_maps_webservice package
                    //  final plist = GoogleMapsPlaces(apiKey:googleApikey,
                    //         apiHeaders: await GoogleApiHeaders().getHeaders(),
                    //                   //from google_api_headers package
                    //   );
                    //   String placeid = place.placeId ?? "0";
                    //   final detail = await plist.getDetailsByPlaceId(placeid);
                    //   final geometry = detail.result.geometry!;
                    //   final lat = geometry.location.lat;
                    //   final lang = geometry.location.lng;
                    //   var newlatlang = LatLng(lat, lang);

                    //move map camera to selected place with animation
                    // mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: newlatlang, zoom: 17)));
                    //  }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Card(
                      child: Container(
                          padding: const EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width - 40,
                          child: const ListTile(
                            leading: Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            title: Text(
                              'Gandhi Nagar, Redhills Thiruvallur.',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.green),
                            ),
                            trailing: Icon(Icons.heart_broken),
                            dense: true,
                          )),
                    ),
                  )))
        ]));
  }
}
