import 'package:firstnotesapp/models/priority.dart';
import 'package:firstnotesapp/services/notes_helper.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String title;
  final String body;
  final Priority priority;

  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.body,
    required this.priority,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  late Priority _selectedPriority;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.title;
    _controller2.text = widget.body;
    _selectedPriority = widget.priority;
  }

  void _updateNote() async {
    String title = _controller.text.trim();
    String body = _controller2.text.trim();

    await NotesHelperDatabase.update(widget.id, title, body, _selectedPriority.label);
    Navigator.pop(context);
  }

  void _deleteNote() async {
    await NotesHelperDatabase.delete(widget.id);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _controller2.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('New Note'),
        backgroundColor: Colors.red[600],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _deleteNote,
            icon: Icon(Icons.delete),
            color: Colors.white,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'Title',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _controller,
              style: TextStyle(color: Colors.white),
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
                        color: isSelected ? p.color : Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.black,
                    selected: isSelected,
                    onSelected: (_) => setState(() => _selectedPriority = p),
                    selectedColor: Colors.black,
                    checkmarkColor: p.color,
                    side: BorderSide(color: isSelected ? p.color : Colors.grey),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 24),
            Text(
              'Description',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _controller2,
              minLines: 10,
              maxLines: 10,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _updateNote,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600],
                foregroundColor: Colors.white,
              ),
              child: Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
