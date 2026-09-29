import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';

import '../../../core/theme/app_colors.dart';

class CategoryCardItem extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  const CategoryCardItem({super.key ,required this.index , required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  Container(
      width:  double.infinity,
      height: 195,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage(categoryModel.imagePath),
          fit: BoxFit.cover,
        ),

      ),
      child: Directionality(
        textDirection:  index % 2 == 0 ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(categoryModel.name,

                style: theme.textTheme.headlineSmall!.copyWith(color: Colors.white ,fontSize: 35,fontWeight: FontWeight.w700)),
            Container(
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white54,

                borderRadius: BorderRadius.circular(84),
              ),
              child :Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back_ios_rounded, size: 30,color: AppColors.mainText,),
                  ),
                  Text(" View All" ,
                    style: theme.textTheme.headlineSmall,)

                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}