import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ml_kit/bloc/bloc.dart';
import 'package:flutter_ml_kit/service/firebase_ml_kit_service.dart';
import 'package:flutter_ml_kit/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ML Kit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => ScanBloc(service: FirebaseMLKitService()),
        child: const HomePage(),
      ),
    );
  }
}
