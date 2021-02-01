import 'package:flutter/material.dart';
import 'package:helpusmall/models/produto.dart';
import 'package:helpusmall/service/auth.dart';
import 'package:helpusmall/service/database.dart';
import 'package:provider/provider.dart';
import 'package:helpusmall/telas/home/produto_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _mostrarConfig(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: Text('bottom sheen'),
        );
      });
    }
  

    return StreamProvider<List<Produto>>.value(
      value: DatabaseService().produto, 
        child: Scaffold(
        backgroundColor: Colors.purple[700],
        appBar: AppBar(
          title: Text('Help US Mall'),
          backgroundColor: Colors.purple[800],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              }, 
              icon: Icon(Icons.person,color: Colors.white,),
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              )
            ),
            FlatButton.icon(
              onPressed: () => _mostrarConfig(), 
              icon: Icon(Icons.settings,color: Colors.white,), 
              label: Text(''),
            ),
          ],
        ),
        body: ProdutoList(),
        )
    );
  }
}