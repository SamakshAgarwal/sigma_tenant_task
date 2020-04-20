import 'dart:math';

import 'package:sigmatenanttask/services/customer.dart';
import 'package:sigmatenanttask/services/expense.dart';

class Services {
  List customers = [];
  List names = [
    'Pranmay',
    'Giriwar',
    'dhan',
    'Sahastrajay',
    'Yashonandan Vasuki',
    'Mayant',
    'Nisshu',
    'Riaank',
    'Visharth',
    'Havyansh',
    'Sudeergh',
    'Jeshwik',
    'Rikash',
    'Pranmay',
    'Karnica',
    'Shivasha',
    'Suprati',
    'Rahanya',
    'Sivatheertha'
  ];

  List expenses = [];

  makeCustomers() {
    var rand = Random(1);
    names.forEach((name) {
      customers.add(Customer(
          name: name,
          age: 25 + rand.nextInt(50 - 25),
          isPaymentPaid: rand.nextBool(),
          status: rand.nextBool() || rand.nextBool() || rand.nextBool(),
          trainer: names[rand.nextInt(names.length)]));
    });
    return customers;
  }

  makeExpenses() {
    var rand = Random();
    for (int i = 0; i < 15; i++) {
      expenses.add(Expense(
          num: (600 + rand.nextInt(100)).toString(),
          amount: (1000 + rand.nextInt(1000)).toString()));
    }
    return expenses;
  }
}
