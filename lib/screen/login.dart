import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:loginsystem/Widgets/FormCard.dart';
import 'package:loginsystem/model/profile.dart';
import 'package:loginsystem/screen/welcome.dart';
import 'home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }
//////////////////////////
  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder(
  //       future: firebase,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasError) {
  //           return Scaffold(
  //             appBar: AppBar(
  //               title: Text("Error"),
  //             ),
  //             body: Center(
  //               child: Text("${snapshot.error}"),
  //             ),
  //           );
  //         }
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           return Scaffold(
  //             appBar: AppBar(
  //               title: Text("เข้าสู่ระบบ"),
  //             ),
  //             body: Container(
  //               child: Padding(
  //                 padding: const EdgeInsets.all(20.0),
  //                 child: Form(
  //                   key: formKey,
  //                   child: SingleChildScrollView(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text("อีเมล", style: TextStyle(fontSize: 20)),
  //                         TextFormField(
  //                           validator: MultiValidator([
  //                             RequiredValidator(
  //                                 errorText: "กรุณาป้อนอีเมลด้วยครับ"),
  //                             EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
  //                           ]),
  //                           keyboardType: TextInputType.emailAddress,
  //                           onSaved: (String email) {
  //                             profile.email = email;
  //                           },
  //                         ),
  //                         SizedBox(
  //                           height: 15,
  //                         ),
  //                         Text("รหัสผ่าน", style: TextStyle(fontSize: 20)),
  //                         TextFormField(
  //                           validator: RequiredValidator(
  //                               errorText: "กรุณาป้อนรหัสผ่านด้วยครับ"),
  //                           obscureText: true,
  //                           onSaved: (String password) {
  // //                             profile.password = password;
  // //                           },
  // //                         ),
  // //                         SizedBox(
  //                           width: double.infinity,
  //                           child: ElevatedButton(
  //                             child: Text("ลงชื่อเข้าใช้",
  //                                 style: TextStyle(fontSize: 20)),
  //                             onPressed: () async {
  //                               if (formKey.currentState.validate()) {
  //                                 formKey.currentState.save();
  //                                 try {
  //                                   await FirebaseAuth.instance
  //                                       .signInWithEmailAndPassword(
  //                                           email: profile.email,
  //                                           password: profile.password)
  //                                       .then((value) {
  //                                     formKey.currentState.reset();
  //                                     Navigator.pushReplacement(context,
  //                                         MaterialPageRoute(builder: (context) {
  //                                       return WelcomeScreen();
  //                                     }));
  //                                   });
  //                                 } on FirebaseAuthException catch (e) {
  //                                   Fluttertoast.showToast(
  //                                       msg: e.message,
  //                                       gravity: ToastGravity.CENTER);
  //                                 }
  //                               }
  //                             },
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           );
  //         }
  //         return Scaffold(
  //           body: Center(
  //             child: CircularProgressIndicator(),
  //           ),
  //         );
  //       });


//////////////////////////////////////////////////
    Widget build(BuildContext context) {
      ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
      ScreenUtil.instance =
          ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
      return new Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Image.asset("assets/images/image_01.png"),
                ),
                Expanded(
                  child: Container(),
                ),
                Expanded(child: Image.asset("assets/images/image_02.png"))
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/logo.png",
                          width: ScreenUtil.getInstance().setWidth(110),
                          height: ScreenUtil.getInstance().setHeight(110),
                        ),
                        Text("iHelpU",
                            style: TextStyle(
                                fontFamily: "Poppins-Bold",
                                fontSize: ScreenUtil.getInstance().setSp(46),
                                letterSpacing: .6,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(180),
                    ),
                    FormCard(),
                    SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 12.0,
                            ),
                            GestureDetector(
                              onTap: _radio,
                              child: radioButton(_isSelected),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text("Remember me",
                                style: TextStyle(
                                    fontSize: 12, fontFamily: "Poppins-Medium"))
                          ],
                        ),
                        InkWell(
                          child: Container(
                            width: ScreenUtil.getInstance().setWidth(330),
                            height: ScreenUtil.getInstance().setHeight(100),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFF17ead9),
                                  Color(0xFF6078ea)
                                ]),
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF6078ea).withOpacity(.3),
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 8.0)
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () async {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: profile.email,
                                            password: profile.password)
                                        .then((value) {
                                      formKey.currentState.reset();
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return WelcomeScreen();
                                      }));
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    Fluttertoast.showToast(
                                        msg: e.message,
                                        gravity: ToastGravity.CENTER);
                                  }
                                }
                              },
                                child: Center(
                                  child: Text("SIGNIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 18,
                                          letterSpacing: 1.0)),
                                ),
                              ),

                              
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  }


Widget radioButton(bool isSelected) => Container(
      width: 16.0,
      height: 16.0,
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.black)),
      child: isSelected
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            )
          : Container(),
    );

Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: ScreenUtil.getInstance().setWidth(120),
        height: 1.0,
        color: Colors.black26.withOpacity(.2),
      ),
    );
