import 'package:firstnotesapp/l10n/app_localizations.dart';
import 'package:firstnotesapp/services/notes_helper.dart';
import 'package:flutter/material.dart';
import 'package:firstnotesapp/models/priority.dart';
import 'package:firstnotesapp/screens/note_screen.dart';
import 'package:firstnotesapp/widgets/tab_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Set<int> _sID = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _openNoteScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NoteScreen()),
    );

    setState(() {
      _sID.clear();
    });
  }

void toggleSelection(int id, {bool reload = false}) {
    setState(() {
      if(reload) return;
      if (_sID.contains(id)) {
        _sID.remove(id);
      } else {
        _sID.add(id);
      }
    });
  }

  void _deleteNotes() async {
    for (var item in _sID) {
      await NotesHelperDatabase.delete(item);
    }

    setState(() {
      _sID.clear();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [AppLocalizations.of(context)!.allTabTitle, AppLocalizations.of(context)!.highTabTitle, AppLocalizations.of(context)!.mediumTabTitle, AppLocalizations.of(context)!.lowTabTitle];
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homeTitle),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).colorScheme.onPrimary,
          unselectedLabelColor: Theme.of(context).colorScheme.surface,
          labelColor: Theme.of(context).colorScheme.onPrimary,
          dividerColor: Theme.of(context).colorScheme.surface,
          tabs: tabs.map((t) => Tab(text: t)).toList(),
        ),
        actions: [
          _sID.isEmpty ? SizedBox(width: 0) : IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: _deleteNotes,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: TabBarView(
          controller: _tabController,
          children: [
            TabContent(
              emptyMessage: AppLocalizations.of(context)!.allEmptyMessage,
              priority: Priority.none,
              selectedIDs: _sID,
              onToggle: toggleSelection,
            ),
            TabContent(
              emptyMessage: AppLocalizations.of(context)!.highEmptyMessage,
              priority: Priority.high,
              selectedIDs: _sID,
              onToggle: toggleSelection,
            ),
            TabContent(
              emptyMessage: AppLocalizations.of(context)!.mediumEmptyMessage,
              priority: Priority.medium,
              selectedIDs: _sID,
              onToggle: toggleSelection,
            ),
            TabContent(
              emptyMessage: AppLocalizations.of(context)!.lowEmptyMessage,
              priority: Priority.low,
              selectedIDs: _sID,
              onToggle: toggleSelection,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNoteScreen,
        tooltip: AppLocalizations.of(context)!.fabToolTip,
        child: Icon(Icons.add),
      ),
    );
  }
}
