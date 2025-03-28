import 'package:baby_care/core/helper/get_responsive_font_size.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/custom_time_type.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key, this.onpressed});
  final Function(DateTime time)? onpressed;
  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  final Set<DateTime> workingDays = {
    DateTime(2025, 3, 18),
    DateTime(2025, 3, 19),
    DateTime(2025, 3, 20),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: context.screenHeight * 0.015),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                AppColors.kPrimaryColor.withOpacity(0.2),
                AppColors.kSecondColor.withOpacity(0.2),
              ],
            ),
          ),
          child: TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              
              });
              widget.onpressed!(_selectedDay);
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: AppColors.kPrimaryColor.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, _) {
                bool isWorkingDay = workingDays.any((d) => isSameDay(d, date));
                return Container(
                  alignment: Alignment.center,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Text(
                        '${date.day}',
                        style: TextStyle(
                            color: isSameDay(_selectedDay, date)
                                ? Colors.white
                                : Colors.black,
                            fontSize: getResponsiveFontSize(fontSize: 18)),
                      ),
                      if (isWorkingDay)
                        Positioned(
                          bottom: -context.screenHeight * 0.015,
                          child: Icon(
                            Icons.circle,
                            size: context.screenWidth * 0.02,
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleTextStyle: AppTextStyles.title17Black54Bold,
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black54),
              rightChevronIcon:
                  Icon(Icons.chevron_right, color: Colors.black54),
            ),
          ),
        ),
        Row(
          spacing: context.screenWidth * 0.1,
          children: [
            CustomTimeType(
              color: Colors.grey,
              title: "Selected",
            ),
            CustomTimeType(
              color: Colors.red,
              title: "Not Available",
            ),
          ],
        ),
      ],
    );
  }
}
