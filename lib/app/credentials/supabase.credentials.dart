import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCredentials {
  static const String url = 'https://rrevxnlwzfmzreprtolr.supabase.co';
  static const String apikey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJyZXZ4bmx3emZtenJlcHJ0b2xyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTczNDcxNzcsImV4cCI6MTk3MjkyMzE3N30.-Ni8C9J-HwaN8LNXU0HiIsk5HoGUfkZvKjoBWviDszE";

  static SupabaseClient client = SupabaseClient(url, apikey);
}
