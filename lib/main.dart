import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Image.asset('assets/images/code.gif'));
  }
}

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: const Center(
//         child: Column(
//           children: [
//             Text(
//               'Test',
//               style: TextStyle(color: Colors.black),
//             ),
//             Text(
//               'Test',
//               style: TextStyle(color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TestScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text('js');
//   }
// }

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('ListTile Sample')),
      backgroundColor: Color.fromARGB(255, 89, 89, 89),
      body: ListView(
        children: const <Widget>[
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(child: ListTile(title: Text('One-line ListTile'))),

          // Card(
          //   child: ListTile(
          //     leading: FlutterLogo(),
          //     title: Text('One-line with leading widget'),
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     title: Text('One-line with trailing widget'),
          //     trailing: Icon(Icons.more_vert),
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     leading: FlutterLogo(),
          //     title: Text('One-line with both widgets'),
          //     trailing: Icon(Icons.more_vert),
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     title: Text('One-line dense ListTile'),
          //     dense: true,
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     leading: FlutterLogo(size: 56.0),
          //     title: Text('Two-line ListTile'),
          //     subtitle: Text('Here is a second line'),
          //     trailing: Icon(Icons.more_vert),
          //   ),
          // ),
          // Card(
          // child: ListTile(
          //   leading: FlutterLogo(size: 72.0),
          //   title: Text('Three-line ListTile'),
          //   subtitle:
          //       Text('A sufficiently long subtitle warrants three lines.'),
          //   trailing: Icon(Icons.more_vert),
          //   isThreeLine: true,
          // ),
          // ),
        ],
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
        backgroundColor: Color.fromARGB(255, 159, 159, 159),
      ),
      backgroundColor: Color.fromARGB(255, 89, 89, 89),
      body: ListView(
        children: const <Widget>[
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(child: ListTile(title: Text('One-line ListTile'))),

          // Card(
          //   child: ListTile(
          //     leading: FlutterLogo(),
          //     title: Text('One-line with leading widget'),
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     title: Text('One-line with trailing widget'),
          //     trailing: Icon(Icons.more_vert),
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     leading: FlutterLogo(),
          //     title: Text('One-line with both widgets'),
          //     trailing: Icon(Icons.more_vert),
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     title: Text('One-line dense ListTile'),
          //     dense: true,
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     leading: FlutterLogo(size: 56.0),
          //     title: Text('Two-line ListTile'),
          //     subtitle: Text('Here is a second line'),
          //     trailing: Icon(Icons.more_vert),
          //   ),
          // ),
          // Card(
          // child: ListTile(
          //   leading: FlutterLogo(size: 72.0),
          //   title: Text('Three-line ListTile'),
          //   subtitle:
          //       Text('A sufficiently long subtitle warrants three lines.'),
          //   trailing: Icon(Icons.more_vert),
          //   isThreeLine: true,
          // ),
          // ),
        ],
      ),
    );
  }
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Список',
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.commute),
          //   label: 'Commute',
          // ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Избранное',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          // color: Color.fromARGB(255, 53, 53, 53),
          alignment: Alignment.center,
          child: const ListScreen(),
        ),
        Container(
          // color: Color.fromARGB(255, 53, 53, 53),
          alignment: Alignment.center,
          child: const FavoritesScreen(),
        ),
        // Container(
        //   color: Colors.blue,
        //   alignment: Alignment.center,
        //   child: const Text('Page 3'),
        // ),
      ][currentPageIndex],
    );
  }
}
