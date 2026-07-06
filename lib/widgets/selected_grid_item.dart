import 'package:firstnotesapp/models/priority.dart';
import 'package:flutter/material.dart';

class SelectedGridItem extends StatelessWidget {
  final Priority priority;
  final String title;

  const SelectedGridItem({
    super.key,
    required this.priority,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: GridTileBar(
        leading: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: priority.color,
            shape: BoxShape.circle,
          ),
        ),
        title: Text(title),
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 45, left: 6, right: 6),
          child: Center(
            child: Icon(Icons.check_box, color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
