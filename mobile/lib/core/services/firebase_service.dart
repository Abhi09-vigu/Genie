import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

/// FirebaseService manages the initialization and accessibility of Firebase SDK services.
class FirebaseService {
  FirebaseService._();

  static final FirebaseService _instance = FirebaseService._();
  factory FirebaseService() => _instance;

  late final FirebaseApp _app;

  /// Initializes the Firebase app with explicit options from google-services.json.
  Future<void> initialize() async {
    try {
      _app = await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyCLmY30w1J13WWHMH5YXmRudyEd8YLtpQc',
          appId: '1:1079533133926:android:7e4e3da30f370b84480da7',
          messagingSenderId: '1079533133926',
          projectId: 'genie-9d615',
          storageBucket: 'genie-9d615.firebasestorage.app',
        ),
      );
      if (kDebugMode) {
        print('Firebase Service initialized successfully.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing Firebase Service: $e');
      }
    }
  }

  /// Exposes default firebase app options.
  FirebaseApp get app => _app;

  /// Getter for FirebaseAuth instance.
  FirebaseAuth get auth => FirebaseAuth.instance;

  /// Getter for FirebaseFirestore instance.
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
