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
    renderObject.data = data;
  }
}

class CustomDataRenderObject extends RenderBox {
  CustomDataRenderObject({
    required Data data,
  }) {
    _data = data;
    numberOfItems = data.numberOfFields;

    TextPainter textPainter(String value) {
      return TextPainter(
        text: TextSpan(
          text: value,
          style: const TextStyle(color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      );
    }

    // Generate the text painters for each field.
    _textPainters = [
      textPainter('${data.id}'),
      for (var i = 0; i < numberOfItems; i++) textPainter(data.field(i))
    ];
  }

  late Data _data;
  late int numberOfItems;
  late List<TextPainter> _textPainters;

  Data get data => _data;
  set data(Data value) {
    if (_data == value) {
      return;
    }
    _data = value;

    // Update the number of items.
    for (var i = 0; i < numberOfItems + 1; i++) {
      _textPainters[i].text = TextSpan(
        text: i == 0 ? '${data.id}' : data.field(i - 1),
        style: const TextStyle(color: Colors.black),
      );
    }

    // Since the layout has not changed, we don't need to call markNeedsLayout().
    // Mark the render object as needing to repaint.
    markNeedsPaint();
  }

  @override
  bool get needsCompositing => false;

  @override
  void performLayout() {
    final textMaxWidth = constraints.maxWidth / (numberOfItems + 1);

    for (var textPainter in _textPainters) {
      textPainter.layout(maxWidth: textMaxWidth);
    }

    size = constraints.constrain(
      Size(
        constraints.maxWidth,
        _textPainters.first.height,
      ),
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final textMaxWidth = constraints.maxWidth / (numberOfItems + 1);
    for (var i = 0; i < _textPainters.length; i++) {
      final textPainter = _textPainters[i];
      textPainter.paint(context.canvas, offset + Offset(textMaxWidth * i, 0));
    }
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);
  }
}
