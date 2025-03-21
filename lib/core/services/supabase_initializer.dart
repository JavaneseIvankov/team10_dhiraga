import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:team10_dhiraga/core/services/supabase_options.dart';

class SupabaseInitializer {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: SupabaseOptions.url,
      anonKey: SupabaseOptions.anonKey,
    );
  }
}
