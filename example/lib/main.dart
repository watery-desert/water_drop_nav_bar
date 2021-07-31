import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.grey[200],
          accentColor: Colors.teal[400]),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    /// [AnnotatedRegion<SystemUiOverlayStyle>] is only for android

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.bookmark_rounded,
                size: 56,
                color: Colors.amber[400],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.favorite_rounded,
                size: 56,
                color: Colors.red[400],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.email_rounded,
                size: 56,
                color: Colors.green[400],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.folder_rounded,
                size: 56,
                color: Colors.blue[400],
              ),
            ),
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          // bottomPadding: 8.0, for android maybe, test by yourself what is suitable
          backgroundColor: Colors.white,
          onItemSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: [
            BarItem(
              filledIcon: Icons.bookmark_rounded,
              outlinedIcon: Icons.bookmark_border_rounded,
            ),
            BarItem(
                filledIcon: Icons.favorite_rounded,
                outlinedIcon: Icons.favorite_border_rounded),
            BarItem(
              filledIcon: Icons.email_rounded,
              outlinedIcon: Icons.email_outlined,
            ),
            BarItem(
              filledIcon: Icons.folder_rounded,
              outlinedIcon: Icons.folder_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

