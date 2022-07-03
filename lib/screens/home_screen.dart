import 'package:art_crimes/bloc/art_crimes/art_crimes_bloc.dart';
import 'package:art_crimes/bloc/favourite/favourite_bloc.dart';
import 'package:art_crimes/screens/details_screen.dart';
import 'package:art_crimes/widgets/art_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            return _buildErrorView(context);
          case ArtCrimesStatus.noInternetConnection:
          case ArtCrimesStatus.success:
            if (state.artCrimes.isEmpty) {
              return Center(
                child: Text('No art crimes', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
              );
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
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    art: arts[index],
                                  ),
                                ),
                              );
                            },
                            child: Card(
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
                                      icon: BlocProvider.of<FavouriteBloc>(context).state.favourites.contains(arts[index])
                                          ? const Icon(Icons.favorite, color: Colors.red)
                                          : const Icon(Icons.favorite),
                                      onPressed: () {
                                        if (!BlocProvider.of<FavouriteBloc>(context).state.favourites.contains(arts[index])) {
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
                            ),
                          ),
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
        child: Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 32.0),
      child: Text(
        "No internet connection...",
        style: TextStyle(color: Colors.indigo),
      ),
    ));
  }

  _buildErrorView(context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text('Problem with connection', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            Text('You can refresh or load from cache.', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: () => BlocProvider.of<ArtCrimesBloc>(context).add(RefreshArtCrimes()), child: const Text('Refresh')),
            TextButton(onPressed: () => BlocProvider.of<ArtCrimesBloc>(context).add(LoadFromCacheArtCrimes()), child: const Text('Load from storage'))
          ],
        ),
      ),
    );
  }
}
