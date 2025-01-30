import 'package:flutter/material.dart';
import 'package:test_task/src/core/colors.dart';

class CustomPostTile extends StatelessWidget {
  final String title;
  final int id;
  final VoidCallback onTap;
  const CustomPostTile({super.key, required this.title, required this.id, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.grey300,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(title, style: TextStyle(color: AppColors.black, fontSize: 18),),
              Expanded(child: SizedBox()),
              Text('${id}', style: TextStyle(color: AppColors.black, fontSize: 15,))
            ],
          ),
        ),
      ),
    );
  }
}