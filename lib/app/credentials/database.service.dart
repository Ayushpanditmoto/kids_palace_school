import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  //post data to database
  Future<void> postData(String table, Map<String, dynamic> data) async {
    try {
      final response = await Supabase.instance.client
          .from(table)
          .insert(data)
          .then((value) => print(value.data));
    } catch (e) {
      print(e);
    }
  }

  //get data from database
  Future<List> getData(String table) async {
    try {
      final response =
          await Supabase.instance.client.from(table).select().then((value) {
        return value.data;
      });
      print(response);
      return response.data;
    } catch (e) {
      print(e);
      return [];
    }
  }

  //update data in database
  Future<void> updateData(
      String table, String id, Map<String, dynamic> data) async {
    try {
      final response = await Supabase.instance.client
          .from(table)
          .update(data)
          .eq('id', id)
          .then((value) => print(value.data));
    } catch (e) {
      print(e);
    }
  }

  //delete data from database
  Future<void> deleteData(String table, String id) async {
    try {
      final response = await Supabase.instance.client
          .from(table)
          .delete()
          .eq('id', id)
          .execute();
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
