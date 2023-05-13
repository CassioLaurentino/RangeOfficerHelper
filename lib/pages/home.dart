import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rohelper/pages/modalities/duel.dart';
import 'package:rohelper/pages/modalities/fastDraw.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rohelper/pages/timer_page.dart';
// import 'package:rohelper/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(HomePage());
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Range Officer Helper"),
          centerTitle: true,
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            FloatingActionButton(
              tooltip: "Duel",
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10),
                )),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Duel(),
                ));
              },
              child: LayoutBuilder(builder: (context, constraint) {
                return Icon(Icons.adjust, size: constraint.biggest.height);
              })
            ),
            FloatingActionButton(
              tooltip: "Fast Draw",
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10),
                )),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FastDraw(),
                ));
              },
              child: LayoutBuilder(builder: (context, constraint) {
                return Icon(Icons.crop_free, size: constraint.biggest.height);
              })
            ),
            FloatingActionButton(
              tooltip: "Timer",
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10),
                )),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimerPage(),
                ));
              },
              child: LayoutBuilder(builder: (context, constraint) {
                return Icon(Icons.timer, size: constraint.biggest.height);
              })
            ),
          ],
        ),
      ),
    );
  }
}