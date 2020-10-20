import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_store/model/model_interface.dart';
import 'package:meta/meta.dart';

class CategoriaModel implements ModelInterface {
  @override
  DocumentReference docRef;

  @override
  bool excluido = false;

  String nome;
  String icone;

  CategoriaModel({@required this.docRef, this.excluido, this.nome, this.icone});

  CategoriaModel.fromJson(this.docRef, Map<String, dynamic> json)
      : nome = json['nome'],
        excluido = json['excluido'],
        icone = json['icone'] ;

  Map<String, dynamic> toJson() => {
    'nome' : nome,
    'icone' : icone,
    'excluido' : excluido,
  };

  @override
  String toString() {
    return 'categoria/${docRef.documentID}';
  }

}