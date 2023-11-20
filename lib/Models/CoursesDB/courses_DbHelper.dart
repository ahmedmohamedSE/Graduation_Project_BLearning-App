import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import './course_properties.dart';
import 'lecture_prop.dart';
/*
class DBHelper {
  static Database? _db;
  static const int? colID = 0;
  static const int? hours = 0;
  static String? courseName, subtitle, description, image;
  static const String courses_TABLE = 'myCourses';
  static const String lectures_TABLE = 'myLectures';
  static const String DB_NAME = 'courses.db';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initCourseDb();
    return _db;
  }

  initCourseDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String dBpath = join(documentsDirectory.path, DB_NAME);
    Database myDB = await openDatabase(dBpath, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $courses_TABLE (
        $colID INTEGER PRIMARY KEY AUTOINCREMENT,
        $hours INTEGER NOT NULL,
        $courseName TEXT NOT NULL,
        $subtitle TEXT NOT NULL,
        $description TEXT NOT NULL,
        $image TEXT NOT NULL
        )''');

    // Create the lectures table
    await db.execute('''
        CREATE TABLE $lectures_TABLE(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          subtitle TEXT NOT NULL,
          content TEXT NOT NULL,
          course_id INTEGER NOT NULL,
          FOREIGN KEY(course_id) REFERENCES $courses_TABLE($colID)
        )
      ''');
    
  }
  
  // Future<void> insertCourses(Database db) async {
  //   await db.insert(
  //       '$courses_TABLE',
  //       Course_attributes(
  //         id: 1,
  //         title: 'Course 1',
  //         subtitle: 'Subtitle 1',
  //         image: 'image1.jpg',
  //       ).toMap());

  //   await db.insert(
  //       'courses',
  //       Course(
  //         id: 2,
  //         title: 'Course 2',
  //         subtitle: 'Subtitle 2',
  //         image: 'image2.jpg',
  //       ).toMap());

  // }

  // Future<Course_attributes> insertCourses(Course_attributes course) async {
    
  //   var dbClient = await _db;
  //   await dbClient!.insert(courses_TABLE, Course_attributes(
  //     id:1,
  //     hours:20,
  //     courseName:"C#",


  //   ).toMap());

  //   return await course;
  // }

  // Future<int> insertCourse(Map<String, dynamic> course) async {
  //   Database? dbClient = await db;
  //   return await dbClient!.insert(TABLE, course);
  // }

  //Read or Select data
  Future<List<Map<String, dynamic>>> getCourses(String sql) async {
    Database? myDB = await _db;
    List<Map> response = await myDB!.rawQuery(sql);

    return await myDB.query(courses_TABLE);
  }
  
  static Future<List<Map<String, dynamic>>> getCourses() async {
    final db = await database;
    return await db.query('courses');
  }

  static Future<List<Map<String, dynamic>>> getLectures(int courseId) async {
    final db = await database;
    return await db.query('lectures', where: 'course_id = ?', whereArgs: [courseId]);
  }
}

  //insert data
  //
  //update data
  updateCourses(String sql) async {
    Database? myDB = await _db;
    int response = await myDB!.rawUpdate(sql);

    return response;
  }

  //delete data
  deleteCourses(String sql) async {
    Database? myDB = await _db;
    int response = await myDB!.rawDelete(sql);

    return response;
  }
}
*/

class DatabaseHelper {
  static Database? _db;
  static const int? colID = 0;
  static const int? hours = 0;
  static String? courseName, subtitle, description, image;
  static const String courses_TABLE = 'myCourses';
  static const String lectures_TABLE = 'myLectures';
  static const String DB_NAME = 'courses.db';

  static Future<Database?> get database async {
    if (_db != null) {
      return _db;
    }
    _db = await _initDatabase();
    return _db;
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $courses_TABLE (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            subtitle TEXT NOT NULL,
            image TEXT
          );
        ''');
        await db.execute('''
          CREATE TABLE $lectures_TABLE (
            id INTEGER PRIMARY KEY,
            course_id INTEGER,
            title TEXT,
            content TEXT,
            FOREIGN KEY (course_id) REFERENCES $courseName(id)
          );
        ''');
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getCourses() async {
    final db = await database;
    return await db!.query('courses');
  }

  static Future<List<Map<String, dynamic>>> getLectures(int courseId) async {
    final db = await database;
    return await db!.query('lectures', where: 'course_id = ?', whereArgs: [courseId]);
  }
}
