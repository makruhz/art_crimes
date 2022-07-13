import 'package:art_crimes/features/favourites/bloc/favourite_bloc.dart';
import 'package:art_crimes/widgets/art_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        final favourites = state.favourites;
        if (favourites.isEmpty) {
          return const Center(
            child: Text('No favourites art crimes'),
          );
        } else {
          return ListView.builder(
            itemCount: favourites.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(32.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ArtPhoto(art: favourites[index]),
                      ListTile(
                        title: Text(
                          favourites[index].title!,
                        ),
                        subtitle: Text(
                          '${favourites[index].maker}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.favorite, color: Colors.red),
                          onPressed: () {
                            BlocProvider.of<FavouriteBloc>(context).add(RemoveFavourite(favourites[index]));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
