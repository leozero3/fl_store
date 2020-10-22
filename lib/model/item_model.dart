import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_store/model/compra_model.dart';
import 'package:fl_store/model/cor_model.dart';
import 'package:fl_store/model/model_interface.dart';
import 'package:fl_store/model/produto_model.dart';
import 'package:meta/meta.dart';

class ItemModel implements ModelInterface {
  @override
  DocumentReference docRef;

  @override
  bool excluido = false;

  String titulo;
  int quantidade;
  double preco;
  double valorUnitario;
  double valorTotal;

  CompraModel fkCompra;
  ProdutoModel fkProduto;
  CorModel fkCor;

  ItemModel({
    @required this.docRef,
    this.excluido,
    this.titulo,
    this.quantidade,
    this.preco,
    this.valorUnitario,
    this.valorTotal,
    this.fkCompra,
    this.fkProduto,
    this.fkCor,
  });

  ItemModel.fromJson(Map<String, dynamic> json)
      : titulo = json['titulo'],
        quantidade = json['quantidade'],
        preco = json['preco'],
        valorUnitario = json['valor_unitario'],
        valorTotal = json['valor_total'],
        fkCompra =
        (json['fk_compra'] is CompraModel) ? json['fk_compra'] : null,
        fkProduto =
        (json['fk_produto'] is ProdutoModel) ? json['fk_produto'] : null,
        fkCor = (json['fk_cor'] is CorModel) ? json['fk_cor'] : null,
        excluido = json['excluido'];

  @override
  Map<String, dynamic> toJson() => {
    'titulo': titulo,
    'quantidade': quantidade,
    'preco': preco,
    'valor_unitario': valorUnitario,
    'valor_total': valorTotal,
    'fk_compra': fkCompra ?? '',
    'fk_produto': fkProduto ?? '',
    'fk_cor': fkCor ?? '',
    'excluido': excluido,
  };

  Future<CompraModel> loadCompra(DocumentReference itemRef) async {
    var compra = await itemRef.get();
    fkCompra = CompraModel.fromJson(itemRef, compra.data);
    return fkCompra;
  }

  Future<ProdutoModel> loadProduto(DocumentReference itemRef) async {
    var produto = await itemRef.get();
    fkProduto = ProdutoModel.fromJson(itemRef, produto.data);
    return fkProduto;
  }

  Future<CorModel> loadCor(DocumentReference itemRef) async {
    var cor = await itemRef.get();
    fkCor = CorModel.fromJson(itemRef, cor.data);
    return fkCor;
  }

  @override
  String toString() {
    return 'item/${docRef.documentID}';
  }
}
