import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/repo/repo_restaurant.dart';
import 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  final RestaurantRepository restaurantRepository;

  RestaurantCubit(this.restaurantRepository) : super(RestaurantInitial());

  Future<void> fetchRestaurants() async {
    emit(RestaurantLoading());
    try {
      final restaurants = await restaurantRepository.fetchRestaurants();
      emit(RestaurantLoaded(restaurants));
      print("done restaurants");
    } catch (e) {
      
      emit(RestaurantError(e.toString()));
    }
  }
}
