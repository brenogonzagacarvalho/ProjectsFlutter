import 'package:flutter/material.dart';
import 'package:helpusmall/models/produto.dart';
import 'package:provider/provider.dart';
import 'package:helpusmall/telas/home/produto_tile.dart';

class ProdutoList extends StatefulWidget {
  ProdutoList({Key key}) : super(key: key);

  @override
  _ProdutoListState createState() => _ProdutoListState();
}

class _ProdutoListState extends State<ProdutoList> {
  @override
  Widget build(BuildContext context) {

    final produto = Provider.of<List<Produto>>(context);
    
    return ListView.builder(
        itemCount: produto.length,
        itemBuilder: (context, index){
          return ProdutoTile(produto: produto[index]);
        },

    );
  }
}