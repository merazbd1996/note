import 'package:note_app/global_widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class CustomField extends StatefulWidget {
  final String title;
  final String hintText;
  final String? errorText;
  final bool? isRequired;
  final Widget? suffixIcon;

  const CustomField({
    super.key,
    required this.title,
    required this.hintText,
    this.isRequired,
    this.suffixIcon,
    this.errorText,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool isError = false;
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            headingSmall(
              context: context,
              data: widget.title,
              color: Theme.of(context).colorScheme.surface.withOpacity(.7),
            ),
            if (widget.isRequired == true) ...[
              const SizedBox(
                width: 5,
              ),
              headingSmall(
                context: context,
                data: '*',
                color: Colors.red,
              ),
            ]
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: widget.isRequired == true
              ? (String? value) {
                  if (value!.isEmpty) {
                    setState(() {
                      isError = true;
                    });
                    return;
                  } else {
                    setState(() {
                      isError = false;
                    });
                    return;
                  }
                }
              : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.surface.withOpacity(.5),
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surface.withOpacity(.2),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            suffixIcon: widget.suffixIcon,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if (widget.isRequired == true) ...[
          if (isError) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFEEFEF),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info, color: Colors.red,),
                  const SizedBox(
                    width: 5,
                  ),
                  headingSmall(
                    context: context,
                    data: widget.errorText ?? 'field_required_validation'.tr,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ]
        ],

      ],
    );
  }
}
