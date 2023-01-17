import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicoo/MainViews/Search/search_provider.dart';
import 'package:musicoo/constants/constants.dart';

class Library extends ConsumerWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list1 = ref.watch(getplaylists);
    final list2 = ref.watch(getartist);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF131313),
          title: Text(
            "Library",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.add))
          ]),
      body: Padding(
        padding: getPadding(left: 24, top: 8),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(children: [
              Text(
                'Playlists',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 16),
              ),
              list1.when(
                data: (data) {
                  return Column(
                    children: data,
                  );
                },
                error: (error, stackTrace) {
                  return Text(error.toString());
                },
                loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Text(
                'Playlists',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 16),
              ),
              list1.when(
                data: (data) {
                  return Column(
                    children: data,
                  );
                },
                error: (error, stackTrace) {
                  return Text(error.toString());
                },
                loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
