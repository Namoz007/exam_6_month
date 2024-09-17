import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget {
  String title;
  double price;
  UpdateUser({super.key,required this.title,required this.price,});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final _formKey = GlobalKey<FormState>();
  final _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _priceController.text = widget.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title,),
      content: Form(
        key: _formKey,
        child: TextFormField(
          validator: (value){
            if(value == null || value.isEmpty){
              return "Please,return input price";
            }
            
            try{
              double.parse(value);
              return null;
            }catch(e){
              return "Price type not number";
            }
          },
          controller: _priceController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      actions: [
        FilledButton(onPressed: (){Navigator.pop(context); }, child: const Text("Cancel"),),
        FilledButton(onPressed: (){
          if(_formKey.currentState!.validate()){
            Navigator.of(context).pop(double.parse(_priceController.text));
          }
        }, child: const Text("Save"),),
      ],
    );
  }
}
