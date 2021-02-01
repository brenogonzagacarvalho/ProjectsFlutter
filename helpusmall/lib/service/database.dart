import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpusmall/models/produto.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference produtoCollection = Firestore.instance.collection('produto');

  Future updateUserData(String nome, String descricao, int preco) async {
    return await produtoCollection.document(uid).setData({
      'nome': nome,
      'descricao': descricao,
      'preco': preco,
    });
  }
  // produto list from snapshot
List<Produto> _produtoListFromSnapshot(QuerySnapshot snapshot){

  return snapshot.documents.map((doc){
    return Produto(
      nome: doc.data['nome'] ?? '',
      descricao: doc.data['descricao'] ?? '0',
      preco: doc.data['preco'] ?? 0,
    );
  }).toList();
}

  //get produto stream

  Stream<List<Produto>> get produto {
    return produtoCollection.snapshots().map(_produtoListFromSnapshot);
  }

}