import 'package:favorite_places_sergio/models/place.dart';
import 'package:favorite_places_sergio/providers/favorite_places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({Key? key}) : super(key: key);

  @override
  NewPlaceState createState() => NewPlaceState();
}

class NewPlaceState extends ConsumerState<NewPlace> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';

  void _addPlace() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newPlace = Place(name: _enteredName);
      ref.read(favoritePlacesProvider.notifier).addNewPlace(newPlace);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Enter the name'),
                ),
                validator: (value) => value == null ||
                        value.isEmpty ||
                        value.trim().length == 1 ||
                        value.trim().length > 50
                    ? 'Must be a valid name'
                    : null,
                onSaved: (newValue) {
                  _enteredName = newValue!;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _addPlace,
                    child: Text('Save Data'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
