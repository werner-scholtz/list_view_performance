import 'package:flutter/material.dart';

@immutable
class Data {
  const Data({
    required this.id,
    required this.numberOfFields,
  });

  final int id;
  final int numberOfFields;

  String field(int index) => '${index + 1}';
}
