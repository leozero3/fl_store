import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:intl/intl.dart';


//
// Para os extension methods funcionar é necessário
// que exista um arquivo com o nome 'analysis_options.yaml'
// na raiz do projeto com o seguinte conteúdo:
//
// enable-experiment:
//   - extension-methods
//
// e que no arquivo 'pubspec.yaml'
// o envronment skd seja: ">=2.6.0 <3.0.0"
//


extension extrasTodouble on double {
  /// Este metodo vai facilitar a transformacao
  /// de um valor em double para o formato de
  /// moeda usado no Brasil, ou seja, BRL
  String toBRL() {
    String result = 'R\$ ';
    
    result += this.toStringAsFixed(2);
    result = result.replaceFirst('\.', ',');

    return result;
  }
}

extension extrasToTimestamp on Timestamp {
  /// Este metodo vai formatar sua data
  /// que chegou do Firestore como Timestamp
  /// para um formato mais amigavel, normalmente
  /// usado no Brasil.
  ///
  /// [format] padrao eh 'dd/MM/yy HH:mm'
  ///
  /// Para compreender melhor quais os valores que vao
  /// funcionar em [format] verifique os padroes no
  /// link https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html

  String toFormat({format: 'dd/MM/yy HH:mm'}){
    var formatter = DateFormat(format);

    return formatter.format(this.toDate());
  }
}