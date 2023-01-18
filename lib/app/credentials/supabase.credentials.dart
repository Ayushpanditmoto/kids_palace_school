import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseCred {
  static const String apiUrl = 'https://rrevxnlwzfmzreprtolr.supabase.co';
  static const String apiKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJyZXZ4bmx3emZtenJlcHJ0b2xyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTczNDcxNzcsImV4cCI6MTk3MjkyMzE3N30.-Ni8C9J-HwaN8LNXU0HiIsk5HoGUfkZvKjoBWviDszE";
  static SupabaseClient client = SupabaseClient(apiUrl, apiKey);
}
