import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musicoo/AuthViews/AuthView.dart';
import 'package:musicoo/AuthViews/Login.dart';
import 'package:musicoo/AuthViews/Register.dart';
import 'package:musicoo/AuthViews/Verification.dart';
import 'package:musicoo/AuthViews/forgotpassword.dart';
import 'package:musicoo/InitialPages/Splash.dart';
import 'package:musicoo/MainViews/dashboard.dart';
import 'package:musicoo/desgins.dart';
import 'package:musicoo/providers.dart';

void main() async {
  // Initialize the Branch object
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      routes: [
        GoRoute(
          path: 'Auth',
          routes: [
            GoRoute(
                path: 'login',
                builder: (context, state) => LoginView(),
                routes: [
                  GoRoute(
                    path: 'forgot',
                    builder: (context, state) => ForgotPassword(),
                  ),
                ]),
            GoRoute(
                path: 'register',
                builder: (context, state) => RegisterView(),
                routes: [
                  GoRoute(
                    path: 'verify',
                    builder: (context, state) => VerificationPage(),
                  ),
                ]),
          ],
          builder: (context, state) => AuthView(),
        ),
      ],
      builder: (context, state) => MyHomePage(),
    ),
    GoRoute(path: '/home', builder: ((context, state) => Dashboard()))
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Musicoo',
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.light().copyWith(primary: mainColor),
      ),
      routerConfig: _router,
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key});

  StreamSubscription<Map> streamSubscription =
      FlutterBranchSdk.initSession().listen((data) {
    if (data.containsKey("+clicked_branch_link") &&
        data["+clicked_branch_link"] == true) {
      //Link clicked. Add logic to get link data
      log('Custom string: ${data["custom_string"]}');
    }
  }, onError: (error) {
    log('InitSesseion error: ${error.toString()}');
  });
  @override
  Widget build(BuildContext context, ref) {
    final token = ref.watch(token_provider);
    return token.when(data: (data) {
      return const Dashboard();
    }, error: ((error, stackTrace) {
      // context.go('/Auth');
      return const AuthView();
      // return null;
    }), loading: () {
      return const SplashScreen();
    });
  }
}
