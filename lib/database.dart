import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

import 'body.dart';

class DatabaseHelper {

  static final _dbName = 'database.db';
  static final _dbVersion = 1;
  static final _tableName = 'Amount';
  static final columnID = 'id';
  static final columnName = 'name';
  static final columnDate = 'date';
  static final columnAmount = 'amount';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database!=null) {
      return _database ??= await _initializeDatabase();
    }
    return await _initializeDatabase();
  }
  _initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version){
     return db.execute(
          ''' 
      CREATE TABLE $_tableName (
      $columnID INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL, 
      $columnDate TEXT NOT NULL,
      $columnAmount TEXT NOT NULL )
      '''
      );
  }


   Future<int> insert(Map<String, dynamic> row) async{
      Database db = await instance.database;
      return await db.insert(_tableName, row);
   }

   Future<List<Map<String, dynamic>>> queryAll() async{
     Database db = await instance.database;
     return await db.query(_tableName);
   }

   Future update (Map<String, dynamic> row) async{
     Database db = await instance.database;
     int id = row[columnID];
     db.update(_tableName, row, where: '$columnID = ?', whereArgs: [1]);
   }
}
