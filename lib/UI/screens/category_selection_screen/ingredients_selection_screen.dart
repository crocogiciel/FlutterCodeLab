import 'package:flutter/material.dart';
import 'package:flutter_codelab/UI/widgets/full_width_button.dart';
import 'package:flutter_codelab/models/user_profile.dart';
import 'category_selection_screen.dart';
import 'package:flutter_codelab/UI/screens/meal_calculation_screen/meal_calculation_screen.dart';

class IngredientsScreen extends StatefulWidget {
  final UserProfile userProfile;

  IngredientsScreen({required this.userProfile});

  @override
  _IngredientsScreenState createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  final Map<String, List<String>> foodCategories = {
    'Légumineuses': [
      'Lentilles',
      'Pois chiches',
      'Haricots rouges',
      'Haricots blancs',
      'Fèves',
      'Petits pois',
      'Lupins',
      'Mung',
      'Soja',
      'Azuki'
    ],
    'Céréales': [
      'Orge',
      'Blé',
      'Riz',
      'Avoine',
      'Seigle',
      'Maïs',
      'Quinoa',
      'Sarrasin',
      'Millet',
      'Amarante'
    ],
    'Légumes': [
      'Courgette',
      'Tomate',
      'Aubergine',
      'Carotte',
      'Brocoli',
      'Épinard',
      'Poivron',
      'Oignon',
      'Chou-fleur',
      'Betterave',
      'Haricot vert',
      'Chou de Bruxelles',
      'Artichaut',
      'Fenouil',
      'Céleri'
    ],
    'Fruits': [
      'Pomme',
      'Banane',
      'Orange',
      'Fraise',
      'Raisin',
      'Pêche',
      'Poire',
      'Mangue',
      'Kiwi',
      'Ananas',
      'Myrtille',
      'Framboise',
      'Cerise',
      'Abricot',
      'Melon'
    ],
    'Viandes': [
      'Poulet',
      'Boeuf',
      'Porc',
      'Agneau',
      'Dinde',
      'Veau',
      'Canard',
      'Bison',
      'Gibier',
      'Saucisse'
    ],
    'Poissons': [
      'Saumon',
      'Thon',
      'Truite',
      'Maquereau',
      'Sardine',
      'Morue',
      'Sole',
      'Bar',
      'Raie',
      'Hareng'
    ],
    'Produits laitiers': [
      'Lait',
      'Yaourt',
      'Fromage',
      'Beurre',
      'Crème',
      'Kéfir',
      'Fromage blanc',
      'Ricotta',
      'Feta',
      'Mascarpone'
    ],
    'Huiles et graisses': [
      'Huile d\'olive',
      'Huile de tournesol',
      'Huile de coco',
      'Beurre',
      'Huile de colza',
      'Huile d\'arachide',
      'Graisse de canard',
      'Huile de sésame',
      'Huile de lin',
      'Lard'
    ],
    'Épices et herbes': [
      'Basilic',
      'Thym',
      'Romarin',
      'Coriandre',
      'Persil',
      'Menthe',
      'Cumin',
      'Paprika',
      'Curcuma',
      'Piment',
      'Cannelle',
      'Clou de girofle',
      'Gingembre',
      'Ail',
      'Oignon en poudre'
    ],
    'Sauces et condiments': [
      'Ketchup',
      'Moutarde',
      'Mayonnaise',
      'Sauce soja',
      'Sauce tomate',
      'Vinaigre balsamique',
      'Sauce barbecue',
      'Sauce vinaigrette',
      'Pesto',
      'Sauce Worcestershire'
    ],
    'Noix et graines': [
      'Amandes',
      'Noix de cajou',
      'Noix',
      'Pistaches',
      'Noisettes',
      'Graines de tournesol',
      'Graines de chia',
      'Graines de lin',
      'Graines de sésame',
      'Noix du Brésil'
    ]
  };

  final Map<String, Set<String>> _selectedItems = {};

  void _navigateToCategorySelection(String category) async {
    final selected = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategorySelectionScreen(
          category: category,
          items: foodCategories[category]!,
          initiallySelected: _selectedItems[category]?.toList() ?? [],
        ),
      ),
    );

    if (selected != null) {
      setState(() {
        _selectedItems[category] = selected.toSet();
      });
    }
  }

  bool _isSelectionComplete() {
    return foodCategories.keys.any((category) =>
    _selectedItems[category] != null &&
        _selectedItems[category]!.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choisissez les ingrédients'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: foodCategories.keys.map((category) {
                  final selectedItems = _selectedItems[category] ?? {};

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => _navigateToCategorySelection(category),
                        child: Container(
                          color: Colors.blue[100],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(category,
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              Icon(Icons.add),
                            ],
                          ),
                        ),
                      ),
                      if (selectedItems.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                          child: Wrap(
                            spacing: 8.0,
                            children: selectedItems.map((item) {
                              return Chip(label: Text(item));
                            }).toList(),
                          ),
                        ),
                      Divider(),
                    ],
                  );
                }).toList(),
              ),
            ),
            if (_isSelectionComplete())
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FullWidthIconButton(
                    text: "Calculer les quantités",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealCalculationScreen(
                            userProfile: widget.userProfile,
                            selectedItems: _selectedItems,
                          ),
                        ),
                      );
                    }
                ),
              ),
          ],
        ),
      ),
    );
  }
}