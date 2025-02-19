import 'package:ecommerce_store/features/shop/controllers/all_products_controller.dart';
import 'package:ecommerce_store/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/temporary_produc_controller_by_api_service.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  SortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;
  final TProductController productController = Get.put(TProductController());


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map(
                (option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: Sizes.spaceBtwSections),
        Obx(
          () => GridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) {
              //Product product = productController.productList[index];
              return ProductCardVertical(product: productController.products[index]);
            },
            //itemBuilder: (_, index) => ProductCardVertical(product: controller.products[index]),
          ),
        ),
      ],
    );
  }
}
