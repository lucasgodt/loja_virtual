import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  PlaceTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 100.0,
            child: Image.network(
                snapshot.data["image"],
                fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    snapshot.data["title"],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0
                    ),
                  ),
                  Text(
                    snapshot.data["address"],
                    textAlign: TextAlign.start,
                  )
                ],
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                  onPressed: (){
                    launch("https://www.google.com/maps/search/?api=1&query=${snapshot.data["lat"]},${snapshot.data["long"]}");
                  },
                  child: Text("Ver no mapa", style: TextStyle(color: Theme.of(context).primaryColor),),
                  color: Colors.transparent,
                  padding: EdgeInsets.zero,
              ),
              FlatButton(
                onPressed: (){
                  launch("tel:${snapshot.data["phone"]}");
                },
                child: Text("Ligar", style: TextStyle(color: Theme.of(context).primaryColor),),
                color: Colors.transparent,
                padding: EdgeInsets.zero,
              )
            ],
          )
        ],
      ),
    );
  }
}
