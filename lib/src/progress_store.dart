import 'package:shared_preferences/shared_preferences.dart';

class ProgressStore {
  ProgressStore(this._prefs);
  final SharedPreferences _prefs;

  int get completedLessons => _prefs.getInt('completed_lessons') ?? 0;
  int get correctAnswers => _prefs.getInt('correct_answers') ?? 0;
  int get attempts => _prefs.getInt('attempts') ?? 0;

  Future<void> completeLesson() async {
    await _prefs.setInt('completed_lessons', completedLessons + 1);
  }

  Future<void> recordAnswer(bool correct) async {
    await _prefs.setInt('attempts', attempts + 1);
    if (correct) {
      await _prefs.setInt('correct_answers', correctAnswers + 1);
    }
  }
}
