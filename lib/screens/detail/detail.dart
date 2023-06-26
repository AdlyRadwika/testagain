import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_again/data/model/contact/contact.dart';
import 'package:test_again/provider/contact/contact.dart';
import 'package:test_again/screens/detail/widgets/row_item.dart';
import 'package:test_again/utils/constants.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late TextEditingController firstNameC;
  late TextEditingController lastNameC;
  late TextEditingController emailC;
  late TextEditingController dobC;

  @override
  void initState() {
    final data = context.read<ContactProvider>().detail;
    firstNameC = TextEditingController(text: data.firstName ?? "");
    lastNameC = TextEditingController(text: data.lastName ?? "");
    emailC = TextEditingController(text: data.email ?? "");
    dobC = TextEditingController(text: data.dob ?? "");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        actions: [
          IconButton(
              onPressed: submit, tooltip: 'Save', icon: const Icon(Icons.save))
        ],
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, _) {
          final data = provider.detail;
          final theme = Theme.of(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Constants.normalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      maxRadius: 80.0,
                      backgroundColor: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    'More Information',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RowItem(
                    theme: theme,
                    data: data.firstName,
                    label: 'First Name',
                    controller: firstNameC,
                  ),
                  const Divider(thickness: 1.0),
                  RowItem(
                    theme: theme,
                    data: data.lastName,
                    label: 'Last Name',
                    controller: lastNameC,
                  ),
                  const Divider(thickness: 1.0),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Sub Information',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  RowItem(
                    theme: theme,
                    data: data.firstName,
                    label: 'Email',
                    controller: emailC,
                  ),
                  const Divider(thickness: 1.0),
                  GestureDetector(
                    onTap: () => _chooseDatePicker(context),
                    child: RowItem(
                        theme: theme,
                        data: data.lastName,
                        label: 'DOB',
                        controller: dobC,
                        isDatePicker: true),
                  ),
                  const Divider(thickness: 1.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _chooseDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      final dateText = value.toIso8601String();
      dobC.text = dateText;
    });
  }

  void submit() {
    final firstName = firstNameC.text.trim();
    final lastName = lastNameC.text.trim();
    final email = emailC.text.trim();
    final dob = dobC.text.trim();

    if (firstName.isEmpty || lastName.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Fill the first name or the last name!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      context.read<ContactProvider>().updateContact(Contact(
            firstName: firstName,
            lastName: lastName,
            email: email,
            dob: dob,
          ));
      Navigator.pop(context);
    }
  }
}
