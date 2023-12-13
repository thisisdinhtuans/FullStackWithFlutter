import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullstackwithflutter_ui/models/user.dart';
import 'package:fullstackwithflutter_ui/providers/user_provider.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});
  static const String routeName = "/userdetail";

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User Form"),
        ),
        body: Center(
          child: Column(
            children: const [
              Text("test"),
              UserDetailView(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetailView extends ConsumerStatefulWidget {
  const UserDetailView({super.key});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends ConsumerState<UserDetailView> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLength: 30,
                controller: _fullNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter full name";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Your Full Name",
                    labelText: "Full Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLength: 15,
                controller: _mobileNumberController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter phone number";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Your Phone Number",
                    labelText: "Phone Number"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var user = User(
                        id: 0,
                        fullName: _fullNameController.text,
                        mobileNumber: _mobileNumberController.text);
                    var resp =
                        await ref.read(UserFormProvider).onSubmitUser(user);
                    if (resp.status == true) {
                      _fullNameController.clear();
                      _mobileNumberController.clear();
                      _formKey.currentState!.reset();
                    }
                    //show success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(resp.message.toString()),
                          duration: const Duration(seconds: 3),
                          backgroundColor: (resp.status == true)
                              ? Colors.green
                              : Colors.red),
                    );
                  }
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
