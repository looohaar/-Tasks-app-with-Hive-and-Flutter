import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hiveandprovider4/main.dart';
import 'package:hiveandprovider4/models/item_model.dart';

class AddOrUpdate extends StatelessWidget {
  
  int? Key;
  AddOrUpdate( this.Key);
  

 
  @override
  Widget build(BuildContext context) {
    final titleController= TextEditingController();
  final subtitleController= TextEditingController();
  
  if (Key!=null) {
    titleController.text= itemboxvariable.get(Key)!.title; 
    subtitleController.text= itemboxvariable.get(Key)!.subtitle;
    
  }

    return Scaffold(
      appBar: AppBar( centerTitle: true,
        title: Text('Add Your Notes',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Title',
              border: OutlineInputBorder() 
            ),
             ),
              SizedBox(height: 20,),
             TextFormField(
            keyboardType: TextInputType.text,
            controller: subtitleController,
            decoration: InputDecoration(
              hintText: 'Subtitle',
              border: OutlineInputBorder() 
            ),
             ),
              SizedBox(height: 20,),

              ElevatedButton(onPressed: (){
                ItemModel addItem= ItemModel(subtitle: subtitleController.text,
                 title: titleController.text);

                 if (titleController.text.isEmpty|| subtitleController.text.isEmpty== null) {
                  return ;
                   
                 }
                 if (Key== null) {
                  itemboxvariable.add(addItem);
                  
                   
                 }else{
                  itemboxvariable.put(Key, addItem);
                 }
                  Navigator.pop(context);

              },
                child: Key==null? Text('Add'):Text('Update'),
                
              ),

            
              
              

         
        


        ],
      ),
      ),

    );
    
  }
}