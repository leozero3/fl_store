import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ModelInterface {
  // Id de referencia do documento no Firestore
  DocumentReference docRef;

  // Todos os documentos de todas as collections
  // devem ter um campo que vai informar se o
  // registro ja foi excluido
  bool excluido = false;


}