import 'package:carona_prime/contacts/contact_list.dart';
import 'package:flutter/material.dart';

class GroupList extends StatefulWidget {
  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  final _contactController = TextEditingController();

  List _contactsList = [];

  void _addContact() {
    setState(() {
      Map<String, dynamic> newContact = Map();
      newContact["title"] = _contactController.text;
      _contactController.text = "";
      newContact["ok"] = false;
      _contactsList.add(newContact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos", style: TextStyle(fontSize: 30.0)),
        backgroundColor: Color(0xFFCC4B22),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _contactController,
                    decoration: InputDecoration(
                      labelText: "novo contato",
                      labelStyle: TextStyle(color: Color(0xFFCC4B22)),
                    ),
                  ),
                ),
                RaisedButton(
                  color: Color(0xFFCC4B22),
                  child: Icon(Icons.search, color: Colors.white,),
                  onPressed: _addContact,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _contactsList.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(_contactsList[index]["title"]),
                    activeColor: Color(0xFFCC4B22),
                    value: _contactsList[index]["ok"],
                    secondary: CircleAvatar(
                      backgroundColor: Color(0xFFCC4B22),
                      child: Icon(


                        _contactsList[index]["ok"] ? Icons.check : Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (c){
                      setState(() {
                        _contactsList[index]["ok"] = c;
                      });
                    },
                  );
                }),
          ),
          BottomAppBar(
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
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactList()),
                      );
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
