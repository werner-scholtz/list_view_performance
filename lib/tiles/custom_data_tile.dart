import 'package:flutter/material.dart';
import 'package:list_view_performance/models/data.dart';
// ignore: implementation_imports
import 'package:flutter/src/semantics/semantics.dart';

class CustomDataTile extends LeafRenderObjectWidget {
  const CustomDataTile({
    super.key,
    required this.data,
  });

  final Data data;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomDataRenderObject(data: data);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    CustomDataRenderObject renderObject,
  ) {
    // Update the render object's data.
    renderObject.data = data;
  }
}

class CustomDataRenderObject extends RenderBox {
  CustomDataRenderObject({
    required Data data,
  }) {
    _data = data;
    numberOfItems = data.columns.length;

    // Text painter helper function.
    TextPainter textPainter(String value) {
      return TextPainter(
        text: TextSpan(
          text: value,
          style: const TextStyle(color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
        ellipsis: '.',
        maxLines: 1,
      );
    }

    // Generate the text painters for each field.
    _textPainters = data.columns.map((e) {
      return textPainter(e);
    }).toList();
  }

  late Data _data;
  late int numberOfItems;
  late List<TextPainter> _textPainters;
  final double idWidth = 52;

  /// The width of the field text painters.
  double get fieldTextPainterWidth =>
      (constraints.maxWidth - idWidth) / numberOfItems;

  Data get data => _data;
  set data(Data value) {
    // Guard against unnecessary updates.
    if (_data == value) {
      return;
    }

    // Update the data.
    _data = value;

    // Update the text painter text spans.
    for (var i = 0; i < numberOfItems + 1; i++) {
      _textPainters[i].text = TextSpan(
        text: data.columns[i],
        style: const TextStyle(color: Colors.black),
      );
    }

    // Since the layout has not changed, we don't need to call markNeedsLayout().
    // Mark the render object as needing to repaint.
    markNeedsPaint();
  }

  @override
  void performLayout() {
    // Layout the text painters.
    for (var i = 0; i < _textPainters.length; i++) {
      if (i == 0) {
        // Layout the id text painter, with a fixed width.
        _textPainters[i].layout(maxWidth: idWidth);
      } else {
        // Layout the field text painters.
        _textPainters[i].layout(maxWidth: fieldTextPainterWidth);
      }
    }

    // Use the full width of the constraints.
    final width = constraints.maxWidth;

    // Use the height of the first text painter.
    final height = _textPainters.first.height;

    // Set the size of this render object.
    size = constraints.constrain(
      Size(width, height),
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Loop through the text painters and paint them.
    for (var i = 0; i < _textPainters.length; i++) {
      final textPainter = _textPainters[i];
      if (i == 0) {
        // Paint the id text painter.
        textPainter.paint(context.canvas, offset);
      } else {
        // Calculate the x offset for the field text painter.
        final textPainterX = idWidth + (fieldTextPainterWidth * i);

        /// Calculate the offset for the field text painter.
        final textPainterOffset = Offset(textPainterX, 0) + offset;

        // Paint the field text painters.
        textPainter.paint(context.canvas, textPainterOffset);
      }
    }
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);
  }
}
