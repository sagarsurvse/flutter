import 'dart:async';
import 'package:flutter/material.dart';


class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2AB7D5),
        /* appBar: AppBar(title:Text("Splash Screen Example")),*/
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: FloatingActionButton(
            child: IconButton(
              icon: Image.asset('assets/images/arrow.png'),
              color: Color(0xff2AB7D5),
              onPressed: (){
              },
            ),
            backgroundColor: Colors.white,
            onPressed: (){
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 100),
                Text('Verify your',style: TextStyle(fontSize: 24, color: Color(0xffFFFFFF)),textAlign: TextAlign.left),
                Text('number',style: TextStyle(fontSize: 24, color: Color(0xffFFFFFF))),
                SizedBox(height: 10),
                Text('Enter the OTP sent to +91-9044697187 ',style: TextStyle(fontSize: 12, color: Color(0xffFFFFFF)),),
                Container(
                  margin: const EdgeInsets.only(top: 24.0),
                  color: Color(0xff2AB7D5),
                  child: Row(
                    children: [
                      Container(
                        height: 44,
                        width: 200,
                        child: TextField(
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Enter OTP',
                            hintStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(16),
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
          ),
        )
    );
  }
}