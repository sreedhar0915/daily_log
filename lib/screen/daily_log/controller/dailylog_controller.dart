import 'package:flutter/material.dart';

class DailylogController with ChangeNotifier {
  bool showJournalBox = false;

  // Mood tracking
  List<String> moods = [
    "assets/images/laugh_face.png",
    "assets/images/winking_face.png",
    "assets/images/sad2_face.png",
    "assets/images/sad1_face.png",
    "assets/images/crying_face.png",
    "assets/images/sleeping_face.png"
  ];

  // Stress level tracking
  double sliderValue = 0.0;
  List<String> stressLevels = ["None", "Low", "Medium", "High", "Extreme"];

  // Smoking section
  bool? isSmoker;
  int cigaretteCount = 0;

  // Drinking section
  bool? isDrinker;
  int drinkCount = 30;

  // Sleep section
  int? selectedHours;
  List<int> sleepOptions = List.generate(13, (index) => index); // 0-12 hours
  bool? refreshed;
  bool? latebed;

  bool? walks;
  bool showsteps = false;
  List<String> activities = ["Yoga", "Workout", "cycle"];
  List<String> selectedActivities = [];
  bool? craving;
  bool showitems = false;
  bool? givein;
  bool showcaption = false;
  List<List<String>> buttonRows = [
    ["Sugar", "Fried"],
    ["Alcohol", "Smoking"],
    ["Other"]
  ];
  List<String> selectedItems = [];
}
