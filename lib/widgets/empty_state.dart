import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String _emptyMessage;

  const EmptyState({super.key, required this._emptyMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_emptyMessage, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
    );
  }
}
