import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicoo/AuthViews/addArtist2/addArtist2_services.dart';
import 'package:musicoo/AuthViews/addArtist_services.dart';

final artist2Provider = FutureProvider((ref) async{
  var data = await ref.watch(addArtist2).getArtists();
  if(data =="recall"){
     data = await ref.watch(addArtist2).getArtists();
  }
  return data;
},);

final artist = StateProvider((ref) => [],);