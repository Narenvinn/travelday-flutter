import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelday/Routes/router.dart';
import 'package:travelday/Utils/constants.dart';
import 'package:travelday/Utils/customfont.dart';

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
      body: loginForm(),
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
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              headerImage(Constants.loginlogo),
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: boxFieldsLoad()),
              bottomImage(Constants.bottomtravellogo),
            ]),
      ),
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
    return
        Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: textfieldsLoad(Constants.mobilenumber),
        ),
        getotpButton(),
        forgotpasswordButton(),
      ],
    );
  }

  Widget textfieldsLoad(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 50),
      child: TextField(
        autofocus: false,
        style: const TextStyle(
            fontSize: 15.0, color: CustomColors.buttonThemeColor),
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: CustomColors.textfieldBackgroundThemeColor,
          hintText: title,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: CustomColors.buttonThemeColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: IconButton(
              onPressed: () {},
              icon: Image.asset(
                Constants.phonelogo,
                fit: BoxFit.fill,
                width: 14,
                height: 22,
                // ),
              )),
        ),
      ),
    );
  }

  Widget getotpButton() {
    devicewidth = MediaQuery.of(context).size.width;
    deviceheight = MediaQuery.of(context).size.height;
    return
        ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: CustomColors.buttonThemeColor, // background
        onPrimary: Colors.white,
        fixedSize: Size((devicewidth - 50), 40),
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 5),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // foreground
      ),
      onPressed: () {
        Navigator.pushNamed(context, DashboardRoute);
      },
      child: const Text(Constants.getotp),

    );
  }

  Widget forgotpasswordButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: CustomColors.buttonThemeColor,
      ),
      child: const Text(
        Constants.forgotpassword,
        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget headerImage(String image) {
    devicewidth = MediaQuery.of(context).size.width;
    deviceheight = MediaQuery.of(context).size.height;
    return
        Image.asset(
      image,
      fit: BoxFit.fill,
      width: double.infinity,
      height: deviceheight / 3 + 40,
    
    );
  }

  Widget bottomImage(String image) {
    return
       Container(
          margin: EdgeInsets.only(top: deviceheight * 0.1),
          child: Image.asset(
              image,
              fit: BoxFit.fill,
             
            ),
        );
  
  }
}
