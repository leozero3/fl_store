import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_store/model/model_interface.dart';
import 'package:fl_store/model/produto_model.dart';
import 'package:meta/meta.dart';

class FotoModel implements ModelInterface {
  ///
  @override
  DocumentReference docRef;

  @override
  bool excluido = false;

  String url;
  ProdutoModel fkproduto;

  FotoModel({@required this.docRef, this.excluido, this.url, this.fkproduto});

  FotoModel.fromJson(this.docRef, Map<String, dynamic> json)
      : url = json['url'],
  fkproduto = (json['fk_produto'] is ProdutoModel) ? json['fkproduto'] : null,
  excluido = json['excluido'];

  @override
  Map<String, dynamic> toJson() => {
    'url' : url,
    'fk_produto' : fkproduto ?? '',
    'excluido' : excluido,
  };

  Future<ProdutoModel> loadProduto(DocumentReference itemRef) async {
    var produto = await itemRef.get();

    fkproduto = ProdutoModel.fromJson(itemRef, produto.data);
    return fkproduto;
  }

  @override
  String toString() {
    return 'foto/${docRef.documentID}';
  }





}
