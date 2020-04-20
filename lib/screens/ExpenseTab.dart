import 'package:flutter/material.dart';
import 'package:sigmatenanttask/services/services.dart';
import 'package:sigmatenanttask/widgets/customDataTable.dart';

class ExpenseTab extends StatefulWidget {

  @override
  _ExpenseTabState createState() => _ExpenseTabState();
}

class _ExpenseTabState extends State<ExpenseTab> {
  List isCollapsed = [true,true,true];
  List expenses = Services().makeExpenses();
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            expenseCard('Client Payment Report',0),
            expenseCard('Expense Manager',1),
            expenseCard('Expense Category',2),
          ],
        ),
      );
    }
  Widget expenseCard(String title, int cardIndex) {
    String buttonText = 'Expand';
    var buttonIcon = Icons.add;
    double height = 250;
    if(!isCollapsed[cardIndex]){
      buttonText = 'Collapse';
      buttonIcon = Icons.remove;
      height = 500;
    }
    return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: Container(
            height: height,
            child: Column(children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          isCollapsed[cardIndex]=!isCollapsed[cardIndex];
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            buttonText,
                            style: TextStyle(color: Colors.pink),
                          ),
                          Icon(
                            buttonIcon,
                            color: Colors.pink,
                          )
                        ],
                      )),
                ],
              ),
              Flexible(
                child: CustomDataTable(
                  fixedColWidth: 100,
                  cellWidth: 100,
                  fixedCornerCell: Row(
                    children: <Widget>[Text('Invoice no'), Icon(Icons.edit)],
                  ),
                  fixedRowCells: [Text('Invoice date'), Text('Invoice Amt.')],
                  fixedColCells: [
                    for (int i = 0; i < expenses.length; i++)
                      Row(
                        children: <Widget>[
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.lightBlue,
                            value: expenses[i].isSelected,
                            onChanged: (value) {
                              setState(() {
                                expenses[i].invertIsSelected();
                              });
                            },
                          ),
                          Flexible(child: Text('Inv ${expenses[i].num}'))
                        ],
                      )
                  ],
                  rowsCells: <List>[
                    for (int i = 0; i < expenses.length; i++)
                      [
                        Text(expenses[i].date),
                        Text('\$${expenses[i].amount}')
                      ]
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
