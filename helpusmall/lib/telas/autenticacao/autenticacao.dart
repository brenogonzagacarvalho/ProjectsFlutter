import 'package:flutter/material.dart';
import 'package:helpusmall/telas/autenticacao/sign_in.dart';
import 'package:helpusmall/telas/autenticacao/register.dart';

class Autenticacao extends StatefulWidget {
  Autenticacao({Key key}) : super(key: key);

  @override
  _AutenticacaoState createState() => _AutenticacaoState();
}

class _AutenticacaoState extends State<Autenticacao> {
  
  bool mostrarSignIn = true;
  
  void toggleView(){
    setState(()=> mostrarSignIn = !mostrarSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if ( mostrarSignIn ){
      return SignIn(toogleView: toggleView);
    }else {
      return Register(toogleView: toggleView);
    }
  }
}