import 'package:flutter/material.dart';
import 'package:pocemon_app/core/theme/app_colors.dart';

class CommonSliverAppbar extends StatelessWidget {
  const CommonSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: AppColors.appBarBg,
              borderRadius: BorderRadius.circular(8)),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.appBarIcon,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
