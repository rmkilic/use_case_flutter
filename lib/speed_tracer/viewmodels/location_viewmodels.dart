import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationViewModel extends GetxController {
  RxDouble speed = 0.0.obs;
  RxDouble highestSpeed = 0.0.obs;  // En yüksek hız
  RxDouble totalDistance = 0.0.obs; // Toplam mesafe
  RxDouble totalTime = 0.0.obs; // Toplam süre (saniye cinsinden)
  RxBool isTracking = false.obs; // Hız ölçümü başlatma durumu
  RxDouble averageSpeed = 0.0.obs; // Ortalama hız
  RxBool showCurrentSpeed = true.obs;

  // Hız bilgilerini tutan bir liste
  List<double> speeds = [];

  // Başlatma ve durdurma butonunu kontrol etme
  Future<void> startTracking()async {
    bool _locationPermission = await _permission();
    if(_locationPermission)
    {
      isTracking.value = true;
      showCurrentSpeed.value = true;
      speeds.clear(); // Önceki verileri temizle
      totalDistance.value = 0.0;
      totalTime.value = 0.0;
      highestSpeed.value = 0.0;
      averageSpeed.value = 0.0;
      _startListeningLocation();
    }

  }

  Future<bool> _permission()async
  {
        bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
        return false;
      }
    }
    return true;
  }

  void stopTracking() {
    isTracking.value = false;
    showCurrentSpeed.value = false;

    _calculateAverageSpeed();
  }

  void _startListeningLocation() async {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 5, // her 5 metre değişimde
      ),
    ).listen((Position position) {
      if (isTracking.value) {
        // Hız verisini kaydet
        speed.value = position.speed * 3.6;  // m/s -> km/h
        if (speed.value > highestSpeed.value) {
          highestSpeed.value = speed.value;
        }
        speeds.add(speed.value);
        
        // Mesafe ve zaman hesaplamaları
        if (speeds.length > 1) {
          double distance = Geolocator.distanceBetween(
            position.latitude, position.longitude,
            position.latitude, position.longitude
          );
          totalDistance.value += distance;
        }

        // Zaman hesaplama (saniye cinsinden)
        totalTime.value += 1; // Burada zaman her saniye güncelleniyor
      }
    });
  }

  // Ortalama hızı hesapla
  void _calculateAverageSpeed() {
    if (speeds.isNotEmpty) {
      double sum = speeds.reduce((a, b) => a + b);
      averageSpeed.value = sum / speeds.length;
    }
  }
}
