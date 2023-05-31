import 'package:flutter/widgets.dart';

class MeasuredWidget extends StatefulWidget {
  final Function(Size? size) onCalculateSize;
  final Widget child;

  const MeasuredWidget({
    Key? key,
    required this.onCalculateSize,
    required this.child,
  }) : super(key: key);

  @override
  MeasuredWidgetState createState() => MeasuredWidgetState();
}

class MeasuredWidgetState extends State<MeasuredWidget> {
  final key = GlobalKey();

  @override
  initState() {
    //calling the getHeight Function after the Layout is Rendered
    WidgetsBinding.instance.addPostFrameCallback((_) => getHeight());

    super.initState();
  }

  void getHeight() {
    final size = key.currentContext?.size;
    widget.onCalculateSize(size);
  }

  @override
  Widget build(BuildContext context) {
    return _MeasuredWidgetContent(
      key: key,
      child: widget.child,
    );
  }
}

class _MeasuredWidgetContent extends StatelessWidget {
  final Widget child;
  const _MeasuredWidgetContent({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
