import 'dart:async';
import 'package:flutter/material.dart';
import 'package:volleyball/database/app_database.dart';

class TeamProvider with ChangeNotifier {
  final AppDatabase _database;
  List<Team> _teams = [];

  TeamProvider(this._database){
    _fetchTeams();
  }

  List<Team> get teams => _teams;

  Future<void> _fetchTeams() async {
    _teams = await _database.getAllTeams();
    notifyListeners();
  }

  Future<void> addTeam(Team team) async {
    if(_teams.length < 6){
      await _database.insertTeam(team);
      _fetchTeams();
    }
  }
}