part of '../battery_view.dart';

class _BatteryStateWidget extends GetView<BatteryViewmodel> {
  const _BatteryStateWidget();

  @override
  Widget build(BuildContext context) {
    return  body();
  }

  body()
  {
    return Obx((){
                final info = controller.batteryInfo.value;
                

                return 
                Card( 
                  elevation: 20,
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(child: ImageEnums.battery.imageWidget),
                      Expanded(child: _info(info)),
                    ],
                  ),
                );
              });
  }
  _info(BatteryInfo? info)
  {
    if(info == null)
    {
      return Text("Batarya Verisi\n NATIVE / PACKAGE");
    }
    else
    {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _row(icon: IconEnums.charge.icon, value: "${info.level}%"),
          _row(icon: IconEnums.power.icon, value: info.isCharging ? 'Şarj oluyor' : 'Şarj olmuyor'),
          _row(icon: IconEnums.timer.icon, value: "${info.elapsedMs} ms"),
          _row(icon: IconEnums.code.icon, value: "${controller.status}"),
        ],
      );
    }
  }

  _row({required IconData icon, required String value})
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Row(
        children: [
          Expanded(child: Icon(icon)),
          Expanded(
            flex: 3,
            child: Text(value))
        ],
      ),
    );
  }
}