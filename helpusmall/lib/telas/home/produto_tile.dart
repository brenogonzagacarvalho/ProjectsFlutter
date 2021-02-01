import 'package:flutter/material.dart';
import 'package:helpusmall/models/produto.dart';

class ProdutoTile extends StatelessWidget {

  final Produto produto;
  ProdutoTile({this.produto});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            child: Text('Preco ${produto.preco}'),
            backgroundColor: Colors.lightBlue[produto.preco],            
          ),
          title: Text(produto.nome),
          subtitle: Text(produto.descricao),
        ),
      ),
    );
  }
}