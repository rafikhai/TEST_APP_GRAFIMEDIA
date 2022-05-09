import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:grafimedia/boxes.dart';
import 'package:grafimedia/models/shop.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  _LibraryViewState createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Shop>(HiveBoxes.shop).listenable(),
        builder: (context, Box<Shop> box, _) {
          if (box.values.isEmpty) {
            return Center(
              child: Text('Library is Empty'),
            );
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              Shop? res = box.getAt(index);
              return Dismissible(
                background: Container(
                  color: Colors.red,
                ),
                key: UniqueKey(),
                onDismissed: (direction) {
                  res!.delete();
                },
                child: ListTile(
                  title: Text(res!.title),
                  subtitle: Text(res.authors),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Borrow',
        child: Icon(Icons.book),
        onPressed: () => {},
      ),
    );
  }
}
