import 'package:flutter/foundation.dart';

class ScoreProvider with ChangeNotifier {
  int _teamAScore = 0;
  int _teamBScore = 0;

  // int _teamAAceScore = 0;
  // int _teamAAttackScore = 0;
  // int _teamABlockScore = 0;
  // int _teamAErrorScore = 0;

  int get teamAScore => _teamAScore;
  int get teamBScore => _teamBScore;

  // int get teamAAceScore => _teamAAceScore;
  // int get teamAAttackScore => _teamAAttackScore;
  // int get teamABlockScore => _teamABlockScore;
  // int get teamAErrorScore;

  void incrementTeamAScore() {
    _teamAScore++;
    notifyListeners();
  }

  void incrementTeamBScore() {
    _teamBScore++;
    notifyListeners();
  }
}