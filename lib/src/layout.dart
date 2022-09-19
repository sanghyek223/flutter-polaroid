import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polaroid/src/provider/font_provider.dart';
import 'package:polaroid/src/provider/navigation_provider.dart';
import 'package:polaroid/src/utils/ToastMsg.dart';
import 'package:polaroid/src/widget/ShowDialogWidget.dart';
import 'package:polaroid/src/widget/capture_widget.dart';
import 'package:provider/provider.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  late NavigationProvider _navigationProvider;
  late FontProvider _fontProvider;

  final storage = new FlutterSecureStorage();

  List imageDefaultList = [
    'cafe-3537801_1920.jpg',
    'camera-1130731_1920.jpg',
    'hamburg-3846525_1920.jpg',
    'italy-4093227_1920.jpg',
    'people-2568954_1920.jpg',
    'town-828614_1920.jpg',
  ];

  var _defaultIamge;
  var _image;

  @override
  void initState() {
    // TODO: implement initState
    _defaultIamge = (imageDefaultList..shuffle()).first;

    permissionCheck();
    sotrageCheck();
  }

  void permissionCheck() async {
    var cameraStatus = await Permission.camera.status;

    if (!cameraStatus.isGranted) {
      await Permission.storage.request();
    }

    cameraStatus = await Permission.storage.status;
  }

  void sotrageCheck() async {
    var _fontColor;
    var _backColor;

    var font = await storage.read(key: "fontFamily");
    var fontColor = await storage.read(key: "fontColor");
    var backColor = await storage.read(key: "backgroudColor");
    var title = await storage.read(key: "polaroidTitle");

    font == null ? null : _fontProvider.selectFontFamilyUpdate(font);
    title == null ? null : _fontProvider.polaroidTitleUpdate(title);

    switch (fontColor) {
      case 'orange':
        _fontColor = Colors.orange;
        break;

      case 'black':
        _fontColor = Colors.black;
        break;

      case 'indigo':
        _fontColor = Colors.indigo;
        break;

      case 'amber':
        _fontColor = Colors.amber;
        break;

      case 'blue':
        _fontColor = Colors.blue;
        break;

      case 'blueGrey':
        _fontColor = Colors.blueGrey;
        break;

      case 'brown':
        _fontColor = Colors.brown;
        break;

      case 'cyan':
        _fontColor = Colors.cyan;
        break;

      case 'deepOrange':
        _fontColor = Colors.deepOrange;
        break;

      case 'white':
        _fontColor = Colors.white;
        break;

      case 'green':
        _fontColor = Colors.green;
        break;

      case 'grey':
        _fontColor = Colors.grey;
        break;

      case 'pink':
        _fontColor = Colors.pink;
        break;

      case 'purple':
        _fontColor = Colors.purple;
        break;

      case 'red':
        _fontColor = Colors.red;
        break;

      case 'teal':
        _fontColor = Colors.teal;
        break;

      default:
        _fontColor = Colors.black;
    }

    switch (backColor) {
      case 'orange':
        _backColor = Colors.orange;
        break;

      case 'black':
        _backColor = Colors.black;
        break;

      case 'indigo':
        _backColor = Colors.indigo;
        break;

      case 'blue':
        _backColor = Colors.blue;
        break;

      case 'blueGrey':
        _backColor = Colors.blueGrey;
        break;

      case 'brown':
        _backColor = Colors.brown;
        break;

      case 'cyan':
        _backColor = Colors.cyan;
        break;

      case 'deepOrange':
        _backColor = Colors.deepOrange;
        break;

      case 'white':
        _backColor = Colors.white;
        break;

      case 'green':
        _backColor = Colors.green;
        break;

      case 'grey':
        _backColor = Colors.grey;
        break;

      case 'pink':
        _backColor = Colors.pink;
        break;

      case 'purple':
        _backColor = Colors.purple;
        break;

      case 'red':
        _backColor = Colors.red;
        break;

      case 'teal':
        _backColor = Colors.teal;
        break;

      default:
        _backColor = Colors.white;
    }

    _fontProvider.selectFontColorUpdate(_fontColor);
    _fontProvider.selectBackgroundColorUpdate(_backColor);

    setState(() {});
  }

  void onSelectItem(int index) async {
    _navigationProvider.selectIndexUpdate(index);

    switch (index) {
      case 0:
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ShowDialogWidget(
              selectVal: 'font',
            );
          },
        );
        break;

      case 1:
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ShowDialogWidget(
              selectVal: 'fontColor',
            );
          },
        );
        break;

      case 2:
        ToastMsg().showToastMSG('\n2\n');
        break;

      case 3:
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ShowDialogWidget(
              selectVal: 'cardColor',
            );
          },
        );
        break;

      case 4:
        ToastMsg().showToastMSG('사진이 저장 되었습니다');
        break;

      default:
        {}
    }
  }

  @override
  Widget build(BuildContext context) {
    _navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              RepaintBoundary(
                child: CaptureWidget(
                  image: _image,
                  defalutImage: _defaultIamge,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          selectedItemColor: Colors.blueGrey[800],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: onSelectItem,
          currentIndex: _navigationProvider.selectIndex,
          elevation: 2,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.font_download),
              label: '폰트',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.brush),
              label: '폰트색상',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: '앨범',
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(CupertinoIcons.rectangle_fill_on_rectangle_angled_fill),
              label: '백그라운드색상',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.save_alt),
              label: '저장',
            ),
          ],
        ),
      ),
    );
  }
}
