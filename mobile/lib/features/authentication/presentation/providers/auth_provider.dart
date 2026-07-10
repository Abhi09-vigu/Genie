import 'package:flutter/material.dart';
import '../../../../core/helpers/snackbar_helper.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/repositories/auth_repository_impl.dart';

/// AuthProvider handles UI state and delegates authentication calls to AuthRepository.
class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthProvider({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepositoryImpl();

  bool _isLoading = false;
  bool _rememberMe = false;
  UserEntity? _currentUser;

  bool get isLoading => _isLoading;
  bool get rememberMe => _rememberMe;
  UserEntity? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;

  /// Toggles the remember me checkbox state.
  void toggleRememberMe(bool? value) {
    if (value == null || _rememberMe == value) return;
    _rememberMe = value;
    notifyListeners();
  }

  /// Sets presentation loading state.
  void setLoading(bool loading) {
    if (_isLoading == loading) return;
    _isLoading = loading;
    notifyListeners();
  }

  /// Checks if there is an active session on app startup.
  Future<void> checkCurrentUser() async {
    try {
      _currentUser = await _authRepository.getCurrentUser();
      notifyListeners();
    } catch (e) {
      _currentUser = null;
      notifyListeners();
    }
  }

  /// Logs in a user. Returns true if successful.
  Future<bool> signIn({required String email, required String password}) async {
    setLoading(true);
    try {
      _currentUser = await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      setLoading(false);
      SnackbarHelper.showSuccess('Welcome back, ${_currentUser!.name}!');
      return true;
    } catch (e) {
      setLoading(false);
      SnackbarHelper.showError(e.toString().replaceAll('Exception: ', ''));
      return false;
    }
  }

  /// Registers a new user. Returns true if successful.
  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    setLoading(true);
    try {
      await _authRepository.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
      setLoading(false);
      SnackbarHelper.showSuccess('Account created successfully! Please sign in.');
      return true;
    } catch (e) {
      setLoading(false);
      SnackbarHelper.showError(e.toString().replaceAll('Exception: ', ''));
      return false;
    }
  }

  /// Sends a password reset email. Returns true if successful.
  Future<bool> sendPasswordResetEmail({required String email}) async {
    setLoading(true);
    try {
      await _authRepository.sendPasswordResetEmail(email: email);
      setLoading(false);
      SnackbarHelper.showSuccess('Reset instructions sent to $email.');
      return true;
    } catch (e) {
      setLoading(false);
      SnackbarHelper.showError(e.toString().replaceAll('Exception: ', ''));
      return false;
    }
  }

  /// Logs out the user.
  Future<void> signOut() async {
    setLoading(true);
    try {
      await _authRepository.signOut();
      _currentUser = null;
      setLoading(false);
      SnackbarHelper.showInfo('Logged out successfully.');
    } catch (e) {
      setLoading(false);
      SnackbarHelper.showError(e.toString().replaceAll('Exception: ', ''));
    }
  }
}
