import 'package:cartao/data/task_inherited.dart';
import 'package:cartao/screens/create_card_screen.dart';
import 'package:cartao/screens/login_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(onPressed: () {
                Scaffold.of(context).openDrawer();
              }, icon: const Icon(Icons.menu),);
            },
          ),
          title: const Text('FideliApp', textAlign: TextAlign.center,),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white12,
                  ),
                  child: Text('Header')),
              ListTile(
                title: const Text('Sair'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (contextNew) => const LoginScreen(),
                  ));

                },
              )
            ],
          ),
        ),
        body:
        ListView(padding: const EdgeInsets.only(top: 8, bottom: 70),
          children: CardInherited.of(context).cardList,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => CreateCardScreen(cardContext: context,),
              ),
            );
          },
          child: const Icon(Icons.add_card),
        )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    }
    );
  }
}
