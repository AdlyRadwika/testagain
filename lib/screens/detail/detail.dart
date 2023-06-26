import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_again/provider/contact/contact.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, _) {
          final data = provider.detail;
          return Column(
            children: [
              Text(data.firstName ?? "...."),
            ],
          );
        },
      ),
    );
  }
}