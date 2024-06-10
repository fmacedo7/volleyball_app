import 'package:flutter/material.dart';
import 'package:volleyball/utils/score_services.dart';

class ScoreProvider with ChangeNotifier {
  final ScoreService _scoreService = ScoreService();

  int _teamAScore = 0;
  int _teamBScore = 0;
  String _winner = '';

  ScoreProvider() {
    _loadScores();
  }

  int get teamAScore => _teamAScore;
  int get teamBScore => _teamBScore;
  String get winner => _winner;

  Future<void> _loadScores() async {
    _teamAScore = await _scoreService.getScore('A');
    _teamBScore = await _scoreService.getScore('B');
    notifyListeners();
  }

  void incrementTeamAScore() {
    _teamAScore++;
    _checkWinner();
    _scoreService.saveScore('A', _teamAScore);
    notifyListeners();
  }

  void incrementTeamBScore() {
    _teamBScore++;
    _checkWinner();
    _scoreService.saveScore('B', _teamBScore);
    notifyListeners();
  }

  void _checkWinner() {
    if ((_teamAScore >= 25 && _teamAScore >= _teamBScore + 2) || (_teamBScore >= 25 && _teamBScore >= _teamAScore + 2)) {
      _winner = _teamAScore > _teamBScore ? 'Team A' : 'Team B';
    }
  }

  void resetScores() {
    _teamAScore = 0;
    _teamBScore = 0;
    _winner = '';
    _scoreService.resetScores();
    notifyListeners();
  }
}
