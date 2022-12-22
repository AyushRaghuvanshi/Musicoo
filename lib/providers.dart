import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicoo/Sevices/token_services.dart';

final token_provider = FutureProvider<String>(((ref) async {
  return ref.watch(api).get_token();
}));
final login = FutureProvider<dynamic>(((ref) async {
  final String mail = ref.watch(email);
  final String pass = ref.watch(password);
  return ref.watch(api).login(mail, pass);
}));

final email = StateProvider(((ref) => ""));

final password = StateProvider(((ref) => ""));

