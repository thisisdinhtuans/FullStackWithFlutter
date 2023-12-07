import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

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
            children: const [Text("test")],
          ),
        ),
      ),
    );
  }
}
