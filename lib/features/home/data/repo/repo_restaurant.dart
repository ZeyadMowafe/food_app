import 'package:supabase_flutter/supabase_flutter.dart';

class RestaurantRepository {
  final SupabaseClient _client;

  RestaurantRepository(this._client);

  Future<List<Map<String, dynamic>>> fetchRestaurants() async {
    final response = await _client.from('restaurants').select();

    print('✅ Fetched restaurants: $response');


    return List<Map<String, dynamic>>.from(response) ;

  }
}





