import 'package:flutter/material.dart';

const Input_field_decor = InputDecoration(
  hintText: 'Deadline',
  labelText: '',
  filled: true,
  fillColor: Colors.greenAccent,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: Colors.grey),
  ),
);
