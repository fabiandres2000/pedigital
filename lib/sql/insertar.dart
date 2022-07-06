// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:pedigital/sql/animal.dart';
import 'package:pedigital/sql/db.dart';
import 'package:pedigital/sql/listado.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key}) : super(key: key);
  @override
  State<InsertPage> createState() => _LInsertPageState();
}

class _LInsertPageState extends State<InsertPage> {
  TextEditingController id =  TextEditingController();
  TextEditingController nombre =  TextEditingController();
  TextEditingController especie =  TextEditingController();

  BoxDecoration decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 5,
        offset:
            Offset(0, 3),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar : false,
      appBar: AppBar(
         elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(    
          child: Text(
            "Registro",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
        )
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 40,
                    decoration: decoration,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: id,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Identificación'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 40,
                    decoration: decoration,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: nombre,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Nombre'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 40,
                    decoration: decoration,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: especie,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Especie'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10
                  ),
                  child: Container(
                    width: double.infinity,
                    child: MaterialButton(
                      color:  Colors.blueAccent ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        //side: BorderSide(color: Colors.red)
                      ),
                      onPressed: () {
                        save();
                      },
                      child: Text(
                        "Guardar",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      height: 30,
                    ),
                  ),
                ),
              ]
            )
          ]
        ),
      ),
    );
  }

  save() async {
   await DB.insertar2(Animal(id: int.parse(id.text), nombre: nombre.text, especie: especie.text));
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Listado()));
  }
}