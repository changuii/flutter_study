import 'package:hive/hive.dart';

part 'bank_account.g.dart';

@HiveType(typeId: 1)
class BankAccount {
  BankAccount({this.currency, this.myMoney});
  @HiveField(0, defaultValue: "value")
  String? currency;

  @HiveField(1)
  int? myMoney;
}
