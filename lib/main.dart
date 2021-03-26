import 'package:burc_rehberi_app/burc_detay.dart';
import 'package:flutter/material.dart';

import 'burc_liste.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/");

        if (pathElemanlari[1] == "burcDetay") {
          return MaterialPageRoute(
            builder: (context) => BurcDetay(int.parse(pathElemanlari[2])),
          );
        }

        return null;
      },
      title: "Burç Rehberi App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}
