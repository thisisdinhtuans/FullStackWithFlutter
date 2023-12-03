import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<String> _items = ["1", "2", "3", "4", "5", "6", "7"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Listing"),
      ),
      body: Column(
        children: [
          Text("User Detail"),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int idx) {
                return Card(
                  elevation: 2.0,
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(_items[idx]),
                        trailing: Icon(Icons.ac_unit_sharp),
                      )),
                  color: Colors.greenAccent,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
