import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../components/custom_image_component.dart';
import '../../../utils/color_manager.dart';
import '../../../utils/string_manager.dart';
import '../../../utils/text_style_manager.dart';
import '../controller/gallery_controller.dart';

class GalleryView extends GetView<GalleryController> {
  GalleryView({super.key});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100) {
        controller.fetchImages();
      }
    });

    return Scaffold(
      backgroundColor: ColorManager.primaryAppColor1,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryAppColor1,
        title: Text(
          StringManager.headingText,
          style: TextStyleManager.headingTextStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: 15.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                StringManager.galleryText,
                style: TextStyleManager.playerStatTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: Obx(() {
                if (controller.images.isEmpty && controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: ColorManager.primaryAppColor2,
                    ),
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        controller: scrollController,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: controller.images.length,
                        itemBuilder: (context, index) {
                          final image = controller.images[index];
                          return InkWell(
                            onTap: () {
                              // Handle image tap
                            },
                            child: CustomImageItem(
                              imageUrl: image.downloadUrl,
                            ),
                          );
                        },
                      ),
                    ),
                    if (controller.isLoading.value) LoadingSection()
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
