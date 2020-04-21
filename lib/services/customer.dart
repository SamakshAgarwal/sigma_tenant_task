class Customer {
  bool status;
  final String name;
  final String age;
  final bool isPaymentPaid;
  final String trainer;

  Customer({this.status, this.name, this.age, this.isPaymentPaid, this.trainer})
      : assert(status != null),
        assert(name != null),
        assert(age != null),
        assert(isPaymentPaid != null),
        assert(trainer != null);

  invertStatus(){
    status =!status;
  }
}
