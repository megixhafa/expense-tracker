import 'package:affluenzapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';

class MyBodyPage extends StatelessWidget {
  const MyBodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Stack( children: [
        Positioned(
          top: 10.0,
          height: 180.0,
          left: 10.0,
          right: 10.0,
          child: Card(
          color:  Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
           ),
              child: Column(children: <Widget>[
                 SizedBox(
                  width: 360,
                  height: 100,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                    child: Text('0.0 Euro',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.black54,
                        )
                    ),
                  ),
                ),
                IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 135.0),
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => _getMoneyPopup(context),
                            );
                          },
                          style: TextButton.styleFrom(backgroundColor: Colors.transparent),
                          child: const Text('Add Amount',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.black54,),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        //child: Size(50, 50), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.teal[900], // button color
                            child: InkWell(
                              splashColor: Colors.green, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox.fromSize(
                                    child: IconButton(
                                      icon: Icon(Icons.attach_money),
                                      onPressed: () {},),
                                  ),
                                  // Text("ADD", style: TextStyle(fontSize: 12, color: Colors.white),), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                        //size: Size(50, 50), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.red[900], // button color
                            child: InkWell(
                              splashColor: Colors.pink, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox.fromSize(
                                    child: IconButton(
                                      icon: Icon(Icons.attach_money),
                                      onPressed: () {},),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _getMoneyPopup (BuildContext context) {
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);

  return AlertDialog(
    title: const Text('Amount',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: amountController,
          autofocus: true,
          decoration: InputDecoration(
              hintText: 'Add Amount'
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () async{
          int i = await DatabaseHelper.instance.insert({
            DatabaseHelper.columnAmount : amountController.text,
            DatabaseHelper.columnDate : formattedDate, //DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
            DatabaseHelper.columnName : 'Amount Added'
          });

          print('the inserted item is $i');
        },
        child: Text('Add', style: TextStyle(color: Theme.of(context).colorScheme.secondary ),),
      ),
    ],
  );

}

TextEditingController amountController = new TextEditingController();

