import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

part '_custom_card.dart';
class SpeedometerWidget extends StatefulWidget {
  final double highestSpeed;
  final double averageSpeed;
  const SpeedometerWidget({super.key, required this.highestSpeed, required this.averageSpeed});

  @override
  State<SpeedometerWidget> createState() => _SpeedometerWidgetState();
}

class _SpeedometerWidgetState extends State<SpeedometerWidget> with SingleTickerProviderStateMixin{
 // AnimationController ile animasyon oluşturuyoruz
  late AnimationController _controller;
  late Animation<double> _animation;

  // Başlangıç ve bitiş hızları
  double startSpeed = 0.0;

  @override
  void initState() {
    super.initState();

    // AnimationController oluşturuyoruz
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // 2 saniyelik animasyon süresi
    );

    // Hız animasyonu
    _animation = Tween<double>(begin: startSpeed, end: widget.highestSpeed).animate(_controller);

    // Animasyonu başlatıyoruz
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    Color _getPointerColor(double currentValue) {
    double segment = widget.highestSpeed / 4;
    
    if (currentValue <= segment) {

      return Colors.green;  // Sarı
    } else if (currentValue <= 2 * segment) {
      return Colors.yellow;  // Turuncu
    }  else if (currentValue <= 3 * segment) {
      return Colors.orange;  // Turuncu
    }
    else {
      return Colors.red;  // Kırmızı
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(child: _CustomCard(title: "En Yüksek Hız", value:widget.highestSpeed, type: "km/h")),
                  Expanded(child: _CustomCard(title: "Ortalama Hız", value: widget.averageSpeed, type: "km/h",)),
                ],
              ),
            ),
            Expanded(child: _animation2())
          ],
        ),
      ),
    );
  }

  _animation2()
  {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context,child) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double currentValue = _animation.value;
            Color pointerColor = _getPointerColor(currentValue);

            return SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: widget.highestSpeed +.1,
                  interval: widget.highestSpeed / 10,
                  pointers: <GaugePointer>[
                    NeedlePointer(value: currentValue, needleColor: pointerColor),
                  ],
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: currentValue,
                      color:  _getPointerColor(currentValue),
                      startWidth: 5,
                      endWidth: 15,
                    ),
                  
                    
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Text(
                        "${currentValue.toStringAsFixed(0)} km/h",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      angle: 90,
                      positionFactor: 0.5,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }
    );
  }
}
