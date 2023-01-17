import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicoo/constants/constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
        body: Column(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: getVerticalSize(56),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: getPadding(top: 16, left: 16),
                    child: Text(
                      'Welcome, Ayush',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              )),
          Padding(
            padding: getPadding(left: 16, right: 16),
            child: SizedBox(
              height: getVerticalSize(200),
              width: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 3),
                  itemBuilder: (context, index) {
                    String image =
                        "https://i.ytimg.com/vi/xy8HNniRsc4/maxresdefault.jpg";
                    String name = "My Hits ";
                    return Padding(
                      padding: getPadding(all: 8),
                      child: Container(
                        height: getVerticalSize(48),
                        width: getHorizontalSize(148),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: Color(0xFF232323)),
                        child: Row(
                          children: [
                            SizedBox(
                              height: getVerticalSize(48),
                              width: getHorizontalSize(48),
                              child: Image.network(
                                image,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: getHorizontalSize(100),
                              height: getVerticalSize(48),
                              child: Center(
                                child: Padding(
                                  padding: getPadding(left: 12),
                                  child: Text(
                                    name,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
              padding: getPadding(left: 16),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Recently Played',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: getVerticalSize(96),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  String image =
                      "https://i1.sndcdn.com/artworks-GI6defckGWiySagf-2ihGhA-t500x500.jpg";
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      color: Colors.black,
                      child: Image.network(image, fit: BoxFit.fill),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
              padding: getPadding(left: 16),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Top Artists',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: getVerticalSize(140),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  String name = "UnHoly";
                  String image =
                      "https://i1.sndcdn.com/artworks-GI6defckGWiySagf-2ihGhA-t500x500.jpg";
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1000))),
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(
                            image,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: 80,
                              child: Center(
                                  child: Text(
                                name,
                                style: GoogleFonts.montserrat(
                                    fontSize: 8, fontWeight: FontWeight.w600),
                              ))),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
              padding: getPadding(left: 16),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Popular Albums',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: getVerticalSize(96),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  String image =
                      "https://i1.sndcdn.com/artworks-GI6defckGWiySagf-2ihGhA-t500x500.jpg";
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 80,
                      width: 80,
                      // color: Colors.black,
                      child: Image.network(image, fit: BoxFit.fill),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
