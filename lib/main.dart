import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ageProvider(
      age: 0,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    int ageNumber = ageProvider.of(context)!.age;
    // print(ageNumber);

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('InheritedWidget Example'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              ageNumber <= 5
                  ? 'I am $ageNumber years old'
                  : 'I am $ageNumber years old',
              style: const TextStyle(color: Colors.white, fontSize: 40.0),
            ),
            const SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: () {
                ageNumber++;
                print('age is $ageNumber');
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Text(
                  'add age',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                ageNumber--;
                print('age is $ageNumber');
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Text(
                  'reduce age',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ageProvider extends InheritedWidget {
  final int age;
  final Widget child;

  ageProvider({
    super.key,
    required this.age,
    required this.child,
  }) : super(child: child);

  static ageProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ageProvider>();
  }

  @override
  bool updateShouldNotify(ageProvider oldWidget) {
    print('old is ${oldWidget.age}');
    print('new is ${age}');
    return oldWidget.age != age;
  }
}
