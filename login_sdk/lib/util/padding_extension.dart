import 'package:flutter/cupertino.dart';

///eg：200.px
extension IntFix on int {
  SizedBox get paddingHeight {
    return SizedBox(height: toDouble());
  }

  SizedBox get paddingWidth {
    return SizedBox(width: toDouble());
  }
}

///eg：200.0.px
extension DobuleFix on double {
  SizedBox get paddingHeight {
    return SizedBox(height: this);
  }

  SizedBox get paddingWidth {
    return SizedBox(width: this);
  }
}
