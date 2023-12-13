import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullstackwithflutter_ui/models/user.dart';
import 'package:fullstackwithflutter_ui/repositories/user_repository.dart';

final userRepositoryProvider =
    Provider<IUserRepository>((ref) => UserRepository());
final usersList = FutureProvider.autoDispose<UserListResponse>((ref) async {
  final repository = ref.watch(userRepositoryProvider);

  return repository.fetchUsersList();
});

class UserFormNotifier extends ChangeNotifier {
  UserFormNotifier(this.ref) : super();
  final Ref ref;
  // final ProviderRef<UserRepository> ref;
  Future<UserResponse> onSubmitUser(User user) async {
    final repository = ref.read(userRepositoryProvider);
    late UserResponse resp;
    if (user.id == 0) {
      //create new user
      resp = await repository.createNewUser(user);
    } else {
      //update exiting user with userId
    }
    return resp;
  }
}

// final UserFormProvider = ChangeNotifierProvider.autoDispose<UserFormNotifier,
//     ProviderRef<UserRepository>>((ref) {
//   return UserFormNotifier(ref);
// });
final UserFormProvider =
    ChangeNotifierProvider.autoDispose<UserFormNotifier>((ref) {
  return UserFormNotifier(ref);
});
