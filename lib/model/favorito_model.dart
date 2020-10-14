import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class FavoritoModel {

  DocumentReference docRef;

  ProdutoModel fkProduto;

  String uid;  // id do usuario no firebase

  bool excluido = false;

  FavoritoModel({@required this.docRef, this.fkProduto, this.uid, this.excluido});

  FavoritoModel.fromJson(this.docRef,  Map<String, dynamic> json);

}