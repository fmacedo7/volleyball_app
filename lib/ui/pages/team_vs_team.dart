import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:volleyball/theme/colors.dart';
import 'package:volleyball/ui/pages/game_zone.dart';
import 'package:volleyball/utils/team_provider.dart';

class TeamVsTeam extends StatefulWidget {
  const TeamVsTeam({super.key});

  @override
  State<TeamVsTeam> createState() => _TeamVsTeamState();
}

class _TeamVsTeamState extends State<TeamVsTeam> {
  String? _selectedTeamOne;
  String? _selectedTeamTwo;

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Obtendo a lista de times do provider
    final teams = Provider.of<TeamProvider>(context).teams;

    return Scaffold(
      backgroundColor: backgroundScreenColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              height: screenHeight * 0.7,
              width: screenWidth * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <DropdownButton>[
                            DropdownButton<String>(
                              value: _selectedTeamOne,
                              hint: const Text('Team One'),
                              items: teams.where((teams) => teams.name != _selectedTeamTwo).map(
                                (team) {
                                  return DropdownMenuItem<String>(
                                    value: team.name,
                                    child: Text(team.name),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                setState(
                                  () {
                                    _selectedTeamOne = value;
                                    if (_selectedTeamTwo == value){
                                      _selectedTeamTwo = null;
                                    }
                                  },
                                );
                              },
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        OutlinedButton(
                          onPressed: () {
                            if (_selectedTeamOne != null &&
                                _selectedTeamTwo != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameZone(
                                    teamOneName: _selectedTeamOne!,
                                    teamTwoName: _selectedTeamTwo!,
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Match Game',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 48),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <DropdownButton>[
                              DropdownButton<String>(
                                value: _selectedTeamTwo,
                                hint: const Text('Team Two'),
                                items: teams.where((teams) => teams.name != _selectedTeamOne).map(
                                  (team) {
                                    return DropdownMenuItem<String>(
                                      value: team.name,
                                      child: Text(team.name),
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) {
                                  setState(
                                    () {
                                      _selectedTeamTwo = value;
                                    },
                                  );
                                },
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
