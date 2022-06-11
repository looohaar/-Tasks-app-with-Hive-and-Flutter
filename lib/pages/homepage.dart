import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hiveandprovider4/main.dart';
import 'package:hiveandprovider4/pages/addorupdate.dart';

import '../models/item_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    itemboxvariable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: itemboxvariable.listenable(),
        builder: (BuildContext context, Box<ItemModel> dbItems, Widget? _) {
          List<int> keys = itemboxvariable.keys.cast<int>().toList();
          return itemboxvariable.isEmpty
              ? Center(
                  child: const Text(
                  'No Items Yet',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ))
              : ListView.builder(
                  itemCount: dbItems.length,
                  itemBuilder: (context, index) {
                    int key = keys[index];
                    ItemModel? items = itemboxvariable.get(key);
                    return Card(
                      child: ListTile(
                          title: Text(items!.title),
                          subtitle: Text(items.subtitle),
                          trailing: IconButton(
                              onPressed: () {
                                itemboxvariable.delete(key);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddOrUpdate(  key,)));
                          }),
                    );
                  });
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddOrUpdate(null)));
          }),
    );
  }
}
