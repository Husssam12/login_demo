import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends AppBar implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    String? title,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
  }) : super(
          key: key,
          title: title != null ? Text(title) : null,
          elevation: 0,
          leadingWidth: 55.w,
          toolbarHeight: 50.h,
          bottom: bottom,
          actions: actions,
        );

  @override
  Size get preferredSize => Size.fromHeight(bottom != null ? 100.h : 50.h);
}
