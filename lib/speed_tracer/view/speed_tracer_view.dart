import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:use_case/speed_tracer/view/widget/speedometer.dart';
import 'package:use_case/speed_tracer/viewmodels/location_viewmodels.dart';

part 'widget/_current_speed.dart';
part 'widget/_power_button.dart';

class SpeedTracerView extends StatelessWidget {
  final LocationViewModel viewModel = Get.put(LocationViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Speed Tracer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hız göstergesi
           _speedWidget(),
            SizedBox(height: 20),
            _PowerButton(viewModel: viewModel,)
            
          ],
        ),
      ),
    );
  }

  _speedWidget()
  {
    return 
            Obx((){
              if(viewModel.showCurrentSpeed.value) 
              {
                return Expanded(child: _CurrentSpeed(viewModel: viewModel));
              }
              else
              {
                return  Expanded(child: SpeedometerWidget(highestSpeed: viewModel.highestSpeed.value, averageSpeed: viewModel.averageSpeed.value ,));

              }
            }
               );
  } 

  
}
