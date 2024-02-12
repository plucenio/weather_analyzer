import '../../lib.dart';

extension NumExtension on num {
  double get toResponsiveHeight {
    return DM.get<IAdaptativeSizer>().toResponsiveHeight(this);
  }

  double get toResponsiveWidth {
    return DM.get<IAdaptativeSizer>().toResponsiveWidth(this);
  }
}
