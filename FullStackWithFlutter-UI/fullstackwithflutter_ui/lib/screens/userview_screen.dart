import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullstackwithflutter_ui/models/user.dart';
import 'package:fullstackwithflutter_ui/providers/user_provider.dart';

class UserViewScreen extends ConsumerWidget {
  final Object? userObject;
  const UserViewScreen({super.key, required this.userObject});
  static const String routeName = "/user-view";

  // @override
  // void didChangeDependencies() {
  //   // super.didChangeDependencies();
  //   var personString = ModalRoute.of(context)?.settings.arguments as String;
  //   print(personString);
  // }
  // @override
  // void didChangeDependencies() {
  //   var user =
  //       ModalRoute.of(context as BuildContext)?.settings.arguments as User;
  //   print(user);
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userId = int.parse(userObject.toString());
    final singleUser = ref.watch(singleUserProvider(userId));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User"),
        ),
        body: SingleChildScrollView(
          child: singleUser.when(
            data: (user) {
              return Card(
                child: ListTile(
                  title: Text(user.data!.fullName.toString()),
                  subtitle: Text(user.data!.mobileNumber.toString()),
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error $err'),
          ),
          //Text("User detail " + userId.toString()),
        ),
      ),
    );
  }
}
