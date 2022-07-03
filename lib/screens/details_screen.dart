import 'package:art_crimes/models/art.dart';
import 'package:art_crimes/widgets/art_photo.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.art}) : super(key: key);

  final Art art;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: IconButton(
                  tooltip: "Back",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ArtPhoto(art: art),
                    _buildDescriptions(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDescriptions() {
    return Column(
      children: [
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
    );
  }
}
