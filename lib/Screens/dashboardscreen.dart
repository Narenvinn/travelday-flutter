import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelday/Routes/router.dart';
import 'package:travelday/Screens/navdrawer.dart';
import 'package:travelday/Utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<bool> _listSelectedItem = List.generate(20, (i) => false);
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
          title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(
              Constants.navlogo,
              fit: BoxFit.contain,
              // height: MediaQuery.of(context).size.height * 0.2,
              //width: MediaQuery.of(context).size.width * 0.2,
              height: 32,
            ),
          ]),
          //title: Image.asset(Constants.navlogo, fit: BoxFit.fill),
          actions: <Widget>[
            IconButton(
                icon: Image.asset(
                  Constants.userslogo,
                  width: 14,
                  height: 16,
                ),
                onPressed: () {}),

            //       Image.asset(
            //   Constants.userslogo,
            //   fit: BoxFit.fill,
            //   //width: 5,
            //  height: 5,
            // ),
            // onPressed: () {}
            //),
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
                    modelSheetDisplay();
                  }),
            ),
          ),

          //search autoconplete input
          Positioned(
              //search input bar
              top: 15,
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
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
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
              )),
          //search autoconplete input
          Positioned(
              //search input bar
              top: 75,
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
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
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
              ))
        ]));
  }

  void modelSheetDisplay() {
    // when raised button is pressed
    // we display showModalBottomSheet
    devicewidth = MediaQuery.of(context).size.width;
    deviceheight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
            // color: Colors.white,
            height: MediaQuery.of(context).size.height / 3 + 80,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            margin: const EdgeInsets.only(
                left: 12.0, right: 12, top: 5, bottom: 50),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(children: [
              //Expanded(
              // child:
              SizedBox(
                height: MediaQuery.of(context).size.height / 3 - 10,
                child: ListView.builder(
                    //shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return 
                      //Column(
                        //children: [
                          ListTile(
                              tileColor: _listSelectedItem[index]
                                  ? CustomColors.textfieldBackgroundThemeColor
                                  : Colors.white,
                              leading: Image.asset(
                                Constants.carlogo,
                                fit: BoxFit.cover,
                                width: 49,
                                height: 27,
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
                                  ),
                                  const SizedBox(width: 15),
                                  const Text(
                                    "₹ 2000 - ₹ 2562",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),
                              title: Text("List item $index"),
                              subtitle: Text("Sub List item $index"),
                              onTap: () {
                                print('listontap $index');
                                _listSelectedItem[index] =
                                    !_listSelectedItem[index];
                                setState(() {});
                              });
                          // Divider()
                       // ],
                    //  );
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              // ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: CustomColors.buttonThemeColor, // background
                  onPrimary: Colors.white,
                  fixedSize: Size((devicewidth - 70), 40),
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, top: 5, bottom: 10),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // foreground
                ),
                onPressed: () {
                  //Navigator.pushNamed(context, DashboardRoute);
                },
                child: const Text(Constants.booknow),
              )
              //),
            ]));
      },
    );
  }
}
