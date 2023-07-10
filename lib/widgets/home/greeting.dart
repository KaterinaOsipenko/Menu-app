import 'package:flutter/material.dart';
import 'package:menu_app/utils/constants.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.02),
      child: RichText(
        text: TextSpan(
          text: helloMsg,
          style: Theme.of(context).textTheme.bodyLarge,
          children: [
            TextSpan(
              text: friendMsg,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const TextSpan(
              text: chooseOrCreateCategoryMsg,
            ),
          ],
        ),
      ),
    );
  }
}
