import 'package:flutter/material.dart';
import 'package:qr_reader_app/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

//launchURL(BuildContext context, ScanModel scan) async =>
//    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

launchURL (BuildContext context, ScanModel scan) async{
  final url = scan.valor;

  if(scan.tipo == 'http'){
    // Abrir el sitio web
    // ignore: deprecated_member_use
    if(await canLaunch(url)){
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}