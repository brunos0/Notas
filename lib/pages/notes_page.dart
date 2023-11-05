import 'package:flutter/material.dart';
import 'package:provaflutter/utils/curved_clipper.dart';

class NotesPage extends StatelessWidget {
  final List listNotes = [];

  NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(27, 78, 98, 1),
                  Color.fromRGBO(47, 146, 138, 1),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            //
            Center( child:
                 ClipPath(
              clipper: CurveClipper(),
              child: Container(
                color: Colors.red,
                height: 200.0,
              ),
            )
                  /*
                    ListView.builder(
                        itemCount: 0,
                        itemBuilder: (BuildContext ctx, int index) {
                          return ListTile(title: Text(listNotes[index]));
                        }))
                    */
                  ,
                ),
                */

                ),
          ],
        ),
      ),
    );
  }
}
