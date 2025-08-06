import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/repo/repo_product.dart';
import 'package:food/features/home/logic/products_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository; 

  ProductCubit(this.productRepository) : super(ProductInitial());


  Future<void> fetchProducts() async {
    emit((ProductLoading()));
    try {
      final product = await productRepository.fetchProducts();
      emit(ProductLoaded(product));
      print("done products");
    } catch (e) {
      
      emit(ProductError(e.toString()));
    }
  }
}
