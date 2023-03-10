import 'package:flutter_hive_test/bank_account.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BoxRepository {
  static const String boxName = "Name";

  static openBox() async => await Hive.openBox<BankAccount>(boxName);

  static Box getBox() => Hive.box<BankAccount>(boxName);

  static closeBox() async => await Hive.box(boxName).close();
}
