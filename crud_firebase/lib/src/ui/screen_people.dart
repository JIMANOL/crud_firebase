// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:crud_firebase/src/model/people.dart';

class ScreenPersona extends StatefulWidget {
  final Persona persona;

  ScreenPersona(this.persona);

  @override
  _ScreenPersonaState createState() => _ScreenPersonaState();
}

final personaRef = FirebaseDatabase.instance.reference().child('persona');

class _ScreenPersonaState extends State<ScreenPersona> {
  //List<Persona> items; //Error por no inicializar :c
  late List<Persona> items;
  //Error por no inicializar :c --> se agregó "late"
  late TextEditingController nombreController;
  late TextEditingController apellidoController;
  late TextEditingController edadController;
  late TextEditingController telController;
  late TextEditingController dirController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    //items = new List(); // --> Marcó error
    items = List.empty();
    nombreController = new TextEditingController(text: widget.persona.nombre);
    apellidoController =
        new TextEditingController(text: widget.persona.apellido);
    edadController = new TextEditingController(text: widget.persona.edad);
    telController = new TextEditingController(text: widget.persona.tel);
    dirController = new TextEditingController(text: widget.persona.dir);
    emailController = new TextEditingController(text: widget.persona.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personas DB'),
        backgroundColor: Colors.green[100],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                ///////////////////////////////////////TextField->NOMBRE///////////////////////////////////////////////////
                TextField(
                  controller: nombreController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Nombre'),
                  keyboardType: TextInputType.text,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                ///////////////////////////////////////TextField->APELLIDO///////////////////////////////////////////////////
                TextField(
                  controller: apellidoController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Apellido'),
                  keyboardType: TextInputType.text,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                ///////////////////////////////////////TextField->EDAD///////////////////////////////////////////////////
                TextField(
                  controller: edadController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), labelText: 'Edad'),
                  keyboardType: TextInputType.number,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                ///////////////////////////////////////TextField->TELEFONO///////////////////////////////////////////////////
                TextField(
                  controller: telController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.phone), labelText: 'Teléfono'),
                  keyboardType: TextInputType.phone,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                ///////////////////////////////////////TextField->DIRECCION///////////////////////////////////////////////////
                TextField(
                  controller: dirController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.map), labelText: 'Direccion'),
                  //keyboardType: TextInputType.text,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                ///////////////////////////////////////TextField->EMAIL///////////////////////////////////////////////////
                TextField(
                  controller: emailController,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  decoration: InputDecoration(
                      icon: Icon(Icons.email), labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                ///////////////////////////////////////BOTÓN///////////////////////////////////////////////////
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: () {
                      if (widget.persona.id != null) {
                        personaRef.child(widget.persona.id).set({
                          'nombre': nombreController.text,
                          'apellido': apellidoController.text,
                          'edad': edadController.text,
                          'tel': telController.text,
                          'dir': dirController.text,
                          'email': emailController.text
                        }).then((_) => {Navigator.pop(context)});
                      } else {
                        personaRef.push().set({
                          'nombre': nombreController.text,
                          'apellido': apellidoController.text,
                          'edad': edadController.text,
                          'tel': telController.text,
                          'dir': dirController.text,
                          'email': emailController.text
                        }).then((_) => {Navigator.pop(context)});
                      }
                    },
                    child: (widget.persona.id != null)
                        ? Text('Update')
                        : Text('Add'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
