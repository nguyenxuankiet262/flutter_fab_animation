import 'package:flutter/material.dart';
import 'package:flutter_app/const/colors.dart';
import 'package:flutter_app/pages/topping.dart';
import 'package:flutter_app/styles/fab_circular_menu.dart';
import 'package:flutter_app/styles/icon_fab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class DetailPopup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => DetailPopupState();
}

class DetailPopupState extends State<DetailPopup>{
  var _sizePopup;
  @override
  Widget build(BuildContext context) {
    _sizePopup = MediaQuery.of(context).size.height;
    // TODO: implement build
    return FabCircularMenu(
      child: Container(
          color: Colors.transparent,
          height: _sizePopup,
          child: Stack(
            children: <Widget>[
              Positioned(
                  bottom: 0,
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        height: _sizePopup * 3 / 4,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: <Widget>[
                                    GestureDetector(
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.white,
                                          margin: EdgeInsets.all(4.0),
                                          child: Center(
                                              child: Column(
                                                children: <Widget>[
                                                  Icon(
                                                    FontAwesomeIcons.caretSquareLeft,
                                                    color: Colors.grey.withOpacity(0.5),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 2),
                                                    child: Text(
                                                      "Trở lại",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 12
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                          ),
                                        )
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: 50,
                                          color: colorRing,
                                          child: Center(
                                            child: Text(
                                              "BỎ GIỎ HÀNG - 75.000",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17
                                              ),
                                            ),
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 50),
                                child: ListView(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            FlutterLogo(
                                              size: 100,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "Trà sữa cơ bản",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(left: 8.0),
                                                    child: Text(
                                                      "30.000/kg",
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    )
                                                )
                                              ],
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 8.0),
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width / 2,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        "Số lượng",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w600
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 4.0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: <Widget>[
                                                            Row(
                                                              children: <Widget>[
                                                                Icon(
                                                                  FontAwesomeIcons.minus,
                                                                  color: colorRing,
                                                                  size: 17,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                                  child: Text(
                                                                    "2",
                                                                    style: TextStyle(
                                                                        fontSize: 12,
                                                                        color: Colors.grey.withOpacity(0.5),
                                                                        fontWeight: FontWeight.bold
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "+",
                                                                  style: TextStyle(
                                                                      color: colorRing,
                                                                      fontSize: 24,
                                                                      fontWeight: FontWeight.bold
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              "30.000",
                                                              style: TextStyle(
                                                                  color: Colors.grey.withOpacity(0.5),
                                                                  fontSize: 12
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 4),
                                                        child: Text(
                                                          "Kích thước",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 8),
                                                        child: Text(
                                                          "Lượng đường",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 8),
                                                        child: Text(
                                                          "Lượng đá",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 8),
                                                        child: Text(
                                                          "Topping",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                      ),
                                                      ToppingList(),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 8),
                                                        child: Text(
                                                          "Nóng / Lạnh",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 8),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 1,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(
                                                            "Others",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w600
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.symmetric(
                                                              vertical: 8.0,
                                                            ),
                                                            height: 1,
                                                            color: Colors.grey,
                                                          ),
                                                          Text(
                                                            "Tôi muốn ghi chú sản phẩm",
                                                            style: TextStyle(
                                                                color: Colors.grey.withOpacity(0.5),
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w600
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.symmetric(
                                                              vertical: 8.0,
                                                            ),
                                                            height: 1,
                                                            color: Colors.grey,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Text(
                                                              "Group order",
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(vertical: 8.0),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[
                                                                  Container(
                                                                    width: MediaQuery.of(context).size.width / 2 - 70,
                                                                    child: Text(
                                                                      "Bạn có thể rủ thêm bạn bè và người thân để mua sản phẩm này",
                                                                      style: TextStyle(
                                                                          color: Colors.grey.withOpacity(0.5),
                                                                          fontSize: 12,
                                                                          fontWeight: FontWeight.w600
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(right: 8.0),
                                                                    child: Icon(
                                                                      FontAwesomeIcons.comment,
                                                                      color: colorChat,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                    ),
                                                  ],
                                                )
                                            ),
                                          ],
                                        )
                                    )
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                  )
              ),
            ],
          )
      ),
      ringColor: colorRing.withOpacity(0.8),
      fabOpenIcon: Icon(
        FontAwesomeIcons.handPaper
      ),
      fabCloseIcon: Icon(
        FontAwesomeIcons.solidArrowAltCircleRight
      ),
      fabColor: colorRing,
      options: <Widget>[
        fabIcon("Topping", FontAwesomeIcons.utensilSpoon, _pop),
        fabIcon("Lượng đá", FontAwesomeIcons.cubes, _pop),
        fabIcon("Lượng đường", FontAwesomeIcons.candyCane, _pop),
        fabIcon("Kích thước", FontAwesomeIcons.rulerVertical, _pop),
        fabIcon("Số lượng", FontAwesomeIcons.commentDollar, _pop),
      ],
    );
  }

  _pop(){
    print("OK");
  }
}