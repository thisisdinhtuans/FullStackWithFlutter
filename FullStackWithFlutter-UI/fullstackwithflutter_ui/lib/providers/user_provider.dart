import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fullstackwithflutter_ui2/repository'
import 'package:fullstackwithflutter_ui/repositories/user_repository.dart';

final userRepositoryProvider =
    Provider<IUserRepositoty>((ref) => UserRepository());
