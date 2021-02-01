import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[700],
      child: Center(
        
        child: Image.asset('images/icon-localizacao.png'),
        
      ),

    );
  }
}