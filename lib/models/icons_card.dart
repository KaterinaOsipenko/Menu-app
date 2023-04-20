import 'package:flutter/material.dart';

enum IconsCard {
  favouriteCard,
  allRecipesCard,
  myRecipesCard,
}

extension IconDataCard on IconsCard {
  IconData get icon {
    switch (this) {
      case IconsCard.allRecipesCard:
        return Icons.receipt_outlined;
      case IconsCard.favouriteCard:
        return Icons.favorite;
      case IconsCard.myRecipesCard:
        return Icons.my_library_books_rounded;
    }
  }
}

extension IconCardDescriprion on IconsCard {
  String get title {
    switch (this) {
      case IconsCard.allRecipesCard:
        return "all recipes";
      case IconsCard.favouriteCard:
        return "favourite";
      case IconsCard.myRecipesCard:
        return "my recipes";
    }
  }
}
