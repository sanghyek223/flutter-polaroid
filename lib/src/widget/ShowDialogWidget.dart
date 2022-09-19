import 'package:flutter/material.dart';
import 'package:polaroid/src/widget/card_back_color_select_widget.dart';
import 'package:polaroid/src/widget/font_color_select_widget.dart';
import 'package:polaroid/src/widget/font_select_widget.dart';

class ShowDialogWidget extends StatelessWidget {
  final selectVal;

  const ShowDialogWidget({Key? key, this.selectVal}) : super(key: key);

  Widget switchWidget() {
    switch (selectVal) {
      case 'font':
        return FontSelectWidget();

      case 'fontColor':
        return FontSelecColortWidget();

      case 'cardColor':
        return CardBackSelectColorWidget();

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.center,
            child: Container(
              width: 300.0,
              height: 400.0,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(Radius.circular(15.0))),
              alignment: AlignmentDirectional.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  if (selectVal == 'font') FontSelectWidget(),
                  if (selectVal == 'fontColor') FontSelecColortWidget(),
                  if (selectVal == 'cardColor') CardBackSelectColorWidget(),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 130,
                      height: 35,
                      decoration: new BoxDecoration(
                          color: Colors.blueGrey[800],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(5.0))),
                      child: Center(
                        child: Text(
                          "닫 기",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
