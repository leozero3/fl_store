import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_store/model/model_interface.dart';
import 'package:meta/meta.dart';

class CompraModel implements ModelInterface {
  @override
  DocumentReference docRef;

  @override
  bool excluido = false;

  int sequence;
  String uid; // Id do usuario no Firebase
  Timestamp data;
  String status;
  String tipoFrete;

  double valorFrete;
  double valorItens;
  double valorTotal;

  String cep;
  String rua;
  String numero;
  String complemento;
  String bairro;
  String cidade;
  String estado;

  CompraModel({
    @required this.docRef,
    this.sequence,
    this.excluido,
    this.uid,
    this.data,
    this.status,
    this.tipoFrete,
    this.valorFrete,
    this.valorItens,
    this.valorTotal,
    this.cep,
    this.rua,
    this.numero,
    this.complemento,
    this.bairro,
    this.cidade,
    this.estado,
  });

  CompraModel.fromJson(this.docRef, Map<String, dynamic> json)
      : sequence = json['sequence'],
        uid = json['uid'],
        data = json['data'],
        status = json['status'],
        tipoFrete = json['tipo_frete'],
        valorFrete = double.parse(json['valor_frete'].toString()),
        valorItens = double.parse(json['valor_itens'].toString()),
        valorTotal = double.parse(json['valor_total'].toString()),
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
    'sequence' : sequence,
    'uid': uid,
    'data': data,
    'status': status,
    'tipo_frete': tipoFrete,
    'valor_frete': valorFrete,
    'valor_itens': valorItens,
    'valor_total': valorTotal,
    'cep': cep,
    'rua': rua,
    'numero': numero,
    'complemento': complemento,
    'bairro': bairro,
    'cidade': cidade,
    'estado': estado,
    'excluido': excluido,
  };

  @override
  String toString() {
    return 'compra/${docRef.documentID}';
  }
}
