import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelpay/Routes/router.dart';
import 'package:travelpay/Utils/constants.dart';
import 'package:travelpay/Utils/customfont.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  double devicewidth = 0;
  double deviceheight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 0,
      // ),
      body: loginForm(),
      //color:CustomColors.backgroundpurple.withOpacity(0.3),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
    ]);
  }

  Widget loginForm() {
    return
        //SingleChildScrollView(
        // child:
        Form(
      key: _formKey,
      child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            headerImage(Constants.traveltoplogo),
            boxFieldsLoad(),
            bottomImage(Constants.traveltoplogo),
          ]),
      // ),
    );
  }

  Widget headerTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(title,
          style: Customfont.textFontSet(18, Colors.white, FontWeight.bold)),
    );
  }

  Widget boxFieldsLoad() {
    devicewidth = MediaQuery.of(context).size.width;
    deviceheight = MediaQuery.of(context).size.height;
    return
        //  Positioned.fill(
        //    child:
        Align(
            alignment: Alignment.center,
            child: Container(
                height: 156,
                width: devicewidth,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: textfieldsLoad(Constants.mobilenumber),
                    ),
                    signinButton(),
                    forgotpasswordButton(),
                  ],
                )));
  }

  Widget textfieldsLoad(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: TextField(
        autofocus: false,
        style: const TextStyle(fontSize: 15.0, color: Colors.green),
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey.withOpacity(0.3),
          hintText: title,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mobile_screen_share,
                color: Colors.green,
              )),
        ),
      ),
    );
  }

  Widget signinButton() {
    devicewidth = MediaQuery.of(context).size.width;
    deviceheight = MediaQuery.of(context).size.height;
    return
        // Padding(
        //       padding: const EdgeInsets.only(left: 25.0, right: 25,top: 5),
        // child:
        ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green, // background
        onPrimary: Colors.white,
        fixedSize: Size((devicewidth - 50), 40),
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 5),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // foreground
      ),
      onPressed: () {
        Navigator.pushNamed(context, DashboardRoute);
      },
      child: const Text(Constants.getotp),
//)
    );
  }

  Widget forgotpasswordButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.green,
      ),
      child: const Text(
        Constants.forgotpassword,
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget headerImage(String image) {
    devicewidth = MediaQuery.of(context).size.width;
    deviceheight = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
        height: deviceheight / 3,
      ),
    );
  }

  Widget bottomImage(String image) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image.asset(image, fit: BoxFit.fill, height: deviceheight / 3),
    );
  }
}
