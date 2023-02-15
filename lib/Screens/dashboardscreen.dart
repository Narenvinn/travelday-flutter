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
  late double devicewidth;
  late double deviceheight;
  @override
  Widget build(BuildContext context) {
    devicewidth = MediaQuery.of(context).size.width;
    deviceheight = MediaQuery.of(context).size.height;
    return Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          backgroundColor: CustomColors.buttonThemeColor,
          title: Image.asset(Constants.navlogo, fit: BoxFit.fill),
          actions: <Widget>[
          Image.asset(
      Constants.userslogo,
      fit: BoxFit.fill,
      //width: 5,
     height: 5,
      // ),
              // onPressed: () {}
               ),
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
            top: 150,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.buttonThemeColor, // background
                    onPrimary: Colors.white,
                    fixedSize: Size((devicewidth - 50), 40),
                    padding:
                        const EdgeInsets.only(left: 25.0, right: 25, top: 5),
                    tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // foreground
                  ),
                  child: const Text('Bottom Sheet'),
                  onPressed: () {
                    // when raised button is pressed
                    // we display showModalBottomSheet

                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return Container(
                          // color: Colors.white,
                          height: MediaQuery.of(context).size.height / 3 + 60,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          margin: const EdgeInsets.only(
                              left: 25.0, right: 25, top: 5, bottom: 35),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return index == 4
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.green, // background
                                            onPrimary: Colors.white,
                                            //fixedSize: const Size(150, 40),
                                            // padding: const EdgeInsets.only(left: 25.0, right: 25, top: 5),
                                            //tapTargetSize: MaterialTapTargetSize.shrinkWrap, // foreground
                                          ),
                                          onPressed: () {
                                            //Navigator.pushNamed(context, DashboardRoute);
                                          },
                                          child:
                                              const Text(Constants.bottomsheet),
                                          //)
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          ListTile(
                                            leading: Image.asset(
                                              Constants.carlogo,
                                              fit: BoxFit.fill,
                                              width: 49,
                                              height: 27,
                                              // ),
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Image.asset(
                                                  Constants.infologo,
                                                  fit: BoxFit.fill,
                                                  width: 28,
                                                  height: 28,
                                                  // ),
                                                ),
                                                SizedBox(width: 15),
                                                Text(
                                                  "₹ 2000 - ₹ 2562",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            title: Text("List item $index"),
                                            subtitle:
                                                Text("Sub List item $index"),
                                          ),
                                          Divider()
                                        ],
                                      );
                              }),
                        );
                      },
                    );
                  }),
            ),
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
                          child: ListTile(
                            leading:
                                // Icon(
                                //   Icons.location_on,
                                //   color: Colors.green,
                                // ),
                                Image.asset(
                              Constants.startlocation,
                              width: 15.0,
                              height: 15.0,
                              fit: BoxFit.fill,
                            ),
                            title: const Text(
                              'Chennai central Railway st.',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: CustomColors.buttonThemeColor),
                            ),
                            trailing: Image.asset(
                              Constants.heartlogo,
                              width: 12.0,
                              height: 10.0,
                              fit: BoxFit.fill,
                            ),
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
                          child: ListTile(
                            leading: Image.asset(
                              Constants.endlocation,
                              width: 15.0,
                              height: 15.0,
                              fit: BoxFit.fill,
                            ),
                            title: const Text(
                              'Gandhi Nagar, Redhills Thiruvallur.',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: CustomColors.buttonThemeColor),
                            ),
                            trailing: Image.asset(
                              Constants.heartlogo,
                              fit: BoxFit.fill,
                              width: 12,
                              height: 10,
                              // ),
                            ),
                            dense: true,
                          )),
                    ),
                  )))
        ]));
  }
}
