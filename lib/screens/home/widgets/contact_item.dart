import 'package:test_again/data/model/contact/contact.dart';
import 'package:test_again/provider/contact/contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_again/screens/route.dart' as route;

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.data,
  });

  final Contact data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<ContactProvider>().getDetail(data);
        Navigator.pushNamed(context, route.detailScreen);
      },
      leading: const Icon(Icons.person),
      title: Text(data.firstName ?? "..."),
      subtitle: Text(data.email ?? "...."),
    );
  }
}