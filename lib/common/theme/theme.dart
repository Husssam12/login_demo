import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'const.dart';
import 'typo.dart';

final kButtonPadding = REdgeInsets.all(LayoutConstrains.m1);
final kChipPadding = REdgeInsets.all(LayoutConstrains.s2);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primarySwatch.shade500,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  useMaterial3: true,
  textTheme: textTheme,
  colorScheme: _colorScheme,
  floatingActionButtonTheme: _floatingActionButtonTheme,
  textButtonTheme: _textButtonTheme,
  elevatedButtonTheme: _elevatedButtonTheme,
  outlinedButtonTheme: _outlinedButtonTheme,
  checkboxTheme: _checkboxThemeData,
  chipTheme: _chipTheme,
  appBarTheme: _appBarTheme,
  inputDecorationTheme: _kInputDecoration,
  iconTheme: _kIconTheme,
  dividerTheme: _dividerTheme,
);

final _borderWidth = 1.r;
final _inputBorderRadius = BorderRadius.circular(PRadius.texFiled).r;
final _kInputDecoration = InputDecorationTheme(
  fillColor: AppColors.textFieldFill,
  contentPadding: REdgeInsets.symmetric(vertical: 14, horizontal: 14),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide:
        BorderSide(width: _borderWidth, color: AppColors.textFieldBorder),
    borderRadius: _inputBorderRadius,
  ),
  border: OutlineInputBorder(
    borderSide:
        BorderSide(width: _borderWidth, color: AppColors.textFieldBorder),
    borderRadius: _inputBorderRadius,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
        width: _borderWidth, color: AppColors.primarySwatch.shade500),
    borderRadius: _inputBorderRadius,
  ),
  errorBorder: OutlineInputBorder(
    borderSide:
        BorderSide(width: _borderWidth, color: AppColors.errorSwatch.shade400),
    borderRadius: _inputBorderRadius,
  ),
  disabledBorder: OutlineInputBorder(
    borderSide:
        BorderSide(width: _borderWidth, color: AppColors.textFieldBorder),
    borderRadius: _inputBorderRadius,
  ),
);

final _kIconTheme = IconThemeData(size: 20.r);

final _textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    padding: kButtonPadding,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(PRadius.button.r),
    ),
  ),
);

final _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: kButtonPadding,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(PRadius.button.r),
    ),
  ),
);

final _outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    padding: kButtonPadding,
    side: BorderSide(color: AppColors.primarySwatch.shade400),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(PRadius.button.r),
    ),
  ),
);

final _floatingActionButtonTheme = FloatingActionButtonThemeData(
  backgroundColor: AppColors.primarySwatch.shade500,
  foregroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(PRadius.button.r),
  ),
);

final _colorScheme = ColorScheme.fromSwatch(
  primarySwatch: AppColors.primarySwatch,
  accentColor: AppColors.secondarySwatch.shade400,
);

final _checkboxThemeData = CheckboxThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(PRadius.checkBox.r),
  ),
);

final _chipTheme = ChipThemeData(
  padding: kChipPadding,
  selectedColor: AppColors.primarySwatch.shade100,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(PRadius.chip.r),
  ),
);
final _dividerTheme = DividerThemeData(space: 32.r);

const _appBarTheme = AppBarTheme(
  color: Colors.transparent,
  elevation: 0,
  foregroundColor: Colors.black,
  iconTheme: IconThemeData(color: Colors.black),
);
