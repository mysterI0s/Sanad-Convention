import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/constants/app_strings.dart';

class DataBank {
  static const List<Map<String, String>> categories = [
    {'name': 'All'},
    {'name': 'Frozen Foods'},
    {'name': 'Dehydrated Meal'},
    {'name': 'Space Snacks'},
    {'name': 'Vacuum Packed'},
  ];

  static const List<Map<String, String>> specialGifts = [
    {
      'name': 'Rocket Ship',
      'imagePath': AppImages.spaceship1,
      'price': '15.99',
    },
    {
      'name': 'Space Ship',
      'imagePath': AppImages.spaceship2,
      'price': '12.49',
    },
    {
      'name': 'Asteroid Belt',
      'imagePath': AppImages.spaceship3,
      'price': '18.75',
    },
  ];

  static List<Map<String, String>> seeAllMeals = [
    {
      'name': 'Planet Tasta',
      'shop': 'Burger Shop',
      'description': 'Avocado, corn, pepperjack,\ncrispy shallots, romaine',
      'imagePath': AppImages.meal1,
      'calories': '320',
      'price': '13.99',
    },
    {
      'name': 'Planets Cubes',
      'shop': 'Zoho',
      'description': 'Avocado Mars, Corn Venus,\nSaturn’s crispy shallots',
      'imagePath': AppImages.meal2,
      'calories': '450',
      'price': '16.49',
    },
    {
      'name': 'Galaxy Choco',
      'shop': 'Choco Planet',
      'description': 'Choco, stardust, mars flavor,\nJupiter flavor',
      'imagePath': AppImages.meal3,
      'calories': '275',
      'price': '9.99',
    },
  ];

  static List<Map<String, String>> notifications = [
    {
      'title': AppStrings.reminderTitle1,
      'description': AppStrings.reminderDesc1,
    },
    {
      'title': AppStrings.newOfferTitle2,
      'description': AppStrings.newOfferDesc2,
    },
    {
      'title': AppStrings.reminderTitle3,
      'description': AppStrings.reminderDesc3,
    },
    {
      'title': AppStrings.newMealTitle4,
      'description': AppStrings.newMealDesc4,
    },
    {
      'title': AppStrings.newOfferTitle5,
      'description': AppStrings.newOfferDesc5,
    },
    {
      'title': AppStrings.recommendationTitle6,
      'description': AppStrings.recommendationDesc6,
    },
  ];

  static Map<String, List<String>> foodChipsCategories = {
    'Protein': [
      'Meat',
      'Chicken',
      'Egg',
      'Tuna',
      'Hummus',
      'Fava beans',
      'Fish',
      'Salmon',
      'Yogurt',
      'Lentils',
      'Shrimp'
    ],
    'Carbs': ['Rice', 'Oatmeal', 'Potato', 'Pasta'],
    'Fat': [
      'Olives',
      'Almonds',
      'Cheese',
      'Coconut',
      'Chia seeds',
      'Olive oils',
      'Flax seeds'
    ],
    'Vegetables': [
      'Beans',
      'Onions',
      'Pepper',
      'Spinach',
      'Broccoli',
      'Zucchini',
      'Tomatoes',
      'Mint',
      'Lettuce',
      'Peas',
      'Eggplant'
    ],
  };
}
