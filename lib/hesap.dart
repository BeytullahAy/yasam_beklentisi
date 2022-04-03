import 'package:yasam_beklentisi/user_data.dart';

// bu formül rastgele yazılmıştır.
class Hesap {
  UserData _userData;
  Hesap(this._userData);

  double hesaplama() {
    double sonuc;
    sonuc = 90 + _userData.sporSayisi - _userData.sigaraSayisi;
    sonuc = sonuc + (_userData.boy / _userData.kilo);

    return _userData.seciliCinsiyet == "Kadın" ? sonuc = sonuc + 5 : sonuc;
  }
}
