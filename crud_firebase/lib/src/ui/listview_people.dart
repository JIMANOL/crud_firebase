// ignore_for_file: prefer_const_constructors_in_immutables, deprecated_member_use, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/src/model/people.dart';
import 'package:crud_firebase/src/ui/information_people.dart';
import 'package:crud_firebase/src/ui/screen_people.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';

class ListViewPerson extends StatefulWidget {
  //ListViewPerson({Key key}) : super(key: key); // --> Marcó error
  ListViewPerson({required Key key}) : super(key: key);

  @override
  ListViewPersonState createState() => ListViewPersonState();
}

final personaRef = FirebaseDatabase.instance.reference().child('persona');

class ListViewPersonState extends State<ListViewPerson> {
  //List<Persona> items; //Error por no inicializar :c
  late List<Persona> items;
  //StreamSubscription<Event> ---Personas; //Error por no inicializar :c
  late StreamSubscription<Event> addPersonas;
  late StreamSubscription<Event> changePersonas;
  @override
  void initState() {
    super.initState();
    //items = new List(); // --> Marcó error
    items = List.empty();
    addPersonas = personaRef.onChildAdded.listen((event) {
      _addPersona; //Aquí estaba _addPersona pero la profa no hizo la funcion
    });
    changePersonas = personaRef.onChildAdded.listen((event) {
      _updatePersona;
    });
  }

  @override
  void dispose() {
    super.dispose();
    addPersonas.cancel();
    changePersonas.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda Personal',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listado Agenda'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 12.0),
              itemBuilder: (context, position) {
                return Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          '${items[position].nombre}',
                          style: TextStyle(
                              color: Color.fromARGB(255, 30, 30, 31),
                              fontSize: 21.0),
                        ),
                        subtitle: Text(
                          '${items[position].apellido}',
                          style: TextStyle(
                              color: Colors.redAccent, fontSize: 21.0),
                        ),
                        leading: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.amberAccent,
                              radius: 17.0,
                              child: Text(
                                '${position + 1}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 21.0),
                              ),
                            ),
                          ],
                        ),
                        onTap: () => infoPersona(context, items[position]),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.purple,
                      ),
                      onPressed: () => _showDialog(context, position),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.info,
                        color: Colors.purple,
                      ),
                      onPressed: () => _verPersona(context, items[position]),
                    ),
                  ],
                ); //Lleva ; por la funcion RETURN
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.red[100],
          ),
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: () => _agregarPersona(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void _showDialog(BuildContext context, int position) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alerta'),
            content: Text('¿Realmente desea eliminar el Registro?'),
            // ignore: prefer_const_literals_to_create_immutables
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () =>
                    _borrarPersona(context, items[position], position),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // HACER NADA :v
                  },
                  child: Text('Cancelar'))
            ],
          ); //Lleva ; por la funcion RETURN
        });
  }
  /*
  void _agregarPersona(Event event) {
    setState(() {
      // ignore: unnecessary_new
      items.add(new Persona.fromSnapShot(event.snapshot));
    });
  }
  */

  void _agregarPersona(BuildContext context) async {
    await Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        // ignore: avoid_init_to_null
        var id = null;
        return
            // No permitió Persona(Null, '', '', '', '', '', '',)
            ScreenPersona(Persona(
          id,
          '',
          '',
          '',
          '',
          '',
          '',
        ));
      },
    ));
  }

  void _addPersona(Event event) {
    setState(() {
      // ignore: unnecessary_new
      items.add(new Persona.fromSnapShot(event.snapshot));
    });
  }

  void _updatePersona(Event event) {
    var oldPersona =
        items.singleWhere((persona) => persona.id == event.snapshot.key);
    setState(() {
      // ignore: unnecessary_new
      items[items.indexOf(oldPersona)] =
          new Persona.fromSnapShot(event.snapshot);
    });
  }

  void infoPersona(BuildContext context, Persona persona) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenPersona(persona),
        ));
  }

  void _verPersona(BuildContext context, Persona persona) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoPersona(persona),
        ));
  }

  void _borrarPersona(
      BuildContext context, Persona persona, int position) async {
    await personaRef.child(persona.id).remove().then((_) => {
          setState(() {
            items.removeAt(position);
            Navigator.of(context).pop();
          }) //SI pongo el ; da error :c (puede que no lo necesite :D) ;;;;
        });
  }
}
