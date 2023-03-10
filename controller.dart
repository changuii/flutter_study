import 'package:flutter_hive_test/bank_account.dart';
import 'package:flutter_hive_test/bank_repository.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Controller extends GetxController {
  final Box _observableBox = BoxRepository.getBox();

  Box get observableBox => _observableBox;

  init_box() {
    BankAccount ba = BankAccount(currency: 'name', myMoney: 1234);
    _observableBox.add(ba);
    update();
  }

  addMoney() {
    BankAccount ba = _observableBox.getAt(0);
    ba.myMoney = ba.myMoney! + 100;
    _observableBox.putAt(0, ba);
    update();
  }

  addName({required String name}) {
    BankAccount ba = _observableBox.getAt(0);
    ba.currency = name;
    _observableBox.putAt(0, ba);
    update();
  }
}
