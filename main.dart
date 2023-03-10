import 'package:flutter/material.dart';
import 'package:flutter_hive_test/bank_account.dart';
import 'package:flutter_hive_test/bank_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'controller.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BankAccountAdapter());
  await BoxRepository.openBox();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final Controller ctrl = Get.put(Controller());
    late BankAccount bankaccount;
    TextEditingController tctrl = TextEditingController();
    return GetMaterialApp(
        home: GetBuilder<Controller>(
      initState: (state) {
        ctrl.init_box();
        bankaccount = ctrl.observableBox.getAt(0);
      },
      builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            ctrl.addMoney();
          }),
          appBar: AppBar(
            title: Text("${bankaccount.currency} ${bankaccount.myMoney}"),
          ),
          body: Column(
            children: [
              Text("${bankaccount.currency} ${bankaccount.myMoney}"),
              SizedBox(
                  width: 200,
                  child: TextField(
                    controller: tctrl,
                    onEditingComplete: () {
                      ctrl.addName(name: tctrl.text);
                      print(tctrl.text);
                      ctrl.update();
                    },
                  )),
            ],
          )),
    ));
  }
}
