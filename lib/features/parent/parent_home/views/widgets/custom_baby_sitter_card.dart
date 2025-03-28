import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/features/parent/parent_home/models/baby_sitter_model.dart';
import 'package:baby_care/features/parent/parent_home/views/widgets/collapsed_card.dart';
import 'package:baby_care/features/parent/parent_home/views/widgets/expanded_card.dart';
import 'package:flutter/material.dart';

class CustomBabySitterCard extends StatelessWidget {
  const CustomBabySitterCard(
      {super.key,
      this.onTap,
      required this.isExpanded,
      required this.babySitterModel});
  final Function()? onTap;
  final bool isExpanded;
  final BabySitterModel babySitterModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.02,
        ),
        width: isExpanded
            ? context.screenWidth * 0.6
            : context.screenWidth * 0.20,
        height: context.screenHeight * 0.22,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32), color: Colors.white),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -20,
              left: isExpanded ? 20 : 9,
              child: Material(
                borderRadius: BorderRadius.circular(32),
                elevation: 15,
                child: CircleAvatar(
                  radius: context.screenWidth * 0.075,
                  backgroundImage: NetworkImage(babySitterModel.image),
                ),
              ),
            ),
            isExpanded
                ? ExpandedCard(
                    babySitterModel: babySitterModel,
                  )
                : CollapsedCard(
                    name: babySitterModel.name,
                  ),
          ],
        ),
      ),
    );
  }
}
