import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/routing/routers.dart';
import 'package:food/features/details_category/ui/details_category_screen.dart';
import 'package:food/features/home/logic/products_cubit.dart';
import 'package:food/features/home/logic/restaurant_cubit.dart';
import 'package:food/features/home/ui/home_screen.dart';

import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/sign_up/logic/sign_up_cubit.dart';
import '../../features/sign_up/ui/sign_up_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.detailsCategoryScreen:
  final category = settings.arguments as String;
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (context) => getIt<ProductCubit>()..fetchProducts(),
      child: DetailsCategoryScreen(
        category: category,
      ),
    ),
  );
        
      case Routes.homeScreen:
  return MaterialPageRoute(
    builder: (_) => MultiBlocProvider(
      providers: [
        
        BlocProvider(
          create: (context) => getIt<ProductCubit>()..fetchProducts(),
        ),
        BlocProvider(
          create: (context) => getIt<RestaurantCubit>()..fetchRestaurants(),
        ),
      ],
      child: const HomeScreen(),
    ),
  );
  

      default:
        return null;
    }
  }
}
