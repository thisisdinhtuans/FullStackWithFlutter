import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullstackwithflutter_ui/providers/user_provider.dart';
import 'package:fullstackwithflutter_ui/screens/userform_screen.dart';
import 'package:fullstackwithflutter_ui/screens/userview_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});
  static const String routeName = "/userlist";
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  // List<String> _items = ["1", "2", "3", "4", "5", "6", "7"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User List"),
        ),
        body: Center(
          child: Column(
            children: const [
              Text("test"),
              UsersListView(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, UserFormScreen.routeName);
            },
            label: const Text("Create new user"),
            icon: const Icon(Icons.account_circle)),
      ),
    );
  }
}

class UsersListView extends ConsumerWidget {
  const UsersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lstUsers = ref.watch(usersList);
    return lstUsers.when(
        data: (users) {
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref.refresh(usersList);
              },
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: users.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  UserViewScreen.routeName,
                                  arguments: users.data[index].id.toString());
                            },
                            child: ListTile(
                              title: Text(users.data[index].fullName),
                              subtitle: Text(
                                  users.data[index].mobileNumber.toString()),
                              trailing: SizedBox(
                                width: 80,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: GestureDetector(
                                        child: const Icon(Icons.edit,
                                            color: Colors.purple),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const UserFormScreen(),
                                                settings: RouteSettings(
                                                    name: "editPerson",
                                                    arguments:
                                                        (users.data[index]))),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: GestureDetector(
                                        child: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onTap: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
                  }),
            ),
          );
        },
        error: (err, stack) => Text('Error $err'),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
