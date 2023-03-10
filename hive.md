# Flutter Hive 
## 설치방법
```dart
pubspec.yaml
dependencies:
	hive_generator:
	build_runner:
	
dev_dependencies:
	hive:
	hive_flutter:
```
## 환경설정
```dart
import  'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
await  Hive.initFlutter();
Hive.registerAdapter(Adapter());
await  Repository.openBox();
runApp(const  MyApp());
}
```

## Adapter
-  Adapter example
```dart
import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  List<Person> friends;
}
```
##	 Terminal Run build task 
person.g.dart
```
flutter packages pub run build_runner build
```

 ## Repository
```dart
import  'package:hive_flutter/hive_flutter.dart';

class  BoxRepository {

static  const  String  boxName = "Name";
static  openBox() async => await  Hive.openBox<T>(boxName);
static  Box  getBox() => Hive.box<T>(boxName);
static  closeBox() async => await  Hive.box(boxName).close();

}
```
## 사용 방법
```dart
var box =  Hive.box('myBox'); 
String name = box.get('name');  
DateTime birthday = box.get('birthday');

var box =  Hive.box('myBox');
box.put('name',  'Paul');
box.put('friends',  ['Dave',  'Simon',  'Lisa']);
box.put(123,  'test');
box.putAll({'key1':  'value1',  42:  'life'});
```

## 공식 문서
	-[주소](https://docs.hivedb.dev/#/)
