import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Stateful App Example",
    home: FavoriteCity(),
  ));
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<FavoriteCity> {
  String nameCity = "";
  var _currencies = [
    'Npr Rupees',
    'US Dollors',
    'Pounds',
    'Aus Dollors',
    'Euro',
    'Others'
  ];
  var _currentItemSelected = 'Npr Rupees';

  @override
  Widget build(BuildContext context) {
    debugPrint("Favourite City Widget is Created");

    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful App Example"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String userInput) {
                setState(() {
                  debugPrint(
                      "Set State is called, this tells framework to redraw the FavCity widget");
                  nameCity = userInput;
                });
              },
            ),
            DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                _onDropDownItemSeletected(newValueSelected);
              },
              value: _currentItemSelected,
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "Your best city is $nameCity",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onDropDownItemSeletected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
