import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:polaroid/src/components/ShowDialogWidget.dart';
import 'package:polaroid/src/provider/font_provider.dart';
import 'package:polaroid/src/ui/CapturePolaroidWidget.dart';
import 'package:polaroid/src/utils/ToastMsg.dart';
import 'package:provider/provider.dart';
import 'package:polaroid/src/provider/navigation_provider.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  late NavigationProvider _navigationProvider;
  late FontProvider _fontProvider;

  GlobalKey _previewkey = new GlobalKey();
  ImagePicker _picker = ImagePicker();

  List imageDefaultList = [
    'cafe-3537801_1920.jpg',
    'camera-1130731_1920.jpg',
    'hamburg-3846525_1920.jpg',
    'italy-4093227_1920.jpg',
    'people-2568954_1920.jpg',
    'town-828614_1920.jpg',
  ];

  var _image;
  var ct;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _bodyWidget(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            RepaintBoundary(
              key: _previewkey,
              child: CapturePolaroidWidget(
                image: _image,
                defalutImage: (imageDefaultList..shuffle()).first,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSelectItem(int index) async {
    _navigationProvider.selectIndexUpdate(index);

    switch (index) {
      case 0:
        {
          showDialog(
            context: ct,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ShowDialogWidget(
                selectVal: 'font',
              );
            },
          );
        }
        break;

      case 1:
        {
          showDialog(
            context: ct,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ShowDialogWidget(
                selectVal: 'fontColor',
              );
            },
          );
        }
        break;

      case 2:
        {
          final pickedFile =
              await _picker.getImage(source: ImageSource.gallery);

          setState(() {
            if (pickedFile != null) {
              _image = File(pickedFile.path);
            }
          });
        }
        break;

      case 3:
        {
          showDialog(
            context: ct,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ShowDialogWidget(
                selectVal: 'cardColor',
              );
            },
          );
        }
        break;

      case 4:
        {
          var localTimestamp = (DateTime.now().millisecondsSinceEpoch + 9);

          var renderObject = _previewkey.currentContext?.findRenderObject();
          if (renderObject is RenderRepaintBoundary) {
            var boundary = renderObject;
            ui.Image image = await boundary.toImage();

            // final directory = (await getApplicationDocumentsDirectory()).path;

            // ByteData byteData =
            //     await image.toByteData(format: ui.ImageByteFormat.png);
            // Uint8List pngBytes = byteData.buffer.asUint8List();

            // File imgFile = new File('$directory/$localTimestamp-polaroid.jpg');
            // imgFile.writeAsBytes(pngBytes).then((value) async {
            //   ImageGallerySaver.saveFile(value.path); // 이미지 저장
            // });

            ToastMsg().showToastMSG('\n사진이 저장 되었습니다\n');
          }
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Provider를 호출해 접근
    _navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          '폴라로이드 사진 만들기',
          style: TextStyle(
            fontFamily: 'CuteFont',
            fontSize: 21,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _fontProvider.reset();
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => super.widget,
              //   ),
              // );
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: _bodyWidget(context),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          selectedItemColor: Colors.indigo[400],
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
