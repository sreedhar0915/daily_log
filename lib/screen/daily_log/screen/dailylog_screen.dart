import 'package:daily_log/helpers/app_colors.dart';
import 'package:daily_log/helpers/screen_config.dart';
import 'package:daily_log/helpers/size_extensions.dart';
import 'package:daily_log/helpers/sizedbox.dart';
import 'package:daily_log/screen/daily_log/controller/dailylog_controller.dart';
import 'package:daily_log/screen/daily_log/widget/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DailylogScreen extends StatefulWidget {
  const DailylogScreen({super.key});

  @override
  State<DailylogScreen> createState() => _DailylogScreenState();
}

class _DailylogScreenState extends State<DailylogScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DailylogController>();
    ScreenUtil.getInstance().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: AppColors.black,
            )),
        title: Center(
            child: Text(
          "Self Check-In",
          style: GoogleFonts.roboto(
              color: AppColors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi Vineeth",
                style: GoogleFonts.roboto(
                    color: AppColors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              sizedBoxWithHeight(5),
              Text(
                "A gentle invitation to reflect on your day.",
                style: GoogleFonts.roboto(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
              sizedBoxWithHeight(10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Great Vineeth!",
                              style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            sizedBoxWithHeight(5),
                            Text(
                              "Logged 3 days in a row!",
                              style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image.asset(
                          height: 42,
                          width: 42,
                          "assets/images/board.png",
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    sizedBoxWithHeight(15),
                    InkWell(
                      onTap: () {},
                      child: Buttons(
                        height: 48.h,
                        width: double.infinity, //297.w,
                        title: "Set Daily Reminder",
                        titlestyle: GoogleFonts.roboto(
                            color: AppColors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(15),
              Container(
                height: 48.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(82),
                    border: Border.all(color: AppColors.maincolor)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                      child: Row(
                    children: [
                      Text(
                        "Auto Fill Yesterday's Values",
                        style: GoogleFonts.roboto(
                            color: AppColors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.cached,
                        size: 24,
                      )
                    ],
                  )),
                ),
              ),
              sizedBoxWithHeight(20),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How are you feeling today?",
                      style: GoogleFonts.roboto(
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    sizedBoxWithHeight(10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            provider.moods.length,
                            (index) => InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                      height: 32.h,
                                      width: 32.w,
                                      provider.moods[index]),
                                ))),
                    sizedBoxWithHeight(10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          provider.showJournalBox = !provider.showJournalBox;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            "Want to journal?",
                            style: GoogleFonts.roboto(
                                color: AppColors.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Icon(
                            provider.showJournalBox
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    if (provider.showJournalBox)
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Type here",
                            hintStyle: GoogleFonts.roboto(
                                color: AppColors.grey,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    sizedBoxWithHeight(10),
                    Text(
                      "How stressed were you today?",
                      style: GoogleFonts.roboto(
                          color: AppColors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    sizedBoxWithHeight(10),
                    Slider(
                      value: provider.sliderValue,
                      min: 0,
                      max: 4,
                      divisions: 4,
                      activeColor: Colors.green,
                      inactiveColor: Colors.grey[300],
                      onChanged: (value) {
                        setState(() {
                          provider.sliderValue = value;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: provider.stressLevels
                          .map((label) => Text(
                                label,
                                style: GoogleFonts.roboto(
                                    color: AppColors.grey,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                              ))
                          .toList(),
                    ),
                    // Text(
                    //   "Selected: ${stressLevels[sliderValue.round()]}",
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // )
                  ],
                ),
              ),
              sizedBoxWithHeight(15),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Do you smoke?",
                      style: GoogleFonts.roboto(
                          color: AppColors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    sizedBoxWithHeight(10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.isSmoker == true
                                  ? AppColors.maincolor
                                  : AppColors.white,
                              foregroundColor: provider.isSmoker == true
                                  ? AppColors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                            ),
                            onPressed: () {
                              setState(() {
                                provider.isSmoker = true;
                              });
                            },
                            child: Text(
                              "Yes",
                              style: GoogleFonts.roboto(
                                  color: provider.isSmoker == true
                                      ? AppColors.white
                                      : AppColors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const Spacer(),
                        // NO Button
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: provider.isSmoker == false
                                  ? AppColors.maincolor
                                  : AppColors.white,
                              foregroundColor: provider.isSmoker == false
                                  ? AppColors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                            ),
                            onPressed: () {
                              setState(() {
                                provider.isSmoker = false;
                                provider.cigaretteCount = 0;
                              });
                            },
                            child: Text(
                              "No",
                              style: GoogleFonts.roboto(
                                  color: provider.isSmoker == false
                                      ? AppColors.white
                                      : AppColors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(10),
                    // Cigarette row (only if smoker)
                    if (provider.isSmoker == true)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (provider.cigaretteCount > 0)
                                  provider.cigaretteCount--;
                              });
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: AppColors.maincolor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 15,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          sizedBoxWithWidth(5),
                          Container(
                            height: 40.h,
                            width: 47.w,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: AppColors.grey),
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/cigrate_image.png"),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          sizedBoxWithWidth(5),
                          InkWell(
                            onTap: () {
                              setState(() {
                                provider.cigaretteCount++;
                              });
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: AppColors.maincolor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.add,
                                  size: 15, color: AppColors.white),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 38.h,
                            width: 98.w,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '${provider.cigaretteCount}',
                                style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    sizedBoxWithHeight(20),
                    // drink
                    Text(
                      "Did you drink today?",
                      style: GoogleFonts.roboto(
                          color: AppColors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    sizedBoxWithHeight(10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.isDrinker == true
                                  ? AppColors.maincolor
                                  : AppColors.white,
                              foregroundColor: provider.isDrinker == true
                                  ? AppColors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                            ),
                            onPressed: () {
                              setState(() {
                                provider.isDrinker = true;
                              });
                            },
                            child: Text(
                              "Yes",
                              style: GoogleFonts.roboto(
                                  color: provider.isDrinker == true
                                      ? AppColors.white
                                      : AppColors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const Spacer(),
                        // NO Button
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: provider.isDrinker == false
                                  ? AppColors.maincolor
                                  : AppColors.white,
                              foregroundColor: provider.isDrinker == false
                                  ? AppColors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                            ),
                            onPressed: () {
                              setState(() {
                                provider.isDrinker = false;
                                provider.drinkCount = 30;
                              });
                            },
                            child: Text(
                              "No",
                              style: GoogleFonts.roboto(
                                  color: provider.isDrinker == false
                                      ? AppColors.white
                                      : AppColors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(10),
                    // drinking row (only if drinking)
                    if (provider.isDrinker == true)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (provider.drinkCount > 30)
                                  provider.drinkCount -= 30;
                              });
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: AppColors.maincolor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 15,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          sizedBoxWithWidth(5),
                          Container(
                            height: 40.h,
                            width: 74.w,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: AppColors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        height: 24,
                                        width: 24,
                                        "assets/images/beer_image.png",
                                        fit: BoxFit.contain),
                                    Text(
                                      "30ml",
                                      style: GoogleFonts.roboto(
                                          color: AppColors.grey,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          sizedBoxWithWidth(5),
                          InkWell(
                            onTap: () {
                              setState(() {
                                provider.drinkCount += 30;
                              });
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: AppColors.maincolor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.add,
                                  size: 15, color: AppColors.white),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 38.h,
                            width: 98.w,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '${provider.drinkCount}ml',
                                style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    sizedBoxWithHeight(10),
                    Container(
                      height: 64.h,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.lightblue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "No judgment. Just track so you can take control.",
                          maxLines: 2,
                          style: GoogleFonts.roboto(
                              color: AppColors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              sizedBoxWithHeight(20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How was your sleep last night?",
                      style: GoogleFonts.roboto(
                          color: AppColors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Hours Slept (0-12)",
                      style: GoogleFonts.roboto(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    sizedBoxWithHeight(5),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: provider.selectedHours,
                          hint: const Text("Select hours"),
                          items: provider.sleepOptions.map((hour) {
                            return DropdownMenuItem<int>(
                              value: hour,
                              child: Text("$hour hours"),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              provider.selectedHours = value;
                            });
                          },
                        ),
                      ),
                    ),
                    sizedBoxWithHeight(20),
                    Text(
                      "Woke up refreshed?",
                      style: GoogleFonts.roboto(
                          color: AppColors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    sizedBoxWithHeight(8),
                    Row(
                      children: [
                        // Yes button
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.refreshed == true
                                  ? AppColors.maincolor
                                  : AppColors.white,
                              foregroundColor: provider.refreshed == true
                                  ? AppColors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                              elevation: 0,
                            ),
                            onPressed: () {
                              setState(() {
                                provider.refreshed = true;
                              });
                            },
                            child: Text(
                              "Yes",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        sizedBoxWithWidth(20),
                        // No button
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.refreshed == false
                                  ? AppColors.maincolor
                                  : AppColors.white,
                              foregroundColor: provider.refreshed == false
                                  ? AppColors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                              elevation: 0,
                            ),
                            onPressed: () {
                              setState(() {
                                provider.refreshed = false;
                              });
                            },
                            child: Text(
                              "No",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(20),
                    Text(
                      "Late to bed?",
                      style: GoogleFonts.roboto(
                          color: AppColors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    sizedBoxWithHeight(8),
                    Row(
                      children: [
                        // Yes button
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.latebed == true
                                  ? AppColors.maincolor
                                  : AppColors.white,
                              foregroundColor: provider.latebed == true
                                  ? AppColors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                              elevation: 0,
                            ),
                            onPressed: () {
                              setState(() {
                                provider.latebed = true;
                              });
                            },
                            child: Text(
                              "Yes",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        sizedBoxWithWidth(20),
                        // No button
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.latebed == false
                                  ? AppColors.maincolor
                                  : AppColors.white,
                              foregroundColor: provider.latebed == false
                                  ? AppColors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                              elevation: 0,
                            ),
                            onPressed: () {
                              setState(() {
                                provider.latebed = false;
                              });
                            },
                            child: Text(
                              "No",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              sizedBoxWithHeight(20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Did you move today?",
                      style: GoogleFonts.roboto(
                          color: AppColors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Every step matters!",
                      style: GoogleFonts.roboto(
                          color: AppColors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    sizedBoxWithHeight(20),
                    Text(
                      "Walked",
                      style: GoogleFonts.roboto(
                          color: AppColors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    sizedBoxWithHeight(8),
                    Row(
                      children: [
                        // Yes button
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.walks == true
                                  ? AppColors.maincolor
                                  : Colors.white,
                              foregroundColor: provider.walks == true
                                  ? Colors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                              elevation: 0,
                            ),
                            onPressed: () {
                              setState(() {
                                provider.walks = true;
                                provider.showsteps = !provider.showsteps;
                              });
                            },
                            child: Text(
                              "Yes",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        sizedBoxWithWidth(20),
                        // No button
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.walks == false
                                  ? AppColors.maincolor
                                  : AppColors.white,
                              foregroundColor: provider.walks == false
                                  ? AppColors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                              elevation: 0,
                            ),
                            onPressed: () {
                              setState(() {
                                provider.walks = false;
                                provider.showsteps = false;
                              });
                            },
                            child: Text(
                              "No",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(20),
                    //showing stepswalked
                    if (provider.showsteps)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: "steps walked"),
                        ),
                      ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Other activity",
                      style: GoogleFonts.roboto(
                          color: AppColors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    sizedBoxWithHeight(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: provider.activities.map((activity) {
                        final isSelected =
                            provider.selectedActivities.contains(activity);
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (isSelected) {
                                  provider.selectedActivities.remove(activity);
                                } else {
                                  provider.selectedActivities.add(activity);
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSelected
                                  ? AppColors.maincolor
                                  : AppColors.white,
                              foregroundColor: isSelected
                                  ? AppColors.white
                                  : AppColors.maincolor,
                              side: const BorderSide(color: Colors.green),
                            ),
                            child: Text(
                              activity,
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Did you have any cravings today?",
                      style: GoogleFonts.roboto(
                          color: AppColors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    sizedBoxWithHeight(5),
                    Row(
                      children: [
                        // Yes button
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.craving == true
                                  ? AppColors.maincolor
                                  : AppColors.white,
                              foregroundColor: provider.craving == true
                                  ? AppColors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                              elevation: 0,
                            ),
                            onPressed: () {
                              setState(() {
                                provider.craving = true;
                                provider.showitems = !provider.showitems;
                              });
                            },
                            child: Text(
                              "Yes",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        sizedBoxWithWidth(20),
                        // No button
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.craving == false
                                  ? AppColors.maincolor
                                  : AppColors.white,
                              foregroundColor: provider.craving == false
                                  ? AppColors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                              elevation: 0,
                            ),
                            onPressed: () {
                              setState(() {
                                provider.craving = false;
                                provider.showitems = false;
                              });
                            },
                            child: Text(
                              "No",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(20),
                    //showing stepswalked
                    if (provider.showitems)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "What did you crave?",
                            style: GoogleFonts.roboto(
                                color: AppColors.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          sizedBoxWithHeight(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: provider.buttonRows.map((row) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: row.map((label) {
                                    final isSelected =
                                        provider.selectedItems.contains(label);

                                    return Expanded(
                                      flex: row.length == 1
                                          ? 2
                                          : 1, // Full width for "Other"
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              if (isSelected) {
                                                provider.selectedItems
                                                    .remove(label);
                                              } else {
                                                provider.selectedItems
                                                    .add(label);
                                              }
                                            });
                                          },
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: isSelected
                                                ? AppColors.maincolor
                                                : AppColors.white,
                                            foregroundColor: isSelected
                                                ? AppColors.white
                                                : AppColors.maincolor,
                                            side: const BorderSide(
                                                color: AppColors.maincolor),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(29),
                                            ),
                                          ),
                                          child: Text(label),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    Text(
                      "Did you give in?",
                      style: GoogleFonts.roboto(
                          color: AppColors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    sizedBoxWithHeight(10),
                    sizedBoxWithHeight(8),
                    Row(
                      children: [
                        // Yes button
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.givein == true
                                  ? AppColors.maincolor
                                  : Colors.white,
                              foregroundColor: provider.givein == true
                                  ? Colors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                              elevation: 0,
                            ),
                            onPressed: () {
                              setState(() {
                                provider.givein = true;
                                provider.showcaption = !provider.showcaption;
                              });
                            },
                            child: Text(
                              "Yes",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        sizedBoxWithWidth(20),
                        // No button
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.givein == false
                                  ? AppColors.maincolor
                                  : Colors.white,
                              foregroundColor: provider.givein == false
                                  ? Colors.white
                                  : AppColors.maincolor,
                              side:
                                  const BorderSide(color: AppColors.maincolor),
                              elevation: 0,
                            ),
                            onPressed: () {
                              setState(() {
                                provider.givein = false;
                                provider.showcaption = false;
                              });
                            },
                            child: Text(
                              "No",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(20),
                    //showing caption
                    if (provider.showcaption)
                      Container(
                        height: 64.h,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.lightblue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "“It's okay to slip sometimes. We bounce back tomorrow.”",
                            maxLines: 2,
                            style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              sizedBoxWithHeight(20),
              Container(
                height: 64.h,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.lightblue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'AI Insights: ',
                        style: GoogleFonts.roboto(
                            color: AppColors.grey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text:
                            "You've reduced late-night meals 3 days in a row!",
                        style: GoogleFonts.roboto(
                            color: AppColors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )),
              ),
              sizedBoxWithHeight(30),
              InkWell(
                onTap: () {},
                child: Buttons(
                    height: 48,
                    width: double.infinity,
                    title: "Log Today",
                    titlestyle: GoogleFonts.roboto(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400)),
              ),
              sizedBoxWithHeight(10),
              InkWell(
                onTap: () {},
                child: Buttons(
                    height: 48,
                    width: double.infinity,
                    title: "View  My Week",
                    titlestyle: GoogleFonts.roboto(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
