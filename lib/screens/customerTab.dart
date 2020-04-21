import 'package:flutter/material.dart';
import 'package:sigmatenanttask/services/services.dart';
import 'package:sigmatenanttask/widgets/customDataTable.dart';

class CustomerTab extends StatefulWidget {
  @override
  _CustomerTabState createState() => _CustomerTabState();
}

class _CustomerTabState extends State<CustomerTab> {
  List allCustomers = Services().makeCustomers();
  List columnsTitle = ['Name', 'Age', 'Payment Status', 'Trainer'];
  bool isSearch = false;
  int columnIndex = 0;
  List customers = [];

  @override
  void initState() {
    customers = allCustomers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (isSearch) searchWidget(),
        if (customers.isNotEmpty)
          Flexible(
            child: CustomDataTable(
              fixedColWidth: 100,
              fixedCornerCell: Row(
                children: <Widget>[
                  Text('Status'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit,
                      color: Colors.black45,
                      size: 15,
                    ),
                  )
                ],
              ),
              fixedRowCells: [
                for (int i = 0; i < columnsTitle.length; i++)
                  GestureDetector(
                      onTap: () {
                        if (i == 1)
                          setState(() {
                            customers..sort((a, b) => (a.age).compareTo(b.age));
                          });
                        else
                          setState(() {
                            isSearch = true;
                            columnIndex = i;
                          });
                      },
                      child: Text(columnsTitle[i]))
              ],
              fixedColCells: [
                for (int i = 0; i < customers.length; i++)
                  Row(
                    children: <Widget>[
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.lightBlue,
                        value: customers[i].status,
                        onChanged: (value) {
                          setState(() {
                            print('Set state');
                            customers[i].invertStatus();
                          });
                        },
                      ),
                      customers[i].status
                          ? Flexible(child: Text('Active'))
                          : Flexible(child: Text('Inactive'))
                    ],
                  )
              ],
              rowsCells: <List>[
                for (int i = 0; i < customers.length; i++)
                  <Widget>[
                    Text(customers[i].name),
                    Text(customers[i].age),
                    customers[i].isPaymentPaid
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5)),
                              width: double.infinity,
                              height: double.infinity,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Paid',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5)),
                              width: double.infinity,
                              height: double.infinity,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Not Paid',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ),
                          ),
                    Text(customers[i].trainer),
                  ]
              ],
            ),
          ),
        if (customers.isEmpty)
          Container(
            child: Center(
              child: Text('No data'),
            ),
          )
      ],
    );
  }

//  sortFunction(int columnIndex) {
//    print(columnIndex);
//    if (columnIndex == 0) customers..sort((a, b) => (a.name).compareTo(b.name));
//    if (columnIndex == 1) customers..sort((a, b) => (a.age).compareTo(b.age));
//    if (columnIndex == 3)
//      customers..sort((a, b) => (a.trainer).compareTo(b.trainer));
//    setState(() {});
//  }
//
//  filterDialog() {
//    showDialog(
//        context: (context),
//        builder: (context) => AlertDialog(
//              title: TextField(),
//            ));
//  }

  searchWidget() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 16),
              child: TextField(
                onChanged: (text) {
                  filterCustomerList(text);
                },
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        isSearch = false;
                        customers = allCustomers;
                      });
                    }))
          ],
        ),
      ),
    );
  }

  filterCustomerList(String text) {
    print('called');
    customers = [];
    allCustomers.forEach((customer) {
      if (columnIndex == 0) if (customer.name
          .toLowerCase()
          .contains(text.toLowerCase())) customers.add(customer);
      if (columnIndex == 3) if (customer.trainer
          .toLowerCase()
          .contains(text.toLowerCase())) customers.add(customer);
    });
    setState(() {});
  }
}
