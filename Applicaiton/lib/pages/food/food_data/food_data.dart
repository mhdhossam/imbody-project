class FoodData {
  static const List<Map<String, dynamic>> meal = [
    {
      "name": "Breakfast",
      "image": "assets/images/breakfast_image.jpg",
      "title": " Meal plan",
      "subtitle": "recommended",
      "items": [
        {
          "ItemName": "Eggs",
          "ItemQuantity": "2",
          "ItemDescription": "15G protein and 10G fat"
        },
        {
          "ItemName": "Milk",
          "ItemQuantity": "3 cups",
          "ItemDescription": "With milk"
        },
      ]
    },
    {
      "name": "Snack",
      "image": "assets/images/snacks_image.png",
      "title": " Meal plan",
      "subtitle": "recommended",
      "items": [
        {
          "ItemName": "Eggs",
          "ItemQuantity": "2",
          "ItemDescription": "With milk"
        },
        {
          "ItemName": "Milk",
          "ItemQuantity": "3 cups",
          "ItemDescription": "With milk"
        },
      ]
    },
    {
      "name": "Lunch",
      "image": "assets/images/launch_image.png",
      "title": "Meal plan",
      "subtitle": "recommended",
      "items": [
        {
          "ItemName": "Eggs",
          "ItemQuantity": "2",
          "ItemDescription": "With milk"
        },
        {
          "ItemName": "Milk",
          "ItemQuantity": "3 cups",
          "ItemDescription": "With milk"
        },
      ]
    },
    {
      "name": "Dinner",
      "image": "assets/images/dinner_image.jpg",
      "title": " Meal plan",
      "subtitle": "recommended",
      "items": [
        {
          "ItemName": "Eggs",
          "ItemQuantity": "2",
          "ItemDescription": "With milk"
        },
        {
          "ItemName": "Milk",
          "ItemQuantity": "3 cups",
          "ItemDescription": "With milk"
        },
      ]
    }
  ];
  getDataMeal() {
    return meal;
  }
}
