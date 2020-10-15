import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_store/model/categoria_model.dart';
import 'package:fl_store/model/model_interface.dart';
import 'package:meta/meta.dart';

class ProdutoModel implements ModelInterface {
  @override
  DocumentReference docRef;

  @override
  bool excluido = false;

  String titulo;
  String chamada;
  String detalhe;
  double preco;
  CategoriaModel fkCategoria;

  ProdutoModel(
      {@required this.docRef,
      this.excluido,
      this.titulo,
      this.chamada,
      this.detalhe,
      this.preco,
      this.fkCategoria});

  ProdutoModel.fromJson(this.docRef, Map<String, dynamic> json)
      : titulo = json['titulo'],
        chamada = json['chamada'],
        detalhe = json['detalhe'],
        preco = json['preco'],
        excluido = json['excluido'],
        fkCategoria = (json['fk_categoria'] is CategoriaModel) ? json['fk_categoria'] : null;
}
