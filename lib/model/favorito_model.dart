import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_store/model/model_interface.dart';
import 'package:fl_store/model/produto_model.dart';
import 'package:meta/meta.dart';

class FavoritoModel implements ModelInterface {
  @override
  DocumentReference docRef;

  @override
  bool excluido = false;

  ProdutoModel fkProduto;
  String uid; // id do usuario no firebase

  FavoritoModel({
    @required this.docRef,
    this.uid,
    this.excluido,
  });

  FavoritoModel.fromJson(this.docRef, Map<String, dynamic> json)
      : uid = json['uid'],
        excluido = json['excluido'],
        fkProduto =
            (json['fk_produto'] is ProdutoModel) ? json['fk_produto'] : null;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'fk_produto': fkProduto.docRef ?? '',
        'excluido': excluido,
      };

  Future<ProdutoModel> loadProduto(DocumentReference itemRef) async {
    var produto = await itemRef.get();

    fkProduto = ProdutoModel.fromJson(itemRef, produto.data);

    return fkProduto;
  }

  @override
  String toString() {
    return 'favorito/${docRef.documentID}';
  }
}