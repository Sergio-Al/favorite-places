import 'dart:io';

import 'package:favorite_places_sergio/models/place.dart';
import 'package:favorite_places_sergio/providers/favorite_places_provider.dart';
import 'package:favorite_places_sergio/widgets/image_input.dart';
import 'package:favorite_places_sergio/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  NewPlaceState createState() => NewPlaceState();
}

class NewPlaceState extends ConsumerState<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  File? _selectedImage;

  void _addPlace() {
    if (_selectedImage == null) return;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ref
          .read(favoritePlacesProvider.notifier)
          .addNewPlace(_enteredName, _selectedImage!);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text(
                    'Enter the name',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
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
              const SizedBox(
                height: 16,
              ),
              ImageInput(
                onPickImage: (image) {
                  _selectedImage = image;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              LocationInput(),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: _addPlace,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Icon(Icons.add), Text('Save Data')],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
