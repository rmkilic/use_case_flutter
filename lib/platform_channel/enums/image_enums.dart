
import 'package:flutter/material.dart';

enum ImageEnums
{
  battery,
  
}

extension ImageExtension on ImageEnums{

  String get imageName
  {
    switch(this)
    {      
      case ImageEnums.battery:
        return 'ic_battery';    
    }
  }

  String get toPath => 'assets/icons/$imageName.png';

  Widget get imageWidget => Image.asset(toPath);

}