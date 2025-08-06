import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/helpers/contants.dart';
import 'package:food/core/helpers/shared_pref_helper.dart';
import 'package:food/features/home/data/model/category_model.dart';
import 'package:food/features/home/data/model/restaurant_model.dart';
import 'package:food/features/home/logic/products_cubit.dart';
import 'package:food/features/home/logic/products_state.dart';
import 'package:food/features/home/logic/restaurant_cubit.dart';
import 'package:food/features/home/logic/restaurant_state.dart';
import 'package:food/features/home/ui/widgets/category_section.dart';
import 'package:food/features/home/ui/widgets/greeting_headers.dart';
import 'package:food/features/home/ui/widgets/home_appbar.dart';
import 'package:food/features/home/ui/widgets/open_restaurant.dart';
import 'package:food/features/home/ui/widgets/restaurant_card.dart';
import 'package:food/features/home/ui/widgets/search_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = '';

  @override
  void initState() {
    super.initState();
    loadUsername();
    context.read<RestaurantCubit>().fetchRestaurants();
    context
        .read<ProductCubit>()
        .fetchProducts(); // Fetch products when the screen is initialized
  }

  Future<void> loadUsername() async {
    try {
      final name =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.userName);
      if (mounted) {
        setState(() {
          userName = name.isNotEmpty ? name : 'Guest';
        });
      }
    } catch (e) {
      print('Error loading username: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFDFCFD),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            HomeAppBar(userName: userName),
            GreetingHeader(userName: userName),
            const SearchHeader(),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return SliverToBoxAdapter(
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 100.h),
                      child: const CircularProgressIndicator(),
                    )),
                  );
                } else if (state is ProductLoaded) {
                  return CategoriesSection(
                    products: state.products
                        .map((e) => ProductModel.fromJson(e))
                        .toList(),
                  );
                } else if (state is ProductError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text("Error: ${state.message}")),
                  );
                } else {
                  return SliverToBoxAdapter(child: SizedBox.shrink());
                }
              },
            ),
            const OpenRestaurantsHeader(),
            BlocBuilder<RestaurantCubit, RestaurantState>(
              builder: (context, state) {
                if (state is RestaurantLoading) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  );
                } else if (state is RestaurantLoaded) {
                  final restaurants = state.restaurants;

                  return SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => RestaurantCard(
                          restaurant: RestaurantModel.fromJson(
                            restaurants[index],
                          ),
                        ),
                        childCount: restaurants.length,
                      ),
                    ),
                  );
                } else if (state is RestaurantError) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Text(
                          'Error: ${state.message}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  StickyHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(StickyHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
