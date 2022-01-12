import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/categories/categories_view.dart';

class AppbarView extends StatelessWidget {
  const AppbarView({
    Key? key,
    required this.cart,
 
    required this.search,
    
  }) : super(key: key);
  final Function cart, search;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.3,
      backgroundColor: kcWhite,
      title: AppBarTitle(
        search: () => search(),
        
      ),
      actions: [
        IconButton(
            iconSize: 32,
            padding: const EdgeInsets.only(right: 15),
            splashRadius: 20,
            onPressed: () => cart(),
            icon: const Icon(
             Icons.shopping_bag_rounded,
              color: kcIconDark,
            ))
      ],
      bottom:  PreferredSize(
        preferredSize: Size.fromHeight(screenHeightPercentage(context, percentage: 0.09)),
        child:  const CategoriesView(),
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key, required this.search})
      : super(key: key);
  final Function search;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => search(),
      child: Container(
        height: screenHeightPercentage(context, percentage: 0.06),
        decoration: BoxDecoration(
            color: kcIconLight, borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Container(
              padding: const EdgeInsets.all(8),
              
              child: const Icon(Icons.search, size: 25, color: kcIcon,),
            ),
                  AutoSizeText(
                    "search",
                    style: ktsSmallBodyText.copyWith(
                        color: kcIcon, fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
