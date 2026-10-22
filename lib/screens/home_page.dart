import 'package:flutter/material.dart';

const _menusDuJour = <_MenuDuJour>[
  _MenuDuJour(
    id: 1,
    titre: 'Petit déjeuner',
    description: 'Lait, céréales et fruits',
    icone: '🥣',
  ),
  _MenuDuJour(
    id: 2,
    titre: 'Déjeuner',
    description: 'Poulet, riz et légumes',
    icone: '🍲',
  ),
  _MenuDuJour(
    id: 3,
    titre: 'Goûter',
    description: 'Biscuit et compote de pomme',
    icone: '🍪',
  ),
  _MenuDuJour(
    id: 4,
    titre: 'Jus de fruits',
    description: "Jus d'orange naturel",
    icone: '🍊',
  ),
  _MenuDuJour(
    id: 5,
    titre: 'Fruits frais',
    description: 'Une sélection de fruits de saison',
    icone: '🍎',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        actions: [
          IconButton(
            tooltip: 'Recherche',
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFFFFF3E0)),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Ma Garderie',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Accueil'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.restaurant_menu),
                title: const Text('Menus'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('À propos'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menus du jour',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: _menusDuJour.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final menu = _menusDuJour[index];
                  return Card(
                    key: ValueKey(menu.id),
                    color: const Color(0xFFFFF8EF),
                    child: ListTile(
                      leading: Text(
                        menu.icone,
                        style: const TextStyle(fontSize: 28),
                      ),
                      title: Text(menu.titre),
                      subtitle: Text(menu.description),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Ajouter un menu',
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _MenuDuJour {
  const _MenuDuJour({
    required this.id,
    required this.titre,
    required this.description,
    required this.icone,
  });

  final int id;
  final String titre;
  final String description;
  final String icone;
}
