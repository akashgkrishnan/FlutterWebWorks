import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens.dart';
import '../widgets/widgets.dart';
import '../cubits/cubits.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey('homescreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = {
    'home': Icons.home,
    'search': Icons.search,
    'coming soon': Icons.queue_play_next,
    'downloads': Icons.file_download,
    'more': Icons.menu
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 30.0),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.queue_play_next, size: 30.0),
                  label: 'coming soon',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.file_download, size: 30.0),
                  label: 'download',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu, size: 30.0),
                  label: 'more',
                ),
              ],
              currentIndex: _currentIndex,
              selectedItemColor: Colors.white,
              selectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          : null,
    );
  }
}
