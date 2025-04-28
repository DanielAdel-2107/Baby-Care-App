import 'dart:developer';

import 'package:baby_care/core/app_route/route_names.dart';
import 'package:baby_care/core/components/custom_elevated_button.dart';
import 'package:baby_care/core/components/custom_icon_button.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/parent_home/models/baby_sitter_model.dart';
import 'package:flutter/material.dart';

class ExpandedCard extends StatelessWidget {
  const ExpandedCard({super.key, required this.babySitterModel});
  final BabySitterModel babySitterModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.screenHeight * 0.01,
        horizontal: context.screenWidth * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.025,
                  vertical: context.screenHeight * 0.01,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade200,
                ),
                child: Text(
                  "⭐ 4.5",
                  style: AppTextStyles.title16AmberW500,
                ),
              )
            ],
          ),
          Text(
            babySitterModel.name,
            style: AppTextStyles.title18PrimaryColorW500,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
              ),
              Expanded(
                child: Text(
                  babySitterModel.locationName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.title18Black,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "${babySitterModel.salary}\$",
                style: AppTextStyles.title16Black54Bold,
              ),
              Text("/ hr"),
              SizedBox(width: 10),
              Text("|"),
              SizedBox(width: 10),
              Text(
                '${babySitterModel.distance!.toStringAsFixed(4)} ',
                style: AppTextStyles.title16Black54Bold,
              ),
              Text("km"),
            ],
          ),
          SizedBox(height: 5),
          Text(
            babySitterModel.aboutMe,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.title16Black,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                icon: Icons.chat,
                iconColor: Colors.black54,
                onPressed: () {},
                iconSize: context.screenWidth * 0.07,
              ),
              CustomElevatedButton(
                name: "Details",
                onPressed: () {
                  log(babySitterModel.toString());
                  context.pushScreen(RouteNames.babySitterDetailsScreen,
                      arguments: babySitterModel.toJson());
                },
                backgroundColor: Colors.green,
                textStyle: AppTextStyles.title16White500,
              ),
              CustomIconButton(
                icon: Icons.favorite,
                iconColor: Colors.black38,
                onPressed: () {},
                iconSize: context.screenWidth * 0.07,
              ),
            ],
          )
        ],
      ),
    );
  }
}
