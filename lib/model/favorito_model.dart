class FavoritoModel {
  String fkProduto;
  String uid;  // id do usuario no firebase
  bool excluido = false;

  FavoritoModel({this.fkProduto, this.uid, this.excluido});

}