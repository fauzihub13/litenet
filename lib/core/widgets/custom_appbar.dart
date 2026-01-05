import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/gen/assets.gen.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isLeading;
  final bool isRounded;
  const CustomAppbar({
    super.key,
    required this.title,
    this.isLeading = true,
    this.isRounded = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DefaultColors.purple500,
      elevation: 0,
      centerTitle: true,
      leading: isLeading
          ? IconButton(
              icon: SvgPicture.asset(
                Assets.icons.arrowBack,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            )
          : Container(),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(isRounded ? 30 : 0),
        ),
      ),
      toolbarHeight: 80,
    );
  }

  @override
  // Menentukan tinggi AppBar secara konsisten
  Size get preferredSize => const Size.fromHeight(80);
}
