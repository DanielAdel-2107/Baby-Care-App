class BabySitterModel {
  final String id;
  final String name;
  final String experiance;
  final String aboutMe;
  final String age;
  final String longtude;
  final String latitude;
  final String image;
  final String salary;
  final double? distance;
  final String? locationName;
  BabySitterModel({
    required this.id,
    required this.name,
    required this.experiance,
    required this.aboutMe,
    required this.age,
    required this.longtude,
    required this.latitude,
    required this.image,
    required this.salary,
    this.distance,
    this.locationName,
  });
  factory BabySitterModel.fromJson(Map<String, dynamic> json,
      {double? distance, String? locationName}) {
    return BabySitterModel(
      id: json['id'],
      name: json['name'],
      experiance: json['experiance'],
      aboutMe: json['about_me'],
      age: json['age'],
      longtude: json['longtude'],
      latitude: json['latitude'],
      image: json['image'],
      salary: json['salary'],
      distance: distance,
      locationName: locationName,
    );
  }
  BabySitterModel copyWith(
      {String? name,
      String? experiance,
      String? aboutMe,
      String? age,
      String? longtude,
      String? latitude,
      String? image,
      String? salary,
      double? distance,
      String? locationName,
      String? id}) {
    return BabySitterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      experiance: experiance ?? this.experiance,
      aboutMe: aboutMe ?? this.aboutMe,
      age: age ?? this.age,
      longtude: longtude ?? this.longtude,
      latitude: latitude ?? this.latitude,
      image: image ?? this.image,
      salary: salary ?? this.salary,
      distance: distance ?? this.distance,
      locationName: locationName,
    );
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'experiance': experiance,
      'about_me': aboutMe,
      'age': age,
      'longtude': longtude,
      'latitude': latitude,
      'image': image,
      'salary': salary,
      'distance': distance,
      'location_name': locationName,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'BabySitterModel{name: $name, experiance: $experiance, aboutMe: $aboutMe, age: $age, longtude: $longtude, latitude: $latitude, image: $image, salary: $salary, distance: $distance, locationName: $locationName}';
  }
}
