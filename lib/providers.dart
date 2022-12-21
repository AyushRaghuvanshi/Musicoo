import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicoo/Sevices/token_services.dart';

final token_provider = FutureProvider<String>(((ref) async {
  return ref.watch(tokenprovider).get_token();
}));
