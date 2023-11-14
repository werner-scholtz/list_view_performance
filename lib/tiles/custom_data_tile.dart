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

    TextPainter textPainter(String value) {
      return TextPainter(
        text: TextSpan(
          text: value,
          style: const TextStyle(color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      );
    }

    _textPainter1 = textPainter(_data.field1);
    _textPainter2 = textPainter(_data.field2);
    _textPainter3 = textPainter(_data.field3);
    _textPainter4 = textPainter(_data.field4);
    _textPainter5 = textPainter(_data.field5);
    _textPainter6 = textPainter(_data.field6);
    _textPainter7 = textPainter(_data.field7);
    _textPainter8 = textPainter(_data.field8);
    _textPainter9 = textPainter(_data.field9);
    _textPainter10 = textPainter(_data.field10);
    _textPainter11 = textPainter(_data.field11);
    _textPainter12 = textPainter(_data.field12);
    _textPainter13 = textPainter(_data.field13);
    _textPainter14 = textPainter(_data.field14);
    _textPainter15 = textPainter(_data.field15);
    _textPainter16 = textPainter(_data.field16);
    _textPainter17 = textPainter(_data.field17);
    _textPainter18 = textPainter(_data.field18);
    _textPainter19 = textPainter(_data.field19);
    _textPainter20 = textPainter(_data.field20);
  }

  late Data _data;

  late TextPainter _textPainter1;
  late TextPainter _textPainter2;
  late TextPainter _textPainter3;
  late TextPainter _textPainter4;
  late TextPainter _textPainter5;
  late TextPainter _textPainter6;
  late TextPainter _textPainter7;
  late TextPainter _textPainter8;
  late TextPainter _textPainter9;
  late TextPainter _textPainter10;
  late TextPainter _textPainter11;
  late TextPainter _textPainter12;
  late TextPainter _textPainter13;
  late TextPainter _textPainter14;
  late TextPainter _textPainter15;
  late TextPainter _textPainter16;
  late TextPainter _textPainter17;
  late TextPainter _textPainter18;
  late TextPainter _textPainter19;
  late TextPainter _textPainter20;

  Data get data => _data;
  set data(Data value) {
    if (_data == value) {
      return;
    }

    _data = value;

    textSpan1 = TextSpan(
      text: _data.field1,
    );
    textSpan2 = TextSpan(
      text: _data.field2,
    );
    textSpan3 = TextSpan(
      text: _data.field3,
    );
    textSpan4 = TextSpan(
      text: _data.field4,
    );
    textSpan5 = TextSpan(
      text: _data.field5,
    );
    textSpan6 = TextSpan(
      text: _data.field6,
    );
    textSpan7 = TextSpan(
      text: _data.field7,
    );
    textSpan8 = TextSpan(
      text: _data.field8,
    );
    textSpan9 = TextSpan(
      text: _data.field9,
    );
    textSpan10 = TextSpan(
      text: _data.field10,
    );
    textSpan11 = TextSpan(
      text: _data.field11,
    );
    textSpan12 = TextSpan(
      text: _data.field12,
    );
    textSpan13 = TextSpan(
      text: _data.field13,
    );
    textSpan14 = TextSpan(
      text: _data.field14,
    );
    textSpan15 = TextSpan(
      text: _data.field15,
    );
    textSpan16 = TextSpan(
      text: _data.field16,
    );
    textSpan17 = TextSpan(
      text: _data.field17,
    );
    textSpan18 = TextSpan(
      text: _data.field18,
    );
    textSpan19 = TextSpan(
      text: _data.field19,
    );
    textSpan20 = TextSpan(
      text: _data.field20,
    );

    markNeedsPaint();
  }

  TextSpan get textSpan1 => _textPainter1.text as TextSpan;
  set textSpan1(TextSpan value) {
    if (_textPainter1.text == value) {
      return;
    }

    _textPainter1.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan2 => _textPainter2.text as TextSpan;
  set textSpan2(TextSpan value) {
    if (_textPainter2.text == value) {
      return;
    }

    _textPainter2.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan3 => _textPainter3.text as TextSpan;
  set textSpan3(TextSpan value) {
    if (_textPainter3.text == value) {
      return;
    }

    _textPainter3.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan4 => _textPainter4.text as TextSpan;
  set textSpan4(TextSpan value) {
    if (_textPainter4.text == value) {
      return;
    }

    _textPainter4.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan5 => _textPainter5.text as TextSpan;
  set textSpan5(TextSpan value) {
    if (_textPainter5.text == value) {
      return;
    }

    _textPainter5.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan6 => _textPainter6.text as TextSpan;
  set textSpan6(TextSpan value) {
    if (_textPainter6.text == value) {
      return;
    }

    _textPainter6.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan7 => _textPainter7.text as TextSpan;
  set textSpan7(TextSpan value) {
    if (_textPainter7.text == value) {
      return;
    }

    _textPainter7.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan8 => _textPainter8.text as TextSpan;
  set textSpan8(TextSpan value) {
    if (_textPainter8.text == value) {
      return;
    }

    _textPainter8.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan9 => _textPainter9.text as TextSpan;
  set textSpan9(TextSpan value) {
    if (_textPainter9.text == value) {
      return;
    }

    _textPainter9.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan10 => _textPainter10.text as TextSpan;
  set textSpan10(TextSpan value) {
    if (_textPainter10.text == value) {
      return;
    }

    _textPainter10.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan11 => _textPainter11.text as TextSpan;
  set textSpan11(TextSpan value) {
    if (_textPainter11.text == value) {
      return;
    }

    _textPainter11.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan12 => _textPainter12.text as TextSpan;
  set textSpan12(TextSpan value) {
    if (_textPainter12.text == value) {
      return;
    }

    _textPainter12.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan13 => _textPainter13.text as TextSpan;
  set textSpan13(TextSpan value) {
    if (_textPainter13.text == value) {
      return;
    }

    _textPainter13.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan14 => _textPainter14.text as TextSpan;
  set textSpan14(TextSpan value) {
    if (_textPainter14.text == value) {
      return;
    }

    _textPainter14.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan15 => _textPainter15.text as TextSpan;
  set textSpan15(TextSpan value) {
    if (_textPainter15.text == value) {
      return;
    }

    _textPainter15.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan16 => _textPainter16.text as TextSpan;
  set textSpan16(TextSpan value) {
    if (_textPainter16.text == value) {
      return;
    }

    _textPainter16.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan17 => _textPainter17.text as TextSpan;
  set textSpan17(TextSpan value) {
    if (_textPainter17.text == value) {
      return;
    }

    _textPainter17.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan18 => _textPainter18.text as TextSpan;
  set textSpan18(TextSpan value) {
    if (_textPainter18.text == value) {
      return;
    }

    _textPainter18.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan19 => _textPainter19.text as TextSpan;
  set textSpan19(TextSpan value) {
    if (_textPainter19.text == value) {
      return;
    }

    _textPainter19.text = value;
    markNeedsLayout();
  }

  TextSpan get textSpan20 => _textPainter20.text as TextSpan;
  set textSpan20(TextSpan value) {
    if (_textPainter20.text == value) {
      return;
    }

    _textPainter20.text = value;
    markNeedsLayout();
  }

  @override
  bool get needsCompositing => false;

  @override
  void performLayout() {
    final textMaxWidth = constraints.maxWidth / 20;
    _textPainter1.layout(maxWidth: constraints.maxWidth);
    _textPainter2.layout(maxWidth: textMaxWidth);
    _textPainter3.layout(maxWidth: textMaxWidth);
    _textPainter4.layout(maxWidth: textMaxWidth);
    _textPainter5.layout(maxWidth: textMaxWidth);
    _textPainter6.layout(maxWidth: textMaxWidth);
    _textPainter7.layout(maxWidth: textMaxWidth);
    _textPainter8.layout(maxWidth: textMaxWidth);
    _textPainter9.layout(maxWidth: textMaxWidth);
    _textPainter10.layout(maxWidth: textMaxWidth);
    _textPainter11.layout(maxWidth: textMaxWidth);
    _textPainter12.layout(maxWidth: textMaxWidth);
    _textPainter13.layout(maxWidth: textMaxWidth);
    _textPainter14.layout(maxWidth: textMaxWidth);
    _textPainter15.layout(maxWidth: textMaxWidth);
    _textPainter16.layout(maxWidth: textMaxWidth);
    _textPainter17.layout(maxWidth: textMaxWidth);
    _textPainter18.layout(maxWidth: textMaxWidth);
    _textPainter19.layout(maxWidth: textMaxWidth);
    _textPainter20.layout(maxWidth: textMaxWidth);

    size = constraints.constrain(
      Size(
        constraints.maxWidth,
        _textPainter1.height,
      ),
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final textMaxWidth = constraints.maxWidth / 20;
    _textPainter1.paint(context.canvas, offset);
    _textPainter2.paint(context.canvas, offset + Offset(textMaxWidth, 0));
    _textPainter3.paint(context.canvas, offset + Offset(textMaxWidth * 2, 0));
    _textPainter4.paint(context.canvas, offset + Offset(textMaxWidth * 3, 0));
    _textPainter5.paint(context.canvas, offset + Offset(textMaxWidth * 4, 0));
    _textPainter6.paint(context.canvas, offset + Offset(textMaxWidth * 5, 0));
    _textPainter7.paint(context.canvas, offset + Offset(textMaxWidth * 6, 0));
    _textPainter8.paint(context.canvas, offset + Offset(textMaxWidth * 7, 0));
    _textPainter9.paint(context.canvas, offset + Offset(textMaxWidth * 8, 0));
    _textPainter10.paint(context.canvas, offset + Offset(textMaxWidth * 9, 0));
    _textPainter11.paint(context.canvas, offset + Offset(textMaxWidth * 10, 0));
    _textPainter12.paint(context.canvas, offset + Offset(textMaxWidth * 11, 0));
    _textPainter13.paint(context.canvas, offset + Offset(textMaxWidth * 12, 0));
    _textPainter14.paint(context.canvas, offset + Offset(textMaxWidth * 13, 0));
    _textPainter15.paint(context.canvas, offset + Offset(textMaxWidth * 14, 0));
    _textPainter16.paint(context.canvas, offset + Offset(textMaxWidth * 15, 0));
    _textPainter17.paint(context.canvas, offset + Offset(textMaxWidth * 16, 0));
    _textPainter18.paint(context.canvas, offset + Offset(textMaxWidth * 17, 0));
    _textPainter19.paint(context.canvas, offset + Offset(textMaxWidth * 18, 0));
    _textPainter20.paint(context.canvas, offset + Offset(textMaxWidth * 19, 0));
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);
  }
}
