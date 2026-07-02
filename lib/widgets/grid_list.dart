import 'package:firstnotesapp/models/priority.dart';
import 'package:firstnotesapp/screens/details_screen.dart';
import 'package:firstnotesapp/widgets/grid_item.dart';
import 'package:firstnotesapp/widgets/selected_grid_item.dart';
import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final Set<int> selectedIDs;
  final void Function(int, {bool reload}) onToggle;

  const GridList({
    super.key,
    required this.data,
    required this.selectedIDs,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        final int id = item['ID'];
        final String title = item['Title'];
        final String body = item['Body'];
        final bool isSelected = selectedIDs.contains(id);

        final Priority priority = Priority.values.firstWhere(
          (p) => p.label == item['Priority'], 
        );

        return InkWell(
          onTap: isSelected
              ? () => onToggle(id)
              : () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        id: id,
                        title: title,
                        body: body,
                        priority: priority,
                      ),
                    ),
                  );

                  onToggle(id, reload: true);
                },
          onLongPress: () => onToggle(id),
          child: isSelected
              ? SelectedGridItem(priority: priority, title: title)
              : GridItem(priority: priority, title: title, body: body),
        );
      },
    );
  }
}
