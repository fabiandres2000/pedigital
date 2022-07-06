import 'package:flutter/cupertino.dart';

class  BouncyPageRoute extends PageRouteBuilder {

  final Widget widget;

  BouncyPageRoute({required this.widget}):super(
    transitionDuration: const Duration(seconds: 2),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secanimation, Widget child){
      animation = CurvedAnimation(parent: animation, curve: Curves.easeOut);
      return ScaleTransition(
        alignment: Alignment.center,
        scale: animation,
        child: child,
      );
    },
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secanimation){
      return widget;
    }              
  );
  

}
