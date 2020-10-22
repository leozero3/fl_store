import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_store/model/model_interface.dart';
import 'package:meta/meta.dart';

class BannerModel implements ModelInterface {
  ///
  @override
  DocumentReference docRef;

  @override
  bool excluido = false;

  Timestamp dataInicial;
  Timestamp dataFinal;
  String urlImagem;

  ///

  BannerModel({
    @required this.docRef,
    this.excluido,
    this.dataInicial,
    this.dataFinal,
    this.urlImagem
  });

  ///

  BannerModel.fromJson(this.docRef, Map<String, dynamic> json)
    : dataInicial = json['data_inicial'],
      dataFinal = json['data_final'],
      urlImagem = json['url_imagem'],
      excluido = json['excluido'];
  ///

  Map<String, dynamic> toJson() => {
    'data_inicial' : dataInicial,
    'data_final' : dataFinal,
    'url_imagem' : urlImagem,
    'excluido' : excluido,
  };

  @override
  String toString() {
    return 'banner/${docRef.documentID}';
  }

  ///


}

