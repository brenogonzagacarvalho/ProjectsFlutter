import 'package:flutter/material.dart';
import 'package:helpusmall/models/user.dart';
import 'package:helpusmall/telas/autenticacao/autenticacao.dart';
import 'package:helpusmall/telas/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null){
           
      return Autenticacao();
    }else{
      return Home();
    }
   
    
  }
}