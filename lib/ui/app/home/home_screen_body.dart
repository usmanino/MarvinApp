import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvin_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreenBody extends StatefulWidget {
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 200.0,
              child: PageView(
                children: [
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30.0,
                  height: 3.0,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Container(
                  width: 30.0,
                  height: 3.0,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Container(
                  width: 30.0,
                  height: 3.0,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Welcome',
              style: GoogleFonts.dmSans(
                fontSize: 20.0,
              ),
            ),
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
