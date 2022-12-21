import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicoo/AuthViews/Register.dart';
import 'package:musicoo/InitialPages/Splash.dart';
import 'package:musicoo/desgins.dart';
import 'package:musicoo/providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musicoo',
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.light().copyWith(primary: mainColor),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final token = ref.watch(token_provider);
    return token.when(data: (data) {
      return const SplashScreen();
    }, error: ((error, stackTrace) {
      return const SplashScreen();
    }), loading: () {
      return const SplashScreen();
    });
  }
}
