import 'package:flutter/material.dart';
import 'package:menu_app/models/meal.dart';
import 'package:menu_app/utils/constants.dart';
import 'package:menu_app/widgets/meals/meal_details_trait.dart';
import 'package:menu_app/widgets/meals/meal_image.dart';
import 'package:menu_app/widgets/meals/meal_ingridients.dart';
import 'package:menu_app/widgets/meals/meal_item_trait.dart';
import 'package:menu_app/widgets/meals/meal_steps.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemDetailScreen extends StatefulWidget {
  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;
  const MealItemDetailScreen(
      {super.key, required this.meal, required this.onToggleFavourite});

  @override
  State<MealItemDetailScreen> createState() => _MealItemDetailScreenState();
}

class _MealItemDetailScreenState extends State<MealItemDetailScreen> {
  void onToggleFav() {
    setState(() {
      widget.meal.isFavourite
          ? widget.meal.isFavourite = false
          : widget.meal.isFavourite = true;
    });
    widget.onToggleFavourite(widget.meal);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: Theme.of(context).iconTheme,
        actions: [
          IconButton(
            onPressed: onToggleFav,
            icon: widget.meal.isFavourite
                ? Icon(
                    Icons.star,
                    color: Theme.of(context).colorScheme.background,
                  )
                : Icon(
                    Icons.star_border_outlined,
                    color: Theme.of(context).colorScheme.background,
                  ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: <Widget>[
                    MealImage(meal: widget.meal),
                    SizedBox(
                      // height: mediaQuerySize.height * 0.6,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        margin:
                            EdgeInsets.only(top: mediaQuerySize.height * 0.35),
                        decoration: BoxDecoration(
                          // boxShadow: const [
                          //   BoxShadow(
                          //     color: Colors.black54,
                          //     blurRadius: 15,
                          //     spreadRadius: 10,
                          //     offset: Offset(0, -15),
                          //   )
                          // ],
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Container(
                          width: mediaQuerySize.width,
                          margin: EdgeInsets.only(
                            top: mediaQuerySize.height * 0.04,
                            left: mediaQuerySize.width * 0.05,
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  widget.meal.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                  top: mediaQuerySize.height * 0.02,
                                ),
                                child: MealDetailsTrait(meal: widget.meal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                MealIngridients(meal: widget.meal),
                MealSteps(meal: widget.meal),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
