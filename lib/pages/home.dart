import 'package:flutter/material.dart';
import 'package:rohelper/pages/modalities/duel.dart';
import 'package:rohelper/pages/modalities/fastDraw.dart';

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
                return Icon(Icons.adjust, size: constraint.biggest.height);
              })
            ),
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey,
            ),
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey,
            ),
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey,
            ),
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey,
            ),
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey,
            ),
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey,
            )
          ],
        ),
      ),
    );
  }
}