import 'package:shared_preferences/shared_preferences.dart';

class ScoreService {
  static const String teamAScoreKey = 'teamAScore';
  static const String teamBScoreKey = 'teamBScore';

  Future<void> saveScore(String team, int score) async {
    final prefs = await SharedPreferences.getInstance();
    if (team == 'A') {
      await prefs.setInt(teamAScoreKey, score);
    } else {
      await prefs.setInt(teamBScoreKey, score);
    }
  }

  Future<int> getScore(String team) async {
    final prefs = await SharedPreferences.getInstance();
    if (team == 'A') {
      return prefs.getInt(teamAScoreKey) ?? 0;
    } else {
      return prefs.getInt(teamBScoreKey) ?? 0;
    }
  }

  Future<void> resetScores() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(teamAScoreKey, 0);
    await prefs.setInt(teamBScoreKey, 0);
  }
}
