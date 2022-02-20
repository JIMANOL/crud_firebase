import 'package:firebase_database/firebase_database.dart';

class Persona {
  String id = '';
  String nombre = '';
  String apellido = '';
  String edad = '';
  String tel = '';
  String dir = '';
  String email = '';

  Persona(this.id, this.nombre, this.apellido, this.edad, this.tel, this.dir,
      this.email);

  Persona.map(dynamic obj) {
    //El id se generará automaticamente
    this.nombre = obj['nombre'];
    this.apellido = obj['apellido'];
    this.edad = obj['edad'];
    this.tel = obj['tel'];
    this.dir = obj['dir'];
    this.email = obj['email'];
  }

  String get getID => id;
  String get getNombre => nombre;
  String get getApellido => apellido;
  String get getEdad => edad;
  String get getTel => tel;
  String get getDir => dir;
  String get getEmail => email;

  Persona.fromSnapShot(DataSnapshot snapshot) {
    id = snapshot.key;
    nombre = snapshot.value['nombre'];
    apellido = snapshot.value['apellido'];
    edad = snapshot.value['edad'];
    tel = snapshot.value['tel'];
    dir = snapshot.value['dir'];
    email = snapshot.value['email'];
  }
}
