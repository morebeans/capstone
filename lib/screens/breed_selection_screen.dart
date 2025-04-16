import 'package:flutter/material.dart';
import '../models/breed.dart';

class BreedSelectionScreen extends StatelessWidget {
  final List<Breed> breeds = [
    Breed(
      name: "Golden Retriever",
      description:
          "Golden Retrievers are friendly, intelligent, and devoted. They are highly trainable and make great family pets.",
      imageUrl:
          'https://example.com/golden_retriever.jpg', // Optional image URL
    ),
    Breed(
      name: "Bulldog",
      description:
          "Bulldogs are calm, courageous, and affectionate. They have a distinct wrinkled face and are known for being great companions.",
      imageUrl: 'https://example.com/bulldog.jpg',
    ),
    Breed(
      name: "German Shepherd",
      description:
          "German Shepherds are courageous, confident, and extremely loyal. They are highly intelligent and often used as working dogs.",
      imageUrl: 'https://example.com/german_shepherd.jpg',
    ),
    // Add more breeds here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Pet Breed"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: breeds.length,
        itemBuilder: (context, index) {
          final breed = breeds[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(breed.name),
              onTap: () {
                Navigator.pop(context, breed); // Return the selected breed
              },
            ),
          );
        },
      ),
    );
  }
}
