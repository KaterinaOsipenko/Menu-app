import 'package:flutter/material.dart';

import 'package:menu_app/models/meal.dart';
import 'package:menu_app/screens/meal_item_detail_screen.dart';
import 'package:menu_app/widgets/meals/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemWidget extends StatelessWidget {
  final Meal meal;
  const MealItemWidget({super.key, required this.meal});

  void onSelected(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealItemDetailScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(
        vertical: mediaQuery.size.height * 0.01,
        horizontal: mediaQuery.size.width * 0.01,
      ),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
          onTap: () => onSelected(context),
          child: Stack(
            children: [
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: meal.imageUrl,
                fit: BoxFit.cover,
                height: mediaQuery.size.height / 4,
                width: double.infinity,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 7,
                          ),
                          MealItemTrait(
                              icon: Icons.work, label: meal.complexity.name),
                          const SizedBox(
                            width: 7,
                          ),
                          MealItemTrait(
                              icon: Icons.attach_money_outlined,
                              label: meal.affordability.name),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
