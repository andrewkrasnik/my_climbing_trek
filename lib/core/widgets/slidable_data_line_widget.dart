import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableDataLineWidget extends StatelessWidget {
  final Widget child;
  final Function(BuildContext)? onEdit;
  final Function(BuildContext)? onDelete;
  final bool edit;
  final bool delete;

  const SlidableDataLineWidget({
    required this.child,
    this.onEdit,
    this.onDelete,
    this.delete = true,
    this.edit = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!delete && !edit) {
      return child;
    }
    return Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            if (edit)
              SlidableAction(
                flex: 1,
                onPressed: onEdit,
                backgroundColor: Colors.orange.shade400,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'edit',
              ),
            if (delete)
              SlidableAction(
                flex: 1,
                onPressed: (context) async {
                  final deletePermission = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Подтверждение удаления'),
                      content: const Text('Удалить?'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('Отменить'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('Продолжить'),
                        ),
                      ],
                    ),
                  );

                  if (deletePermission == true) {
                    onDelete!(context);
                  }
                },
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'delete',
              ),
          ],
        ),
        child: child);
  }
}
