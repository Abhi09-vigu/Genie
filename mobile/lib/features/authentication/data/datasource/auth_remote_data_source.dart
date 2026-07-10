import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../models/user_model.dart';

/// AuthRemoteDataSource connects directly to Firebase Auth and Cloud Firestore.
class AuthRemoteDataSource {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRemoteDataSource({
    firebase_auth.FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  /// Signs in a user using email and password.
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user == null) {
      throw Exception('User authentication failed.');
    }

    return await getUserProfile(credential.user!.uid);
  }

  /// Registers a user profile in Firebase Auth and writes details to Firestore.
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = credential.user;
    if (user == null) {
      throw Exception('User creation failed.');
    }

    final userModel = UserModel(
      uid: user.uid,
      name: name,
      email: email,
      phone: phone,
      createdAt: DateTime.now(),
    );

    // Save profile to Firestore Users collection
    await _firestore.collection('Users').doc(user.uid).set(userModel.toFirestore());

    return userModel;
  }

  /// Retrives a User profile from Firestore.
  Future<UserModel> getUserProfile(String uid) async {
    final doc = await _firestore.collection('Users').doc(uid).get();
    if (!doc.exists) {
      throw Exception('User profile not found in database.');
    }
    return UserModel.fromFirestore(doc);
  }

  /// Tries to get the currently active Firebase Auth user details.
  Future<UserModel?> getCurrentUser() async {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser == null) return null;
    return await getUserProfile(firebaseUser.uid);
  }

  /// Sends a password reset email.
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  /// Revokes credentials and logs out.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
