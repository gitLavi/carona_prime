import 'package:carona_prime/contacts/contact_helper.dart';
import 'package:carona_prime/login/status_login.dart';
import 'package:carona_prime/login/login_page.dart';
import 'package:carona_prime/login/welcome_page.dart';
import 'package:carona_prime/ride/group_helper.dart';
import 'package:carona_prime/ride/ride_map.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

RideGroup testGroup = new RideGroup();


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  GroupHelper groupHelper = GroupHelper();
  ContactHelper helper = ContactHelper();
  var uuid = new Uuid();

  @override
  Widget build(BuildContext context) {

    

    var location = new Location();
    var currentLocation = <String, double>{};

    PermissionHandler().requestPermissions([PermissionGroup.location]);
    

    testGroup.groupName = "Neucigrupo";
    testGroup.fromTo = "Imperial X UFMT";
    testGroup.origin = 123.0;
    testGroup.destiny = 321.0;
    testGroup.adm = "996740046";

    final testContact = RaisedButton (
      onPressed: () async {
        //helper.mergeFbToCp();
        //testGroup.groupId = uuid.v4();
        //groupHelper.createGroup(testGroup);
        //groupHelper.groupRequest("223322342", testGroup.adm, testGroup.groupId);
        //currentLocation = await location.getLocation();
        print(currentLocation);
        testGroup.groupName = "Danigrupo";
        print(testGroup.groupName);
        
      },
    );

    return Scaffold(
      appBar: new AppBar(
        title: new Text('Carona Prime')
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFCC4B22),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            
            FlatButton(
              child: Text(
                'voltar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0 ,
                ),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> WelcomePage())
                );
              },
            ),
          ],
        )
      ),
    

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Caroneiro: " + testGroup.groupName + "\n"
              "Latitude: " + currentLocation.toString() + "\n"
              
              //"Status: " + status,
            ),
            testContact
          ],
        ),
      ),
    );
  }
}