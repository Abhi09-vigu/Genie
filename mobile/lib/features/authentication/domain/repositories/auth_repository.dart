import '../entities/user_entity.dart';

/// AuthRepository defines the abstract interface for authentication use cases.
abstract class AuthRepository {
  /// Signs in a user using email and password credentials.
  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Registers a new user with email, password, name, and phone.
  Future<UserEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
  });

  /// Sends a password recovery email to the user.
  Future<void> sendPasswordResetEmail({required String email});

  /// Revokes active user session tokens.
  Future<void> signOut();

  /// Fetches the currently active user profile structure.
  Future<UserEntity?> getCurrentUser();
}
