import 'package:art_crimes/bloc/art_crimes/art_crimes_bloc.dart';
import 'package:art_crimes/bloc/favourite/favourite_bloc.dart';
import 'package:art_crimes/config/themes.dart';
import 'package:art_crimes/repositories/art_crimes_local_repository.dart';
import 'package:art_crimes/repositories/art_crimes_remote_repository.dart';
import 'package:art_crimes/screens/favourite_screen.dart';
import 'package:art_crimes/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  final screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const FavouriteScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Art crimes',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ArtCrimesBloc(artCrimesLocalRepository: ArtCrimesLocalRepository(), artCrimesRemoteRepository: ArtCrimesRemoteRepository())
                  ..add(FetchArtCrimes()),
          ),
          BlocProvider(
            create: (_) => FavouriteBloc()..add(StartedFavourite()),
          )
        ],
        child: Scaffold(
          body: screens[_selectedIndex],
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
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
