# GetX 상태관리

설치
```dart
dependencies:
  get:
```

MVC 구조를 사용

model - class 
```dart
class Person{
    Person({this.age, this.name});

    int? age;
    String? name;
}
```

controller - class, GetxController

방식1
```dart
class Controller extends GetxController{
    Person _person = Person(); 
    Person get person => _person;

    // 직접 수정도 가능
    set_name(String name){
        person.name = name;
        update();
    }
}

Controller ctrl = Get.put(Controller());
// view
GetBuilder<Person>(
    builder : (_)=>Row(children : [
        Text("${ctrl.person.age}"),
        TextButton(
            text: Text("add age"),
            onPressed : (){
                ctrl.person.age++;
        })]);
)

```

방식2
```dart
class Controller extends GetxController{
    Person person = Person().obs;

    // 직접 수정도 가능
    set_name(String name){
        person.name = name;
    }
}

Controller ctrl = Get.put(Controller());
// view
Obx(()=>Row(children : [
        Text("${ctrl.person.age}"),
        TextButton(
            text: Text("add age"),
            onPressed : (){
                ctrl.person.age++;
        })]);
)
```

페이지 이동

```dart
Get.to(widget) // 위젯으로 이동 (스택으로 쌓인다.)
Get.off(widget) // 이전 페이지를 삭제 후 이동
Get.back() // 이전 페이지로 이동
Get.to(widget, arguments : data) // 데이터를 가지고 이동
var data = Get.arguments // 이전 데이터를 받아온다.
```

