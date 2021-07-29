import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/AddData/oprations.dart';

class ProductItem extends StatefulWidget {
  final String productName;
  final String productPrice;
  final String imageUrl;
  final bool isFavourite;
  final String id;
  final DocumentSnapshot documentSnapshot;
  ProductItem({
    required this.imageUrl,
    required this.documentSnapshot,
    required this.id,
    required this.isFavourite,
    required this.productName,
    required this.productPrice,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24,right: 24,top: 24),
      height: 107,
      child: Row(
        children: <Widget>[

         /* Container(
            height: 100,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network("https://i.pinimg.com/originals/b6/7f/ca/b67fcadb4595478aa2a48636ef7b4505.png",
                fit: BoxFit.cover,
              ),
            ),
          ),*/

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          widget.productName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Rs. ${widget.productPrice}",
                            style:
                            TextStyle(color: Color(0xff2DC4E5), fontSize: 14)),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(widget.productPrice,
                            style:
                            TextStyle(color: Color(0xff30000000), fontSize: 10)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/drarrow.png',
                )],

            ),
          ),


        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
    );
  }
}