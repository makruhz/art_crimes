import 'package:art_crimes/features/art_crimes/art_crimes_page.dart';
import 'package:art_crimes/features/art_crimes/bloc/art_crimes_bloc.dart';
import 'package:art_crimes/features/favourites/bloc/favourite_bloc.dart';
import 'package:art_crimes/features/favourites/favourites_page.dart';
import 'package:art_crimes/repositories/art_crimes_local_repository.dart';
import 'package:art_crimes/repositories/art_crimes_remote_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  final pages = [
    const ArtCrimesPage(),
    const FavouritesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ArtCrimesBloc(
                artCrimesLocalRepository: ArtCrimesLocalRepository(),
                artCrimesRemoteRepository: ArtCrimesRemoteRepository())
              ..add(FetchArtCrimes()),
          ),
          BlocProvider(
            create: (_) => FavouriteBloc()..add(StartedFavourite()),
          )
        ],
        child: MaterialApp(
          title: 'Art crimes',
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: pages[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.image),
                  label: 'Arts',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
              ],
            ),
          ),
        ));
  }
}
