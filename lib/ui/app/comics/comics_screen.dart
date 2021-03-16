import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvin_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class ComicsScreen extends StatefulWidget {
  @override
  _ComicsScreenState createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                  future: homeProvider.getComics(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      addAutomaticKeepAlives: true,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 2,
                      ),
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        String imageUrl = snapshot.data[index]['thumbnail']
                                    ['path']
                                .toString() +
                            "." +
                            snapshot.data[index]['thumbnail']['extension']
                                .toString();
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        imageUrl,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              //Image.network(imageUrl),
                              Text(
                                '${snapshot.data[index]['title'].toString()}',
                                style: GoogleFonts.dmSans(
                                  fontSize: 15.0,
                                  color: Colors.white30,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                '${snapshot.data[index]['variantDescription'].toString()}',
                                style: GoogleFonts.dmSans(
                                  fontSize: 12.0,
                                  color: Colors.white30,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
