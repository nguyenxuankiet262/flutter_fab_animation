import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToppingList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ToppingListState();
  }
}

class ToppingListState extends State<ToppingList> {
  Map<String, String> _listTopping = {
    "Trân châu đen": "5.000",
    "Hạt trái cây": "15.000",
    "Flan phô mai": "5.000",
    "Nha đam mật ong": "15.000",
    "Đường đen": "10.000",
    "Hạt cacao": "2.000",
    "Thách dừa": "3.000",
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _listTopping.length,
          itemBuilder: (BuildContext context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 24,
                      height: 22,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 2,
                            child: Icon(
                              FontAwesomeIcons.square,
                              size: 20,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          index % 2 == 0
                              ? Positioned(
                                  right: 0,
                                  child: Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.orangeAccent,
                                    size: 20,
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      _listTopping.keys.elementAt(index),
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.5), fontSize: 12),
                    )
                  ],
                ),
                Text(
                  _listTopping.values.elementAt(index),
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.5), fontSize: 12),
                )
              ],
            );
          },
        ));
  }
}
