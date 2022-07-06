
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:pedigital/sql/animal.dart';
import 'package:sqflite/sqflite.dart';

class DB {

  static Future<Database> _openDB() async {

    return openDatabase(join(await getDatabasesPath(),'animales.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE animales (id INTEGER PRIMARY KEY, nombre TEXT, especie TEXT)",
        );
      }, version: 1);
  }

  static Future<int> insert(Animal animal) async {
    Database database = await _openDB();

    return database.insert("animales", animal.toMap());
  }

  static Future<int> delete(Animal animal) async {
    Database database = await _openDB();

    return database.delete("animales", where: "id = ?", whereArgs: [animal.id]);
  }

  static Future<int> update(Animal animal) async {
    Database database = await _openDB();

    return database.update("animales", animal.toMap(), where: "id = ?", whereArgs: [animal.id]);
  }

  static Future<List<Animal>> animales() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> animalesMap = await database.query("animales");

    return List.generate(animalesMap.length,
            (i) => Animal(
              id: animalesMap[i]['id'],
              nombre: animalesMap[i]['nombre'],
              especie: animalesMap[i]['especie']
            ));
  }

  // CON SENTENCIAS
  static Future<void> insertar2(Animal animal) async {
    Database database = await _openDB();
    await database.rawInsert("INSERT INTO animales (id, nombre, especie) VALUES (${animal.id}, '${animal.nombre}', '${animal.especie}')");
  }
}