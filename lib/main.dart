import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CountProvider(
      count: 3,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final count = CountProvider.of(context)!.count;

    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            CountProvider.of(context)!.count++;
          },
          child: Text(
            '$count',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}

class CountProvider extends InheritedWidget {
  int count;
  final Widget child;

  CountProvider({
    required this.count,
    required this.child,
  }) : super(child: child);

  static CountProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CountProvider>();
  }

  @override
  bool updateShouldNotify(CountProvider oldWidget) {
    return count != oldWidget.count;
  }
}
