import 'package:baby_care/core/app_route/route_names.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/baby_sitter_details.dart';
import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/baby_sitter_details_screen_tab_bar_view.dart';
import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/baby_sitter_image.dart';
import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/custom_column_lable.dart';
import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/sliver_app_bar_delegate.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/book_and_cancel_button.dart';
import 'package:baby_care/features/parent/parent_home/models/baby_sitter_model.dart';
import 'package:baby_care/features/parent/parent_home/views/widgets/custom_parent_home_screen_app_bar.dart';
import 'package:flutter/material.dart';

class BabySitterScreenBody extends StatelessWidget {
  const BabySitterScreenBody({super.key, required this.babySitterModel});
  final BabySitterModel babySitterModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomParentHomeScreenAppBar(),
                          Row(
                            children: [
                              BabySitterImage(
                                image: babySitterModel.image,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05),
                              BabySitterDetails(
                                babySitterName: babySitterModel.name,
                                locationName: babySitterModel.locationName!,
                                salary: babySitterModel.salary,
                              ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.04),
                          CustomColumnLable(
                            lable: "Experience",
                            value: babySitterModel.experiance,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          CustomColumnLable(
                            lable: "Age",
                            value: babySitterModel.age,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      TabBar(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.kPrimaryColor.withOpacity(0.3),
                              AppColors.kSecondColor.withOpacity(0.3),
                            ],
                          ),
                        ),
                        dividerHeight: 0,
                        tabAlignment: TabAlignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: AppTextStyles.title18PrimaryColorW500,
                        unselectedLabelStyle: AppTextStyles.title18Black54,
                        tabs: [
                          Tab(text: "About"),
                          Tab(text: "Photos"),
                          Tab(text: "Location"),
                          Tab(text: "Reviews"),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: Column(
                children: [
                  Expanded(
                      child: BabySitterDetailsTabBarView(
                    aboutMe: babySitterModel.aboutMe,
                    locationName: babySitterModel.locationName!,
                  )),
                ],
              ),
            ),
            BookAndCancelButton(
              onPressed: () {
                context.pushScreen(
                  RouteNames.bookBabySitterScreen,
                  arguments: {
                    "id":babySitterModel.id,
                    "image":babySitterModel.image
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
