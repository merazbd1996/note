import 'package:note_app/global_widgets/custom_text_widget.dart';
import 'package:note_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool? isSoft;
  final bool? isBorder;
  final void Function()? onTap;

  const CustomButton({
    super.key,
    required this.title,
    this.isSoft,
    this.isBorder,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width * .9,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          border: isBorder == true
              ? Border.all(
                  color: AppColors.primary,
                  width: 2.5,
                )
              : null,
          gradient: isSoft == true || isBorder == true
              ? null
              : const LinearGradient(
                  colors: [
                    AppColors.secondary,
                    AppColors.primary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          color: isSoft == true ? AppColors.primary.withOpacity(.5) : null,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: headingMedium(
            context: context,
            data: title,
            color: isSoft == true
                ? Colors.white.withOpacity(.5)
                : isBorder == true
                    ? AppColors.primary
                    : Colors.white,
          ),
        ),
      ),
    );
  }
}
