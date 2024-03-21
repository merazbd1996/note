import 'package:note_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomPerson extends StatelessWidget {
  const CustomPerson({super.key});

  @override
  Widget build(BuildContext context) {
        final h= MediaQuery.of(context).size.height;
    final w= MediaQuery.of(context).size.width;
    return  Container(
                  width: 40*w/375,
                  height: 40*h/812,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      ImageManager.search,
                      color: Colors.white,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
  }
}