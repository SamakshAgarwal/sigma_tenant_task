import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sigmatenanttask/screens/ExpenseTab.dart';
import 'package:sigmatenanttask/screens/customerTab.dart';
import 'package:sigmatenanttask/services/services.dart';
import 'package:sigmatenanttask/widgets/customDataTable.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;
  List bottomNavBarTitles = [
    'Overview',
    'Customers',
    'Expenses',
    'Property',
    'Profile'
  ];

  List customers = Services().makeCustomers();
  List expenses = Services().makeExpenses();
  List<Widget> children = [];
  GlobalKey dataTableKey = GlobalKey();
  List isCollapsed = [true,true,true];
  Widget currentWidget;

  @override
  void initState() {
    children = <Widget>[
      Container(),
      CustomerTab(),
      ExpenseTab(),
      Container(),
      Container()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(bottomNavBarTitles[_currentIndex]),
      ),
      body: children[_currentIndex],
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {}),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedItemColor: Colors.pink,
        elevation: 5,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Container(
                height: 0.0,
              ),
              title: Text(bottomNavBarTitles[0])),
          BottomNavigationBarItem(
              icon: Container(
                height: 0.0,
              ),
              title: Text(bottomNavBarTitles[1])),
          BottomNavigationBarItem(
              icon: Container(
                height: 0.0,
              ),
              title: Text(bottomNavBarTitles[2])),
          BottomNavigationBarItem(
              icon: Container(
                height: 0.0,
              ),
              title: Text(bottomNavBarTitles[3])),
          BottomNavigationBarItem(
              icon: Container(
                height: 0.0,
              ),
              title: Text(bottomNavBarTitles[4]))
        ],
      ),
    );
  }
}
