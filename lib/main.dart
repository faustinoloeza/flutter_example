import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maxiapp/services/apirequest.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class Car {
  Car(String this.name, int this.age);

  String name;
  int age;

  int getAge() {
    return this.age;
  }
}

final userProvider = Provider<ApiServices>((ref) {
  return ApiServices();
});

final helloWorldProvider = StateProvider<String>((ref) {
  return 'Campo';
});

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

final CarProvider = StateProvider<Car>((ref) {
  return Car('name', 20);
});

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    final int counter = ref.watch(counterStateProvider);
    final Car carro = ref.watch(CarProvider);
    final int age = carro.getAge();
    final ApiServices user = ref.watch(userProvider);
    final String name = '';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Value: $counter $value')),
        body: Center(
          child: Text('El valor de contandor es $name'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            updateValueProvider(context, ref),
          },
        ),
      ),
    );
  }
}

void updateValueProvider(BuildContext context, WidgetRef ref) {
  ref.read(counterStateProvider.notifier).state++;

  //ApiServices api = ApiServices();
}
