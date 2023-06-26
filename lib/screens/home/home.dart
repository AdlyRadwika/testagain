import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_again/provider/contact/contact.dart';
import 'package:test_again/screens/home/widgets/contact_item.dart';
import 'package:test_again/utils/provider_enum.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            tooltip: 'Search Contact',
            icon: const Icon(Icons.search)),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Add Contact',
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, _) {
          if (provider.state == ProviderState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == ProviderState.empty ||
              provider.state == ProviderState.error) {
            return Center(
                child: Text(
              provider.message,
              textAlign: TextAlign.center,
            ));
          } else {
            return RefreshIndicator(
              onRefresh: () => provider.fetchContacts(),
              child: ListView.builder(
                itemCount: provider.contacts?.length,
                itemBuilder: (context, index) {
                  final data = provider.contacts![index];
                  return ContactItem(data: data);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
