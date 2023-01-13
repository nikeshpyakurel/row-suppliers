import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(webapp());

class webapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Row Suppliers',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            const CircularProgressIndicator(
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  late WebViewController _controller;
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Suppliers'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              launch('tel:9843149843');
            },
            icon: Icon(Icons.phone),
            iconSize: 20,
          ),
          IconButton(
            onPressed: () {
              launch('tel:9808974855');
            },
            icon: Icon(Icons.phone_android),
            iconSize: 20,
          ),
          IconButton(
            onPressed: () {
              launch('mailto:mail@rowsuppliers.com');
            },
            icon: Icon(Icons.email),
            iconSize: 20,
          ),
        ],
      ),
      body: Center(
          child: WebView(
        initialUrl: 'https://rowsuppliers.com/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      )),
    );
  }
}
