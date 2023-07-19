import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final int id;
  final String? photoURL;
  final bool isAuthenticated;
  const UserEntity({
    required this.name,
    required this.id,
    this.photoURL,
    required this.isAuthenticated,
  });

  UserEntity copyWith({
    String? name,
    int? id,
    String? photoURL,
    bool? isAuthenticated,
  }) {
    return UserEntity(
      name: name ?? this.name,
      id: id ?? this.id,
      photoURL: photoURL ?? this.photoURL,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  @override
  List<Object?> get props => [
        name,
        id,
        photoURL,
        isAuthenticated,
      ];
}
