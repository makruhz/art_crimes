import 'package:art_crimes/models/art.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArtPhoto extends StatelessWidget {
  const ArtPhoto({Key? key, required this.art}) : super(key: key);

  final Art art;

  bool _isPhoto(Art art) {
    return !(art.images!.isEmpty || art.images![0].original!.contains('seal-fbi.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return _isPhoto(art)
        ? CachedNetworkImage(
            imageUrl: art.images![0].original!,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => SizedBox(
              height: 100,
              child: Center(
                child: Text('Can not load photo', style: Theme.of(context).textTheme.headlineSmall),
              ),
            ),
            fit: BoxFit.fill,
          )
        : SizedBox(
            height: 100,
            child: Center(
              child: Text('No photo', style: Theme.of(context).textTheme.headlineSmall),
            ),
          );
  }
}
