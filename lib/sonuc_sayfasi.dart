import 'package:flutter/material.dart';

class SonucSayfasi extends StatelessWidget {
  SonucSayfasi({@required this.height, this.weight, this.vki});
  final height;
  final weight;
  final vki;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sonuçlar"),
        ),
        body: Center(
          child: Text(
              "Boyunuz = $height, Kilonuz = $weight, Vücut Kütle İndeksiniz =$vki"),
        ));
  }
}
