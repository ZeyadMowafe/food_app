import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/logic/products_cubit.dart';
import 'package:food/features/home/logic/products_state.dart';

class DetailsCategoryScreen extends StatelessWidget {
  final String category;

  const DetailsCategoryScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          final products = state.products
              .where((product) => product.category == category) 
              .toList();

          return Scaffold(
            appBar: AppBar(title: Text(category)),
            body: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(product.image),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                );
              },
            ),
          );
        } else {
          return const Center(child: Text("Error loading products"));
        }
      },
    );
  }
}
