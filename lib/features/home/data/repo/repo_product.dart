import 'package:supabase_flutter/supabase_flutter.dart';

class ProductRepository {
  final SupabaseClient _client;

  ProductRepository(this._client) {
    print("📦 ProductRepository CREATED");
  }

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    print("🔍 fetchProducts() CALLED");
    final response = await _client.from('products').select();
    print("✅ Supabase Response: $response");

    return response.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}
