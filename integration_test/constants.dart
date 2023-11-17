import 'package:flutter/material.dart';
import 'package:list_view_performance/models/data.dart';

/// The number of items to generate for the integration test.
const numberOfItems = 100000;

/// The number of fields to generate for each item.
const numberOfFields = 36;

final List<Data> items = List.generate(
  numberOfItems,
  (index) => Data(
    id: index,
    numberOfFields: numberOfFields,
  ),
);

/// The key used to identify the first item in the list view.
const firstItemKey = ValueKey(0);

/// The key used to identify the last item in the list view.
const lastItemKey = ValueKey(99999);

/// The delta used by the [scrollUntilVisible] function.
const delta = 100000.0;
