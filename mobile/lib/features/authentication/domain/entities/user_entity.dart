/// UserEntity represents the pure domain data structure for a User profile.
class UserEntity {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final DateTime createdAt;

  const UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
  });

  /// Utility to copy properties
  UserEntity copyWith({
    String? uid,
    String? name,
    String? email,
    String? phone,
    DateTime? createdAt,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
