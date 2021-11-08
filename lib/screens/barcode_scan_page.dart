import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';

late List<CameraDescription> cameras;


void logError(String code, String? message) =>
    print('Error: $code\nError Message: $message');

class ValletScan extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<ValletScan> with SingleTickerProviderStateMixin {

  QRReaderController? controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late AnimationController animationController;

  @override
  Future<void> initState() async {

    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 3),
    );

    animationController.addListener(() {
      this.setState(() {});
    });
    animationController.forward();
    verticalPosition = Tween<double>(begin: 0.0, end: 300.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear))
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          animationController.reverse();
        } else if (state == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });

    checkCameraPermission().then((value) {
      if (value == PermissionStatus.granted) {
        onNewCameraSelected(cameras[0]);
      } else {
        requestCameraPermission().then((value) {
          if (value == PermissionStatus.granted) {
            onNewCameraSelected(cameras[0]);
          }
        });
      }
    });
  }

  late Animation<double> verticalPosition;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          bottom: PreferredSize(
              child: Container(
                child: Divider(color: Colors.white),
                width:312 ,
              ),
              preferredSize: Size.fromHeight(10.0)),

          backgroundColor: Color(0xff005381),
          elevation: 0,
          leading: Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).maybePop(),
              child: Image.asset(
                'assets/arrow_left_white.png',
                width: 18,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/loading_gif_white.png",
                fit: BoxFit.contain,
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.all(30.0),
              )
            ],

          ),

        ),

        body: Container(
          color: Color(0xff005381),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: Image.asset(
                      "assets/scanning_icon.png",
                      fit: BoxFit.contain,
                      height: 50,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                  ),
                  Text(
                    "Lütfen bilet üzerindeki barkodu okut.",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              Positioned(
                top: 280,
                left: 77,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 300.0,
                      width: 247.0,
                      child: Container(
                        child: new Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          child: new Center(
                            child: _cameraPreviewWidget(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: verticalPosition.value + 5,
                      child: Container(
                        width: 247.0,
                        height: 2.0,
                        color: Colors.red,
                      ),
                    ),

                  ],

                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'ya da',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle:
                      const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {                          },
                    child: const Text(
                      'Plakanı Gir',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller!.value.isInitialized!) {
      return const Text(
        'No camera selected',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return new AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: new QRReaderPreview(controller!),
      );
    }
  }

  void onCodeRead(dynamic value) {
    showInSnackBar(value.toString());
    // ... do something
    // wait 5 seconds then start scanning again.
    new Future.delayed(const Duration(seconds: 5), controller!.startScanning);
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }
    controller = new QRReaderController(cameraDescription, ResolutionPreset.low,
        [CodeFormat.qr, CodeFormat.pdf417], onCodeRead);

    // If the controller is updated then update the UI.
    controller!.addListener(() {
      if (mounted) setState(() {});
      if (controller!.value.hasError) {
        showInSnackBar('Camera error ${controller!.value.errorDescription}');
      }
    });

    try {
      await controller!.initialize();
    } on QRReaderException catch (e) {
      logError(e.code, e.description);
      showInSnackBar('Error: ${e.code}\n${e.description}');
    }

    if (mounted) {
      setState(() {});
      controller!.startScanning();
    }
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.maybeOf(_scaffoldKey.currentContext!)
        ?.showSnackBar(SnackBar(content: new Text(message)));
  }
}
