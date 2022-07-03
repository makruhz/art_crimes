import 'package:art_crimes/bloc/favourite/favourite_bloc.dart';
import 'package:art_crimes/widgets/art_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        final favourites = state.favourites;

        if (favourites.isEmpty) {
          return _buildEmptyListView();
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

  _buildEmptyListView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text('No favourite art crimes', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            Text('You should add items to favourite', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
