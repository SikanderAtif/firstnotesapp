import 'package:firstnotesapp/widgets/grid_list.dart';
import 'package:flutter/material.dart';
import 'package:firstnotesapp/services/notes_helper.dart';
import 'package:firstnotesapp/models/priority.dart';
import 'package:sqflite/sqflite.dart';
import 'empty_state.dart';

class TabContent extends StatelessWidget {
  final Priority priority;
  final String emptyMessage;
  final Set<int> selectedIDs;
  final void Function(int, {bool reload}) onToggle;

  const TabContent({
    super.key,
    required this.priority,
    required this.emptyMessage,
    required this.selectedIDs,
    required this.onToggle,
  });

  Future<List<Map<String, dynamic>>> _checkData() async {
    Database db = await NotesHelperDatabase.database;
    if (priority == Priority.none) {
      return await db.query('Notes');
    } else {
      return await db.query(
        'Notes',
        where: 'Priority = ?',
        whereArgs: [priority.label],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _checkData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Center(child: Text('Error Retrieving Data'));
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

        final gridData = snapshot.data!;
        if (gridData.isEmpty) return EmptyState(emptyMessage: emptyMessage);

        return GridList(
          data: gridData,
          selectedIDs: selectedIDs,
          onToggle: onToggle,
        );
      },
    );
  }
}
