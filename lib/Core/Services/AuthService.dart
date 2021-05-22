
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/DualFuelBusinessCredential.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Core/Model/Api/DualFuel-InsertAddProspect/ElectricityCredential.dart';
import 'package:pozitive/Util/dualFuel_Pref.dart';

class AutService{

  Stream<User>get user{
    return Stream.fromFuture(Prefs.getUser());
  }
  Stream<DualFuelELECTRICITYCredential>get dualFuel{
    return Stream.fromFuture(DFPref.getDualFuelEleValues());
  }
  Stream<DualFuelBusinessCredential>get businessType{
    return Stream.fromFuture(DFPref.getDualFuelBusinessDetailsValues());
  }
}

