import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_architecture_flutter/assets/images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var visibleLight1 = false;
  var visibleLight2 = false;
  var visibleOClock = false;
  var visibleLoginForm = false;
  var visibleBottom = false;
  var visibleLoginText = false;

  Timer timerLight1;

  Timer timerLight2;

  Timer timerOClock;

  Timer timerLoginText;

  Timer timerLoginForm;

  Timer timerBottom;

  var paddingLight1 = 260.0;
  var paddingLight2 = 340.0;
  var paddingOClock = 420.0;
  var paddingTextLogin = 160.0;
  var paddingFormLogin = 100.0;
  @override
  void initState() {
    super.initState();
    timerLight1 = Timer(Duration(milliseconds: 0), () {
      setState(() {
        visibleLight1 = true;
        paddingLight1 = 0.0;
      });
    });
    timerLight2 = Timer(Duration(milliseconds: 200), () {
      setState(() {
        visibleLight2 = true;
        paddingLight2 = 0.0;
      });
    });
    timerOClock = Timer(Duration(milliseconds: 500), () {
      setState(() {
        visibleOClock = true;
        paddingOClock = 0.0;
      });
    });
    timerLoginText = Timer(Duration(milliseconds: 750), () {
      setState(() {
        paddingTextLogin = 60.0;
        visibleLoginText = true;
      });
    });
    timerLoginForm = Timer(Duration(milliseconds: 200), () {
      setState(() {
        visibleLoginForm = true;
        paddingFormLogin = 0.0;
      });
    });
    timerBottom = Timer(Duration(milliseconds: 1500), () {
      setState(() {
        visibleBottom = true;
      });
    });
  }

  @override
  void dispose() {
    timerLight1.cancel();
    timerLight2.cancel();
    timerOClock.cancel();
    timerLoginForm.cancel();
    timerBottom.cancel();
    super.dispose();
  }

  Widget animatedWrapper(
      {Widget child, int duration, double padding, bool visible}) {
    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: padding),
      duration: Duration(milliseconds: duration),
      curve: Curves.decelerate,
      child: AnimatedOpacity(
          opacity: visible ? 1 : 0,
          duration: Duration(milliseconds: duration),
          child: child),
    );
  }

  Widget headerView() {
    return Container(
        height: 400,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageName.background), fit: BoxFit.fill)),
        child: Stack(
          children: [
            Positioned(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  animatedWrapper(
                    duration: 1000,
                    padding: paddingLight1,
                    visible: visibleLight1,
                    child: Container(
                      height: 240,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImageName.light_1),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  animatedWrapper(
                    duration: 1000,
                    padding: paddingLight2,
                    visible: visibleLight2,
                    child: Container(
                      height: 200,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImageName.light_2))),
                    ),
                  ),
                  animatedWrapper(
                    duration: 1000,
                    padding: paddingLight2,
                    visible: visibleLight2,
                    child: Container(
                      height: 320,
                      width: 80,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImageName.clock))),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 200,
                left: 0,
                right: 0,
                height: 200,
                child: Center(
                  child: Container(
                    child: animatedWrapper(
                      duration: 1000,
                      padding: paddingTextLogin,
                      visible: visibleLoginText,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }

  Widget loginForm() {
    return animatedWrapper(
      duration: 1000,
      padding: paddingFormLogin,
      visible: visibleLoginForm,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 32, right: 32),
              child: Container(
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter your email",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.black12)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.black12)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.black12)),
                      focusColor: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, left: 32, right: 32),
              child: Container(
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter your password",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.black12)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.black12)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.black12)),
                      focusColor: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 56,
                padding: EdgeInsets.only(left: 32, right: 32),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
                child: FlatButton(
                  onPressed: () => {},
                  color: Colors.indigoAccent,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(6.0)),
                )),
          ],
        ),
      ),
    );
  }

  Widget bottomForm() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text("Or log in with",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        child: Container(
                          height: 48,
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Image.asset(
                                ImageName.facebook,
                                width: 16,
                                height: 16,
                              )),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "Facebook",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: GestureDetector(
                        child: Container(
                          height: 48,
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Image.asset(
                                ImageName.google,
                                width: 16,
                                height: 16,
                              )),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "Google",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(color: Colors.red),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [headerView(), loginForm(), bottomForm()],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
