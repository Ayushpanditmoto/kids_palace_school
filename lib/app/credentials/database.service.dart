// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  //post data to database
  Future<void> postData(String table, Map<String, dynamic> data) async {
    try {
      await Supabase.instance.client
          .from(table)
          .insert(data)
          .then((value) => debugPrint(value.data.toString()));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //get data from database
  Future<List> getData(String table) async {
    try {
      final response =
          await Supabase.instance.client.from(table).select().then((value) {
        return value.data;
      });
      debugPrint(response);
      return response.data;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  //update data in database
  Future<void> updateData(
      String table, String id, Map<String, dynamic> data) async {
    try {
      await Supabase.instance.client
          .from(table)
          .update(data)
          .eq('id', id)
          .then((value) => debugPrint(value.data));
    } catch (e) {
      debugPrint(e.toString());
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

      debugPrint(response.data.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
