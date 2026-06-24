import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

// User Provider
final userProvider = StateProvider<User?>((ref) => null);

// Auth State
final isLoggedInProvider = StateProvider<bool>((ref) => false);
final userRoleProvider = StateProvider<String>((ref) => '');

// Loading State
final loadingProvider = StateProvider<bool>((ref) => false);

// Error Message
final errorMessageProvider = StateProvider<String?>((ref) => null);

// Success Message
final successMessageProvider = StateProvider<String?>((ref) => null);
