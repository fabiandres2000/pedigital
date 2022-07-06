// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:pedigital/componentes/bouncy.dart';
import 'package:pedigital/html.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({Key? key}) : super(key: key);
  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {

  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: loading,
      blurEffectIntensity: 60,
      progressIndicator: Image.asset(
        'assets/home.gif',
        fit: BoxFit.contain,
      ),
      dismissible: false,
      opacity: 1,
      color: Colors.white,
      child: Container()
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 7000), ir);
  }

  ir() async {
    Navigator.push(
      context,
      BouncyPageRoute(widget: AgreementPage())
    ); 
  }
}