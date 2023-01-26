class Teacher {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String image;
  final String classTeacher;
  final String section;
  final String session;
  final String id;
  Teacher({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.image,
    required this.classTeacher,
    required this.section,
    required this.session,
    required this.id,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      image: json['image'],
      classTeacher: json['classTeacher'],
      section: json['section'],
      session: json['session'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'image': image,
      'classTeacher': classTeacher,
      'section': section,
      'session': session,
      'id': id,
    };
  }
}

final List<Teacher> teachers = [
  Teacher(
    name: 'Mr. John',
    email: 'email',
    phone: 'phone',
    address: 'address',
    image: 'image',
    classTeacher: 'classTeacher',
    section: 'section',
    session: 'session',
    id: 'id',
  ),
  Teacher(
    name: 'Mr. John',
    email: 'email',
    phone: 'phone',
    address: 'address',
    image: 'image',
    classTeacher: 'classTeacher',
    section: 'section',
    session: 'session',
    id: 'id',
  ),
];
