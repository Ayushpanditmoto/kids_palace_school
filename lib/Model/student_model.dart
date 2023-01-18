class Student {
  final String id;
  final String name;
  final String email;
  final String password;
  final int phone;
  final String address;
  final String image;
  final String cLass;
  final String section;
  final String session;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.image,
    required this.cLass,
    required this.section,
    required this.session,
  });
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      address: json['address'],
      image: json['image'],
      cLass: json['class'],
      section: json['section'],
      session: json['session'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
      'image': image,
      'class': cLass,
      'section': section,
      'session': session,
    };
  }
}
