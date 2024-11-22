import 'package:flutter/cupertino.dart';

import '../size-config/size_config.dart';

extension Space on num {
  SizedBox get sh => SizedBox(
    height: getHeight(toDouble()),
  );
  SizedBox get sw => SizedBox(
    width: getWidth(toDouble()),
  );
}