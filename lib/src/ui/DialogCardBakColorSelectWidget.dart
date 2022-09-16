import 'package:flutter/material.dart';
import 'package:polaroid/src/provider/font_provider.dart';
import 'package:provider/provider.dart';

class CardBackSelectColorWidget extends StatelessWidget {
  late FontProvider _fontProvider;

  double fontsize = 20.0;
  var fonWieigt = FontWeight.w700;

  var fonColortList = [
    Colors.orange,
    Colors.black,
    Colors.indigo,
    Colors.amber,
    Colors.blue,
    Colors.blueGrey,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
    Colors.white,
    Colors.green,
    Colors.grey,
    Colors.pink,
    Colors.purple,
    Colors.red,
    Colors.teal
  ];

  Widget slectfontList(context, color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: GestureDetector(
        onTap: () {
          _fontProvider?.selectBackgroundColorUpdate(color);
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 50,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: Container(
                decoration: new BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ),
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
              '사진 배경 색상을 수정해 보세요',
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
            child: ListView.builder(
              itemCount: fonColortList.length,
              itemBuilder: (context, index) {
                return slectfontList(context, fonColortList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
