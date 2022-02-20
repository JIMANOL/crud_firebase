// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_firebase/src/model/people.dart';

class InfoPersona extends StatefulWidget {
  final Persona persona;
  InfoPersona(this.persona);

  _InfoPersonaState createState() => _InfoPersonaState();
}

class _InfoPersonaState extends State<InfoPersona> {
  // List<Persona> items; //Error por no inicializar :c
  late List<Persona> items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Información'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                // ignore: unnecessary_new
                new Text(
                  "Nombre: ${widget.persona.nombre}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                ////////////////////////////////////////////////////////////////////
                // ignore: unnecessary_new
                new Text(
                  "Apellido: ${widget.persona.apellido}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                ////////////////////////////////////////////////////////////////////
                // ignore: unnecessary_new
                new Text(
                  "Edad: ${widget.persona.edad}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                ////////////////////////////////////////////////////////////////////
                // ignore: unnecessary_new
                new Text(
                  "Teléfono: ${widget.persona.tel}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                ////////////////////////////////////////////////////////////////////
                // ignore: unnecessary_new
                new Text(
                  "Dirección: ${widget.persona.dir}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                ////////////////////////////////////////////////////////////////////
                // ignore: unnecessary_new
                new Text(
                  "Email: ${widget.persona.email}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
