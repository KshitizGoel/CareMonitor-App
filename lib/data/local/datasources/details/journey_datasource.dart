import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/models/flight_history/history.dart';
import 'package:boilerplate/models/flight_history/history_list.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/models/post/post_list.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

@Singleton()
class JourneyDatasource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _journeyStore =
  stringMapStoreFactory.store(DBConstants.STORE_NAME_JOURNEY);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
//  Future<Database> get _db async => await AppDatabase.instance.database;

  // database instance
  final Database _db;

  // Constructor
  JourneyDatasource(this._db);


  // DB functions:--------------------------------------------------------------
  Future insert(History history) async {

    return await _journeyStore.add(_db , history.toMap());
  }

  Future<int> count() async {
    return await _journeyStore.count(await _db);
  }

  Future<dynamic> getHistoryFromDb() async {
    print('Loading from database');

    // post list
    var postsList;

    // fetching data
    final recordSnapshots = await _journeyStore.find(
      await _db,
    );

    // Making a List<Post> out of List<RecordSnapshot>
    if (recordSnapshots.length > 0) {
      postsList = recordSnapshots.map((snapshot) {
        final post = snapshot.value;
        // An ID is a key of a record from the database.
        // post.id = snapshot.key;
        return post;
      }).toList();
    }

    return postsList;
  }
}
