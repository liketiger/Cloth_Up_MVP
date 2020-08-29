import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/product.dart';
import 'package:flutter_shop/providers/product_provider.dart';
import 'package:flutter_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  const ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
    );
  }
}
