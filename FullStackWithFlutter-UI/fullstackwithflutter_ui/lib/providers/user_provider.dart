import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullstackwithflutter_ui/models/user.dart';
import 'package:fullstackwithflutter_ui/repositories/user_repository.dart';

final userRepositoryProvider =
    Provider<IUserRepository>((ref) => UserRepository());
final usersList = FutureProvider.autoDispose<UserListResponse>((ref) async {
  final repository = ref.watch(userRepositoryProvider);

  return repository.fetchUsersList();
});
