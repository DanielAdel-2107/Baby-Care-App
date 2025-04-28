class ChildModel {
  final String name, age;

  ChildModel({required this.name, required this.age});
  toJson (){
    return {
      'name': name,
      'age': age
    };
  }
  static ChildModel fromJson(Map<String, dynamic> json) {
    return ChildModel(name: json['name'], age: json['age']);
  }
}