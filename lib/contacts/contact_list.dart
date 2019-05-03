import 'dart:io';

import 'package:carona_prime/contacts/contact_helper.dart';
import 'package:carona_prime/contacts/contact_page.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  ContactHelper helper = ContactHelper();

  List<ContactCp> contacts = List();

  @override
  void initState() {
    super.initState();
   _getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactPage();
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFCC4B22),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return _contactCard(context, index);
          }),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: contacts[index].img != null
                          ? FileImage(File(contacts[index].img))
                          : AssetImage("assets/logo.png")),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      contacts[index].name ?? "",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      contacts[index].phone ?? "",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }

  void _showOptions(BuildContext context, int index){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return BottomSheet(
            onClosing: (){},
            builder: (context){
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child:                     FlatButton(
                        child: Text("Visualizar",
                          style:
                          TextStyle(color: Color(0xFFCC4B22),
                              fontSize: 20.0
                          ),
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                          _showContactPage(contact: contacts[index]);
                        },
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child:                     FlatButton(
                          child: Text("Excluir",
                            style:
                            TextStyle(color: Color(0xFFCC4B22),
                                fontSize: 20.0
                            ),
                          ),
                          onPressed: (){
                            helper.deleteContactCp(contacts[index].id);
                            setState(() {
                              contacts.removeAt(index);
                              Navigator.pop(context);
                            });
                          },
                        ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  void _showContactPage({ContactCp contact}) async {
    final redContact = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactPage(
                  contact: contact,
                )));
    if(redContact != null){
      if(contact != null){
        await helper.updateContactCp(redContact);
        _getAllContacts();
      }else{
        await helper.saveContactCp(redContact);
      }
      _getAllContacts();
    }
  }

  void _getAllContacts(){
    helper.getAllContactsCp().then((list){
      setState(() {
        contacts = list;
      });
    });
  }
}
