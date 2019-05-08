import 'dart:io';

import 'package:carona_prime/contacts/contact_helper.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {

  final ContactCp contact;

  ContactPage({this.contact});
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _hourController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;

  ContactCp _editedContact;

  @override
  void initState() {
    super.initState();

    if(widget.contact == null){
      _editedContact = ContactCp();
    }else{
      _editedContact = ContactCp.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _dateController.text = _editedContact.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCC4B22),
        title: Text(_editedContact.name ?? "Novo Grupo"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: _editedContact.img != null
                          ? FileImage(File(_editedContact.img))
                          : AssetImage("assets/logo.png")),
                ),
              ),
            ),
            TextField(
              controller: _nameController,
              focusNode: _nameFocus,
              decoration: InputDecoration(
                labelText: "Nome do Grupo",
                labelStyle: TextStyle(color: Color(0xFFCC4B22)),
              ),
              onChanged: (text){
                _userEdited = true;
                setState(() {
                  _editedContact.name = text;
                });
              },
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                  labelText: "Data da Carona",
                  labelStyle: TextStyle(color: Color(0xFFCC4B22))),
              onChanged: (text){
                _userEdited = true;
                _editedContact.phone = text;
              },
            ),
            TextField(
              controller: _hourController,
              decoration: InputDecoration(
                  labelText: "Horário da Carona",
                  labelStyle: TextStyle(color: Color(0xFFCC4B22))),
              onChanged: (text){
                _userEdited = true;
                _editedContact.phone = text;
              },
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color(0xFFCC4B22),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              FlatButton(
                child: Text(
                  'Prosseguir',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0 ,
                  ),
                ),
                onPressed: (){
                  if(_editedContact.name != null && _editedContact.name.isNotEmpty){
                    Navigator.pop(context, _editedContact);
                  }else{
                    FocusScope.of(context).requestFocus(_nameFocus);
                  }
                },
              ),
            ],
          )
      ),
    );
  }
}
