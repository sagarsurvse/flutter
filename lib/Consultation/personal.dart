import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/AddData/adddata.dart';
import 'package:flutter_application/AddData/productitem.dart';
import 'package:flutter_application/Consultation/requstedcon.dart';


class PersonalPage extends StatefulWidget {
  static const routeName = 'homePage';
  @override
  PersonalPageState createState() => PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
  late String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("Personal Consultations",style: TextStyle(fontSize: 18),)
          ],
        ),
        backgroundColor: Color(0xff2AB7D5),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data!.docs[index];
              return ProductItem(
                documentSnapshot: data,
                id: data.id,
                isFavourite: data['isFavourite'],
                imageUrl: data['imageUrl'],
                productName: data['productName'],
                productPrice: data['productPrice'],
              );
            },
          );
        },
      ),
    );
  }
}