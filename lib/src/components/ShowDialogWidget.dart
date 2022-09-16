import 'package:flutter/material.dart';
import 'package:polaroid/src/ui/DialogCardBakColorSelectWidget.dart';
import 'package:polaroid/src/ui/DialogFontColorSelectWidget.dart';
import 'package:polaroid/src/ui/DialogFontSelectWidget.dart';

class ShowDialogWidget extends StatelessWidget {
  final selectVal;

  const ShowDialogWidget({this.selectVal});

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
                      width: 200,
                      height: 30,
                      decoration: new BoxDecoration(
                          color: Colors.indigo[400],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(10.0))),
                      child: Center(
                        child: Text(
                          "닫기",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
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
