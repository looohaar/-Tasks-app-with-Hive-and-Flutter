import 'package:flutter/material.dart';
import 'package:hiveandprovider4/models/item_model.dart';
import 'package:hiveandprovider4/pages/homepage.dart';
// ignore: unnecessary_import
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box<ItemModel> itemboxvariable;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ItemModelAdapter());
 itemboxvariable= await Hive.openBox<ItemModel>('itembox'); 

  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override 
  Widget build (BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,

        ),
    home: HomePage(),

        

  );
}

  }


  