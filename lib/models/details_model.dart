class DetailsModel {
  late String name;
  late String address;
  late int age;

  DetailsModel.fromJson(Map obj) {
    name = obj["name"];
    address = obj["address"];
    age = int.parse(obj["age"]);
  }
}
