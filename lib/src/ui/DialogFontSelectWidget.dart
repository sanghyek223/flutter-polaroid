import 'package:flutter/material.dart';
import 'package:polaroid/src/provider/font_provider.dart';
import 'package:provider/provider.dart';

class FontSelectWidget extends StatelessWidget {
  late FontProvider _fontProvider;

  String text = '가 나 다 라 마 바 사 아';
  double fontsize = 20.0;
  var fonWieigt = FontWeight.w700;
  var fontList = [
    'NanumPenScript',
    'HiMelody',
    'CuteFont',
    'Dokdo',
    'SingleDay',
    'Stylish',
    'GamjaFlower',
    'EastSeaDokdo',
    'Gaegu-Regular',
    'Gugi-Regular',
    'Jua-Regular',
    'unflower-Medium',
    'NanumBrushScript',
  ];

  Widget slectfontList(context, font) {
    return GestureDetector(
      onTap: () {
        _fontProvider?.selectFontFamilyUpdate(font);
        Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontsize,
              fontFamily: font,
              fontWeight: fonWieigt,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _fontProvider = Provider.of<FontProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 300,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Text(
              '폰트를 수정해 보세요',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: fontsize,
                fontFamily: 'CuteFont',
                fontWeight: fonWieigt,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: fontList.length,
              itemBuilder: (context, index) {
                return slectfontList(context, fontList[index]);
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(color: Colors.black45),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
