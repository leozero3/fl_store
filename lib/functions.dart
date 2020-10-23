import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:intl/intl.dart';


extension extrasTodouble on double {
  String toBRL() {
    String result = 'R\$ ';
    
    result += this.toStringAsFixed(2);
    result = result.replaceFirst('\.', ',');

    return result;
  }
}

extension extrasToTimestamp on Timestamp {
  String toFormat({format: 'dd/MM/yy HH:mm'}){

  }
}