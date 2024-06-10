import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volleyball/database/app_database.dart';
import 'package:volleyball/utils/team_provider.dart';

class NewTeam extends StatefulWidget {
  final VoidCallback? onPressed;
  const NewTeam({super.key, this.onPressed});

  @override
  State<NewTeam> createState() => _NewTeamState();
}

class _NewTeamState extends State<NewTeam> {
  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _numberOfPlayersController = TextEditingController();

  @override
  void dispose() {
    _teamNameController.dispose();
    _numberOfPlayersController.dispose();
    super.dispose();
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limit Reached'),
        content: const Text('You can not add more than 6 teams'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _teamNameController,
                      decoration: const InputDecoration(
                        hintText: 'Team Name',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _numberOfPlayersController,
                      decoration: const InputDecoration(
                        hintText: 'Number of Players',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        final String name = _teamNameController.text;
                        final int? numberOfPlayers = int.tryParse(_numberOfPlayersController.text);

                        if (name.isNotEmpty && numberOfPlayers != null) {
                          final newTeam = TeamsCompanion(
                            name: drift.Value(name),
                            numberOfPlayers: drift.Value(numberOfPlayers),
                          );

                          Provider.of<TeamProvider>(context, listen: false).addTeam(newTeam);

                          Navigator.pop(context);
                        } else {
                          _showErrorDialog(context);
                        }
                      },
                      color: Colors.blue[800],
                      child: const Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
