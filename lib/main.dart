import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/contants.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/routing/app_router.dart';
import 'food_app.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
   await Supabase.initialize(
    url: 'https://fvrbhjosbdiyuqavklyn.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2cmJoam9zYmRpeXVxYXZrbHluIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM3MTQyMjIsImV4cCI6MjA2OTI5MDIyMn0.UJiBKgc4tot7E7fmbnrGbA51cw0D3QQWTReElMNHAos',
  );

  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(FoodApp(
    appRouter: AppRouter(),
  ));
}


Future<void> checkIfLoggedInUser() async {
  try {
    String? userToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

    isLoggedInUser = userToken != null && userToken.isNotEmpty;

    if (isLoggedInUser) {
      print('User is logged in (Token exists)');
    } else {
      print('User is not logged in (No token found)');

    }
  } catch (e) {
    isLoggedInUser = false;
    print('Error checking login status: $e');

  }
}