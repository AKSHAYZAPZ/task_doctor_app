class DoctorModel {
  final String id;
  final String name;
  final String speciality;
  final double rating;
  final int experience;
  final int consultationFee;
  final String location;
  final bool available;
  final String gender;
  final String avatarUrl;
  final List<String> languages;
  final String education;
  final String bio;

  DoctorModel({
    required this.id,
    required this.name,
    required this.speciality,
    required this.rating,
    required this.experience,
    required this.consultationFee,
    required this.location,
    required this.available,
    required this.gender,
    required this.avatarUrl,
    required this.languages,
    required this.education,
    required this.bio,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      speciality: json['speciality'] ?? 'General',
      rating:
      (json['rating'] != null) ? (json['rating'] as num).toDouble() : 0.0,
      experience: json['experience'] ?? 0,
      consultationFee: json['consultationFee'] ?? 0,
      location: json['location'] ?? 'Unknown Location',
      available: json['available'] ?? false,
      gender: json['gender'] ?? 'Not Specified',
      avatarUrl: json['avatarUrl'] ??
          'https://img.freepik.com/free-photo/female-doctor-hospital_23-2148827760.jpg',
      languages: json['languages'] != null
          ? List<String>.from(json['languages'])
          : ['English'],
      education: json['education'] ?? 'MBBS',
      bio: json['bio'] ??
          'A dedicated and experienced medical professional specializing in patient care. With extensive knowledge in the field, this doctor focuses on delivering personalized treatment and compassionate service.',
    );
  }
}