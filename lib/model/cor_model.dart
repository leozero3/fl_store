import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_store/model/model_interface.dart';
import 'package:fl_store/model/produto_model.dart';
import 'package:meta/meta.dart';

class CorModel implements ModelInterface {
  @override
  DocumentReference docRef;

  @override
  bool excluido = false;

  ProdutoModel fkProduto;
  String texto;

  CorModel({
    @required this.docRef,
    this.excluido,
    this.fkProduto,
    this.texto,
  });

  CorModel.fromJson(this.docRef, Map<String, dynamic> json)
      : texto = json['texto'],
        fkProduto =
        (json['fk_produto'] is ProdutoModel) ? json['fk_produto'] : null,
        excluido = json['excluido'];

  @override
  Map<String, dynamic> toJson() => {
    'texto': texto,
    'fk_produto': fkProduto ?? '',
    'excluido': excluido,
  };

  Future<ProdutoModel> loadProduto(DocumentReference itemRef) async {
    var produto = await itemRef.get();

    fkProduto = ProdutoModel.fromJson(itemRef, produto.data);

    return fkProduto;
  }

  @override
  String toString() {
    return 'cor/${docRef.documentID}';
  }
}
