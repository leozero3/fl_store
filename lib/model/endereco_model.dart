import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_store/model/model_interface.dart';
import 'package:meta/meta.dart';

class EnderecoModel implements ModelInterface {
  @override
  DocumentReference docRef;

  @override
  bool excluido = false;

  String uid; // Id do usuario no Firebase
  String cep;
  String rua;
  String numero;
  String complemento;
  String bairro;
  String cidade;
  String estado;

  EnderecoModel({
    @required this.docRef,
    this.excluido,
    this.uid,
    this.cep,
    this.rua,
    this.numero,
    this.complemento,
    this.bairro,
    this.cidade,
    this.estado,
  });

  EnderecoModel.fromJson(this.docRef, Map<String, dynamic> json)
      : uid = json['uid'],
        cep = json['cep'],
        rua = json['rua'],
        numero = json['numero'],
        complemento = json['complemento'],
        bairro = json['bairro'],
        cidade = json['cidade'],
        estado = json['estado'],
        excluido = json['excluido'];

  @override
  Map<String, dynamic> toJson() => {
    'uid': uid,
    'cep': cep,
    'rua': rua,
    'numero': numero,
    'complemento': complemento,
    'bairro': bairro,
    'estado': estado,
    'cidade': cidade,
    'excluido': excluido,
  };

  @override
  String toString() {
    return 'endereco/${docRef.documentID}';
  }
}
