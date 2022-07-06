// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:pedigital/html.dart';
import 'package:pedigital/sql/animal.dart';
import 'package:pedigital/sql/db.dart';
import 'package:pedigital/sql/insertar.dart';

class Listado extends StatelessWidget {
  const Listado({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animales"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InsertPage()));
        },
      ),
      body: Lista()
    );
  }
}

class Lista extends StatefulWidget {
  const Lista({Key? key}) : super(key: key);
  @override
  _MiLista createState() => _MiLista();
}

class _MiLista extends State<Lista> {
  List<Animal> animales = [];
  @override
  void initState() {
    cargaAnimales();
    super.initState();
  }

  cargaAnimales() async {
    List<Animal> auxAnimal = await DB.animales();

    setState(() {
      animales = auxAnimal;
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: animales.length,
        itemBuilder:
            (context, i) =>
          Dismissible(key: Key(i.toString()),
              direction: DismissDirection.startToEnd,
              background: Container (
                color: Colors.red,
                padding: EdgeInsets.only(left: 5),
                  child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.delete, color: Colors.white)
              )
              ),
            onDismissed: (direction) {
              DB.delete(animales[i]);
            },
            child: ListTile(
              title: Text(animales[i].nombre),
              trailing: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AgreementPage()));
                },
                child: Icon(Icons.html)
              )
            )
          )
    );
  }

}