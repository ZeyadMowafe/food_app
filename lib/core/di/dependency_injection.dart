import 'package:dio/dio.dart';
import 'package:food/core/networking/api_service.dart';
import 'package:food/features/home/data/repo/repo_restaurant.dart';
import 'package:food/features/home/data/repo/repo_product.dart';
import 'package:food/features/home/logic/products_cubit.dart';
import 'package:food/features/home/logic/restaurant_cubit.dart';
import 'package:food/features/login/data/repo/login_repo.dart';
import 'package:food/features/login/logic/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/sign_up/data/repo/sign_up_repo.dart';
import '../../features/sign_up/logic/sign_up_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {

  
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
// login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  getIt.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepository(Supabase.instance.client),
  );
  getIt.registerFactory<RestaurantCubit>(
    () => RestaurantCubit(getIt()),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepository(Supabase.instance.client),
  );
  getIt.registerFactory<ProductCubit>(
    () => ProductCubit(getIt()),
  );
}
