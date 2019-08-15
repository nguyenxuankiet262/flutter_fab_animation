import 'package:flutter/material.dart';
import 'package:flutter_app/pages/detail.dart';

class ProductPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage>{
  _showDetailSheet(){
    showModalBottomSheet(
      context: context,
      builder: (builder){
        return DetailPopup();
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trà sữa",
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: _showDetailSheet,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.5
                  ))
              ),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  FlutterLogo(
                    size: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                            "Test"
                        ),
                        Text(
                            "Test"
                        ),
                        Text(
                            "Test"
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          );
        },
      ),
    );
  }
}