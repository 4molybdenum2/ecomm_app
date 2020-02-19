import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class cartDatabaseProvider {
  cartDatabaseProvider._();

  static final cartDatabaseProvider db = cartDatabaseProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }
//TODO:user kaa naam dalo .........as database..........
  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "cart.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE item ("
              "id TEXT primary key,"
              "name TEXT,"
              "type TEXT,"
              "mrp TEXT,"
              "storeprice TEXT,"
              "quantity TEXT"
              ")");
        });
  }

  additemToDatabase(Item item) async {
    final db = await database;
    var raw = await db.insert(
      "item",
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,

    );
    return raw;
  }

  updateitem(Item item) async {
    final db = await database;
    var response = await db.update("item", item.toMap(),
        where: "id = ?", whereArgs: [item.id]);
    return response;
  }

  Future<Item> getitemWithId(var id) async {
    final db = await database;
    var response = await db.query("item", where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? Item.fromMap(response.first) : null;
  }

  Future<List<Item>> getAllItem() async {
    final db = await database;
    var response = await db.query("item");
    List<Item> list = response.map((c) => Item.fromMap(c)).toList();
    return list;
  }

  deleteItemWithId(var id) async {
    final db = await database;
    return db.delete("item", where: "id = ?", whereArgs: [id]);
  }

  deleteAllPersons() async {
    final db = await database;
    db.delete("item");
  }
}

class Item {
  var id;
  var name;
  var type;
  var mrp;
  var storeprice;
  var quantity;
  Item({this.id, this.name, this.type,this.mrp,this.storeprice,this.quantity});

  factory Item.fromMap(Map<String, dynamic> json) => new Item(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    mrp: json["mrp"],
    storeprice: json["storeprice"],
    quantity:json["quantity"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "type": type,
    "mrp":mrp,
    "storeprice":storeprice,
    "quantity":quantity,
  };
}

