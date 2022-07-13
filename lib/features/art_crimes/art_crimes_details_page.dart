import 'package:art_crimes/models/art.dart';
import 'package:art_crimes/widgets/art_photo.dart';
import 'package:flutter/material.dart';

class ArtCrimesDetailsPage extends StatelessWidget {
  const ArtCrimesDetailsPage({Key? key, required this.art}) : super(key: key);

  final Art art;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 32, 8, 8),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ArtPhoto(art: art),
              ListTile(
                title: const Text('Title'),
                subtitle: Text(art.title!),
              ),
              ListTile(
                title: const Text('Author'),
                subtitle: Text('${art.maker}'),
              ),
              ListTile(
                title: const Text('Period'),
                subtitle: Text('${art.period}'),
              ),
              ListTile(
                title: const Text('Measurements'),
                subtitle: Text('${art.measurements}'),
              ),
              ListTile(
                title: const Text('Additional data'),
                subtitle: Text('${art.additionalData}'),
              ),
              ListTile(
                title: const Text('Crime category'),
                subtitle: Text('${art.crimeCategory}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
