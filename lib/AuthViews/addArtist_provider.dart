import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicoo/AuthViews/addArtist_services.dart';

final artistProvider = FutureProvider(
  (ref) async {
    var data = await ref.watch(addArtist).getArtists();
    if (data == "recall") {
      data = await ref.watch(addArtist).getArtists();
    }
    return data;
  },
);

final genre = StateProvider(
  (ref) => [],
);
