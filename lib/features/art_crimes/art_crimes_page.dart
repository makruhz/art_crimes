import 'package:animations/animations.dart';
import 'package:art_crimes/features/art_crimes/art_crimes_details_page.dart';
import 'package:art_crimes/features/art_crimes/bloc/art_crimes_bloc.dart';
import 'package:art_crimes/features/favourites/bloc/favourite_bloc.dart';
import 'package:art_crimes/models/art.dart';
import 'package:art_crimes/widgets/art_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtCrimesPage extends StatefulWidget {
  const ArtCrimesPage({Key? key}) : super(key: key);

  @override
  State<ArtCrimesPage> createState() => _ArtCrimesPageState();
}

class _ArtCrimesPageState extends State<ArtCrimesPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  bool _isFavourite(Art art) {
    return BlocProvider.of<FavouriteBloc>(context).state.favourites.contains(art);
  }

  void _onScroll() {
    if (_isBottom) context.read<ArtCrimesBloc>().add(FetchArtCrimes());
  }

  Future<void> _onRefresh() async {
    context.read<ArtCrimesBloc>().add(RefreshArtCrimes());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtCrimesBloc, ArtCrimesState>(
      builder: (context, state) {
        switch (state.status) {
          case ArtCrimesStatus.failure:
            return _buildErrorView(context, 'Problem with connection');
          case ArtCrimesStatus.noInternetConnection:
          case ArtCrimesStatus.success:
            if (state.artCrimes.isEmpty) {
              return _buildErrorView(context, 'No arts in cache');
            }
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.hasReachedMax ? state.artCrimes.length : state.artCrimes.length + 1,
                itemBuilder: (context, index) {
                  final arts = state.artCrimes;
                  return index >= state.artCrimes.length
                      ? state.status == ArtCrimesStatus.noInternetConnection
                          ? _buildNoInternetMessage()
                          : _buildLoadingView()
                      : Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: OpenContainer(
                              closedElevation: 0.0,
                              openElevation: 0.0,
                              transitionType: ContainerTransitionType.fadeThrough,
                              transitionDuration: const Duration(milliseconds: 800),
                              openBuilder: (context, action) => ArtCrimesDetailsPage(art: arts[index]),
                              closedBuilder: (context, action) {
                                return Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      ArtPhoto(art: arts[index]),
                                      ListTile(
                                        title: Text(
                                          arts[index].title!,
                                        ),
                                        subtitle: Text(
                                          '${arts[index].maker}',
                                        ),
                                        trailing: IconButton(
                                          icon: _isFavourite(arts[index])
                                              ? const Icon(Icons.favorite, color: Colors.red)
                                              : const Icon(Icons.favorite),
                                          onPressed: () {
                                            if (!_isFavourite(arts[index])) {
                                              BlocProvider.of<FavouriteBloc>(context).add(AddFavourite(arts[index]));
                                            } else {
                                              BlocProvider.of<FavouriteBloc>(context).add(RemoveFavourite(arts[index]));
                                            }
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                },
              ),
            );
          default:
            return _buildLoadingView();
        }
      },
    );
  }

  _buildLoadingView() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _buildNoInternetMessage() {
    return const Center(
      child: Text("No internet connection..."),
    );
  }

  _buildErrorView(BuildContext context, String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Text(title, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          const Text('You can refresh or load from cache.', textAlign: TextAlign.center),
          const SizedBox(height: 40),
          ElevatedButton(
              onPressed: () => BlocProvider.of<ArtCrimesBloc>(context).add(RefreshArtCrimes()),
              child: const Text('Refresh')),
          TextButton(
              onPressed: () => BlocProvider.of<ArtCrimesBloc>(context).add(LoadFromCacheArtCrimes()),
              child: const Text('Load from storage'))
        ],
      ),
    );
  }
}
