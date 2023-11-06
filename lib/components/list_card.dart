import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final List<String> notes;
  final int index;
  final Function(int) edit;
  final Future<void> Function(int, BuildContext) remove;

  const ListCard(this.notes, this.index, this.edit, this.remove, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          notes[index],
          style: const TextStyle(
            fontFamily: 'Dalle_bold',
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Wrap(
          children: [
            IconButton(
                onPressed: edit(index),
                icon: const Icon(
                  Icons.border_color,
                  color: Colors.black,
                  size: 40,
                )),
            IconButton(
                onPressed: () {
                  remove(index, context);
                },
                icon: const Icon(
                  Icons.cancel,
                  color: Color.fromRGBO(204, 52, 56, 1),
                  size: 40,
                )),
          ],
        ),
      ),
    );
  }
}
