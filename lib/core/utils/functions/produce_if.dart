import 'package:flutter/cupertino.dart';

Widget? ProduceIf({
  required bool condition,
  required Widget Function() builder,
}) => condition ? builder() : null;