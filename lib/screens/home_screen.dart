import 'package:firstnotesapp/services/notes_helper.dart';
import 'package:flutter/material.dart';
import 'package:firstnotesapp/models/priority.dart';
import 'package:firstnotesapp/screens/note_screen.dart';
import 'package:firstnotesapp/widgets/tab_content.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const _tabs = ['All', 'High', 'Medium', 'Low'];
  final Set<int> _sID = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red[600],
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          dividerColor: Colors.black,
          tabs: _tabs.map((t) => Tab(text: t)).toList(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.white,
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
              emptyMessage: 'No Notes Made Yet',
              priority: Priority.none,
              selectedIDs: _sID,
              onToggle: toggleSelection,
            ),
            TabContent(
              emptyMessage: 'No High Priority Notes',
              priority: Priority.high,
              selectedIDs: _sID,
              onToggle: toggleSelection,
            ),
            TabContent(
              emptyMessage: 'No Medium Priority Notes',
              priority: Priority.medium,
              selectedIDs: _sID,
              onToggle: toggleSelection,
            ),
            TabContent(
              emptyMessage: 'No Low Priority Notes',
              priority: Priority.low,
              selectedIDs: _sID,
              onToggle: toggleSelection,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNoteScreen,
        tooltip: 'Add New Note',
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
