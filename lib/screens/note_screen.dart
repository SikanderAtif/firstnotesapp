import 'package:firstnotesapp/models/priority.dart';
import 'package:firstnotesapp/services/notes_helper.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  Priority _selectedPriority = Priority.medium;

  void _createNote() async {
    String title = _controller.text.trim();
    String body = _controller2.text.trim();

    await NotesHelperDatabase.insert(title,body,_selectedPriority.label);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'Title',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _controller,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 24),

            Row(
              children: Priority.values.skip(1).map((p) {
                final isSelected = _selectedPriority == p;

                return Padding(
                  padding: EdgeInsets.all(12),
                  child: FilterChip(
                    label: Text(
                      p.label,
                      style: TextStyle(
                        color: isSelected ? p.color : Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    selected: isSelected,
                    onSelected: (_) => setState(() => _selectedPriority = p),
                    selectedColor: Theme.of(context).colorScheme.surface,
                    checkmarkColor: p.color,
                    side: BorderSide(color: isSelected ? p.color : Theme.of(context).colorScheme.onSurface),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 24),
            Text(
              'Description',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _controller2,
              minLines: 10,
              maxLines: 10,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _createNote,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: Text('Create', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
            ),
          ],
        ),
      ),
    );
  }
}
