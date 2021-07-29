import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/AddData/homepage.dart';
import 'package:flutter_application/Consultation/pastconsult.dart';
import 'package:flutter_application/Consultation/personal.dart';
import 'package:flutter_application/personalconsult.dart';
import 'main.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  var auth = FirebaseAuth.instance;
  User? user;
  bool _isSignOut = false;
  int _selectedDestination = 0;

  void _signOut() async {
    await auth.signOut().then((value) {
      setState(() {
        _isSignOut = true;
      });
    });
  }

  String _result() {
    if (user!.isAnonymous) {
      return 'UID: ' + user!.uid;
    } else if (user!.providerData[0].providerId == 'password') {
      return user!.email!;
    } else if (user!.providerData[0].providerId == 'phone') {
      return user!.phoneNumber!;
    } else {
      return user!.displayName!;
    }
  }

  @override
  void initState() {
    user = auth.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    if (_isSignOut) return MyApp();
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Color(0xff2AB7D5),
      ),
      body:Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              SizedBox(height: 36),
              Text('Hi Doctor !',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Color(0xff000000)),textAlign: TextAlign.left),
              SizedBox(height: 12),
              Text('Manage & View Your Consultations',style: TextStyle(fontSize: 14, color: Color(0xff000000))),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PersonalPage()),
                  );
                },
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/user1.png',
                          ),
                        ],
                      ),
                      SizedBox(width: 10), // give it width
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Personal Appointments',style: TextStyle(color: Color(0xff263238),fontSize: 14,fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text('Respond to your personal appointments.',style: TextStyle(color: Color(0xff30000000),fontSize: 12))
                        ],

                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 18,width: 50),
                          Image.asset(
                            'assets/images/drarrow.png',
                          )],

                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/appointment 1.png',
                          ),
                        ],
                      ),
                      SizedBox(width: 10), // give it width
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Requested Consultations',style: TextStyle(color: Color(0xff263238),fontSize: 14,fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text('Respond to your personal appointments.',style: TextStyle(color: Color(0xff30000000),fontSize: 12))
                        ],

                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 18,width: 50),
                          Image.asset(
                            'assets/images/drarrow.png',
                          )],

                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PastConsult()),
                  );
                },
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/medical-history 1.png',
                          ),
                        ],
                      ),
                      SizedBox(width: 10), // give it width
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Past Consultations',style: TextStyle(color: Color(0xff263238),fontSize: 14,fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text('View your previous consultations details.',style: TextStyle(color: Color(0xff30000000),fontSize: 12))
                        ],

                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 18,width: 50),
                          Image.asset(
                            'assets/images/drarrow.png',
                          )],

                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.only(top: 24.0),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/calendar 1.png',
                        ),
                      ],
                    ),
                    SizedBox(width: 10), // give it width
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Set Calendar',style: TextStyle(color: Color(0xff263238),fontSize: 14,fontWeight: FontWeight.bold)),
                        SizedBox(height: 6),
                        Text('Set your calendar for appointments',style: TextStyle(color: Color(0xff30000000),fontSize: 12))
                      ],

                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 18,width: 75),
                        Image.asset(
                          'assets/images/drarrow.png',
                        )],

                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
     drawer:  Drawer(
       child: ListView(
         // Important: Remove any padding from the ListView.
         padding: EdgeInsets.zero,
         children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Text(
               user!.phoneNumber!,
               style: textTheme.headline6,
             ),
           ),
           Divider(
             height: 1,
             thickness: 1,
           ),
           ListTile(
             leading: Icon(Icons.person),
             title: Text('Profile Edit'),
             selected: _selectedDestination == 0,
             onTap: () => selectDestination(0),
           ),
           ListTile(
             leading: Icon(Icons.person_add),
             title: Text('Personal Consulation'),
             selected: _selectedDestination == 1,
             onTap: () => selectDestination(1),
           ),
           ListTile(
             leading: Icon(Icons.group),
             title: Text('All Consulation'),
             selected: _selectedDestination == 2,
             onTap: () => selectDestination(2),
           ),
           Divider(
             height: 1,
             thickness: 1,
           ),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Text(
               'Logout',
             ),
           ),
           ListTile(
             leading: Icon(Icons.logout),
             title: Text('Logout'),
             selected: _selectedDestination == 3,
             onTap: () => _signOut(),
           ),
         ],
       ),
     ),

    );
  }
  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}



