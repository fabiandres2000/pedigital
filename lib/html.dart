// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart'; 

class AgreementPage extends StatefulWidget {
  const AgreementPage({Key? key}) : super(key: key);
  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {

 String filePath = 'assets/files/Inicio.html';

 @override
 Widget build(BuildContext context) {
  return Scaffold(
    body : Padding(
      padding: EdgeInsets.only(top: 0),
      child: WebViewPlus(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          controller.loadUrl('assets/files/Inicio.html');
        },
      ),
    ) 
  );
 }

}