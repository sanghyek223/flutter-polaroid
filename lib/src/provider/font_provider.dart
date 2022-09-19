import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FontProvider with ChangeNotifier {
  final storage = new FlutterSecureStorage();

  double _fontSize = 19.0;
  String _fontFamily = 'CuteFont';
  var _fontColor = Colors.black;
  var _backgroudColor = Colors.white;
  var _polaroidTitle = '사진에 이름을 만들어주세요.';

  double get fontSize => _fontSize;
  String get fontFamily => _fontFamily;
  get fontColor => _fontColor;
  get backgroundtColor => _backgroudColor;
  get polaroidTitle => _polaroidTitle;

  selectIndexUpdate(double size) {
    _fontSize = size;
    notifyListeners();
  }

  selectFontFamilyUpdate(String font) async {
    await storage.write(key: "fontFamily", value: font);
    _fontFamily = font;
    notifyListeners();
  }

  selectFontColorUpdate(color) async {
    var fontColor = 'black';

    if (color == Colors.orange) {
      fontColor = "orange";
    }
    if (color == Colors.black) {
      fontColor = "black";
    }
    if (color == Colors.indigo) {
      fontColor = "indigo";
    }
    if (color == Colors.amber) {
      fontColor = "amber";
    }
    if (color == Colors.blue) {
      fontColor = "blue";
    }
    if (color == Colors.blueGrey) {
      fontColor = "blueGrey";
    }
    if (color == Colors.brown) {
      fontColor = "brown";
    }
    if (color == Colors.cyan) {
      fontColor = "cyan";
    }
    if (color == Colors.deepOrange) {
      fontColor = "deepOrange";
    }
    if (color == Colors.white) {
      fontColor = "white";
    }
    if (color == Colors.green) {
      fontColor = "green";
    }

    if (color == Colors.grey) {
      fontColor = "grey";
    }

    if (color == Colors.pink) {
      fontColor = "pink";
    }

    if (color == Colors.purple) {
      fontColor = "purple";
    }

    if (color == Colors.red) {
      fontColor = "red";
    }

    if (color == Colors.teal) {
      fontColor = "teal";
    }

    await storage.write(key: "fontColor", value: fontColor);

    _fontColor = color;
    notifyListeners();
  }

  selectBackgroundColorUpdate(color) async {
    var backColor = 'white';

    if (color == Colors.orange) {
      backColor = "orange";
    }
    if (color == Colors.black) {
      backColor = "black";
    }
    if (color == Colors.indigo) {
      backColor = "indigo";
    }
    if (color == Colors.amber) {
      backColor = "amber";
    }
    if (color == Colors.blue) {
      backColor = "blue";
    }
    if (color == Colors.blueGrey) {
      backColor = "blueGrey";
    }
    if (color == Colors.brown) {
      backColor = "brown";
    }
    if (color == Colors.cyan) {
      backColor = "cyan";
    }
    if (color == Colors.deepOrange) {
      backColor = "deepOrange";
    }
    if (color == Colors.white) {
      backColor = "white";
    }
    if (color == Colors.green) {
      backColor = "green";
    }

    if (color == Colors.grey) {
      backColor = "grey";
    }

    if (color == Colors.pink) {
      backColor = "pink";
    }

    if (color == Colors.purple) {
      backColor = "purple";
    }

    if (color == Colors.red) {
      backColor = "red";
    }

    if (color == Colors.teal) {
      backColor = "teal";
    }

    await storage.write(key: "backgroudColor", value: backColor);

    _backgroudColor = color;
    notifyListeners();
  }

  polaroidTitleUpdate(title) async {
    await storage.write(key: "polaroidTitle", value: title);
    _polaroidTitle = title;
    notifyListeners();
  }

  reset() async {
    await storage.deleteAll();

    _fontSize = 19.0;
    _fontFamily = 'CuteFont';
    _fontColor = Colors.black;
    _backgroudColor = Colors.white;
    _polaroidTitle = '사진에 이름을 만들어주세요.';

    notifyListeners();
  }
}
