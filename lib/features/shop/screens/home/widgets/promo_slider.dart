




import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });
  final List<String>banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            items: banners.map((url)=>TRoundedImage(imageurl: url)).toList(),
            options: CarouselOptions(
              viewportFraction: 1,

              onPageChanged: (index, _)=>controller.updatePageIndicator(index),
              autoPlay: true,
            )
        ),
        SizedBox(height: Sizes.spaceBtwItems,),
        Obx(
              ()=> Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for(int i =0;i<banners.length;i++)  CircularContainer(
                width: 20,
                height: 4,
                margin: EdgeInsets.only(right: 10),
                backgroundColor: controller.carousalCurrentIndex.value==i?AppColors.primary:Colors.grey,
              )
            ],
          ),
        )
      ],
    );
  }
}











// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:ecommerce_store/common/widgets/shimmers/shimmer.dart';
// import 'package:ecommerce_store/features/shop/controllers/banner_controller.dart';
// import 'package:ecommerce_store/utils/constants/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
// import '../../../../../common/widgets/images/rounded_image.dart';
// import '../../../../../utils/constants/sizes.dart';
//
// class PromoSlider extends StatelessWidget {
//   const PromoSlider({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(BannerController());
//     return Obx(
//       () {
//         if (controller.isLoading.value) return const CustomShimmerEffect(width: double.infinity, height: 190);
//
//         if (controller.banners.isEmpty) {
//           return const Center(child: Text('No Data Found!'));
//         } else {
//           return Column(
//             children: [
//               CarouselSlider(
//                 items: controller.banners
//                     .map(
//                       (banner) => RoundedImage(
//                         imageUrl: banner.imageUrl,
//                         isNetworkImage: true,
//                         onPressed: () => Get.toNamed(banner.targetScreen),
//                       ),
//                     )
//                     .toList(),
//                 options: CarouselOptions(
//                   viewportFraction: 1,
//                   onPageChanged: (index, _) => controller.updatePageIndicator(index),
//                 ),
//               ),
//               const SizedBox(height: Sizes.spaceBtwItems),
//               Center(
//                 child: Obx(
//                   () => Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       for (int i = 0; i < controller.banners.length; i++)
//                         CircularContainer(
//                           width: 20,
//                           height: 4,
//                           margin: const EdgeInsets.only(right: 10),
//                           backgroundColor: controller.carouselCurrentIndex.value == i ? AppColors.primary : AppColors.grey,
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }
