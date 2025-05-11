import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:use_case/platform_channel/enums/icon_enums.dart';
import 'package:use_case/platform_channel/enums/image_enums.dart';
import 'package:use_case/platform_channel/models/battery_info.dart';
import 'package:use_case/platform_channel/viewmodels/battery_viewmodel.dart';
import 'package:use_case/utilty/google_ads.dart';

part 'widget/_battery_state_widget.dart';
part 'widget/_platform_card.dart';
class BatteryView extends GetView<BatteryViewmodel> {
  const BatteryView({super.key});

  
  @override
  Widget build(BuildContext context) {
        final googleAdsController = Get.put(GoogleAdsController());
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Battery Channel/Library"),),
      body: Column(
        children: [
          _batteryView(),
          _platformCardRow(),
          Obx(() {
              return googleAdsController.isAdLoaded.value
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: SafeArea(
                        child: SizedBox(
                          width: googleAdsController.bannerAd!.size.width.toDouble(),
                          height: googleAdsController.bannerAd!.size.height.toDouble(),
                          child: AdWidget(ad: googleAdsController.bannerAd!),
                        ),
                      ),
                    )
                  : SizedBox(); // Reklam yüklenmediği durumda boş bir alan
            }),

          
        ],
      ),
    ));
  }

  _batteryView()
  {
    return Expanded(
      flex:2,
      child: _BatteryStateWidget()
  );
  }

  _platformCardRow()
  {
    return Expanded(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: _PlatformCard(title: "NATIVE", callback: controller.fetchFromNative,)),
          SizedBox(width: 20,),
          Expanded(child: _PlatformCard(title: "PACKAGE", callback: controller.fetchFromPackage,))
        ],
      ),
    ));
  }
}