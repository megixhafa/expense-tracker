import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'body.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.black54 : Colors.white,
      appBar: AppBar(
        title: Text('Expense Tracker'),
        backgroundColor: Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.teal[900] : Colors.teal[900],
        centerTitle: true,
        actions: <Widget>[
            ChangeThemeButtonWidget(),
        ],
      ),
      body: MyBodyPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog(context),
          );
        },
        child: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.teal[900],
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  int selectedRadio = 0;
  return AlertDialog(
    title: const Text('TRANSACTION',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
      //List<Widget>.generate(4, (int index) {
          TextField(
            autofocus: true,
            decoration: InputDecoration(
            labelText: 'Name', hintText: 'Transaction Name'),
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(
            labelText: 'Amount', hintText: '000.0'),
          ),
        ],
      ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Close', style: TextStyle(color: Theme.of(context).colorScheme.secondary ),),
      ),
    ],
  );
}

