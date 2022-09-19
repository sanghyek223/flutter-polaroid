import 'package:flutter/material.dart';
import 'package:polaroid/src/provider/font_provider.dart';
import 'package:provider/provider.dart';

class CaptureWidget extends StatelessWidget {
  const CaptureWidget({Key? key, this.defalutImage, this.image})
      : super(key: key);

  final defalutImage;
  final image;

  @override
  Widget build(BuildContext context) {
    var _textFieldController = TextEditingController();
    late FontProvider _fontProvider = Provider.of<FontProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width + 80,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
        child: Card(
          color: _fontProvider.backgroundtColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 2,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width - 45,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: image != null
                          ? FileImage(image)
                          : AssetImage('assets/$defalutImage') as ImageProvider,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            var width = MediaQuery.of(context).size.width;

                            return Container(
                              height: 130,
                              width: width - 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextField(
                                    controller: _textFieldController,
                                    decoration: InputDecoration(
                                        hintText: '사진에 이름을 만들어주세요.'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FlatButton(
                                          minWidth: 50,
                                          textColor: Colors.indigo[400],
                                          child: Text(
                                            '닫기',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        FlatButton(
                                          minWidth: 50,
                                          textColor: Colors.indigo[400],
                                          child: Text(
                                            '확인',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          onPressed: () {
                                            if (_textFieldController.text ==
                                                null) {
                                              _textFieldController.text = '';
                                            }
                                            _fontProvider.polaroidTitleUpdate(
                                                _textFieldController.text);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 20.0, right: 20.0),
                      child: Text(
                        _fontProvider.polaroidTitle,
                        style: TextStyle(
                          fontSize: _fontProvider.fontSize,
                          fontFamily: _fontProvider.fontFamily,
                          color: _fontProvider.fontColor,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
