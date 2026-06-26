import 'package:flutter/material.dart';
import '../data/campus_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() =>
      _SearchScreenState();
}

class _SearchScreenState
    extends State<SearchScreen> {
  List results = CampusData.nodes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Location"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search building...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  results = CampusData.nodes
                      .where((e) => e.name
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (_, index) {
                final node = results[index];

                return ListTile(
                  leading: const Icon(Icons.location_on),
                  title: Text(node.name),
                  subtitle: Text(node.id),
                  onTap: () {
                    Navigator.pop(context, node);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}