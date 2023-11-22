import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app_firebase/data/dummy_data.dart';
import 'package:shoes_app_firebase/theme/custom_app_theme.dart';
import 'package:shoes_app_firebase/utils/constants.dart';
import 'package:shoes_app_firebase/view/Bag/Components/empty_state.dart';

import '../../../models/models.dart';
import '../../../utils/app_methods.dart';

class BagView extends StatefulWidget {
  const BagView({super.key});

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  int lengthOfItemOnBag = itemsOnBag.length;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              bagAppBar(height, width),
              itemsOnBag.isEmpty
                  ? const EmptyState()
                  : mainListView(width, height),
              const SizedBox(
                height: 10,
              ),
              bottomInfo(width, height),
            ],
          ),
        ));
  }

  SizedBox bagAppBar(double height, double width) {
    return SizedBox(
        height: height * 0.1,
        width: width,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: width,
              height: height / 14,
              child: FadeInDown(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("My Bag", style: AppThemes.bagTitle),
                    Text(
                      "Total $lengthOfItemOnBag Item",
                      style: AppThemes.bagTotalPrice,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  // Main ListView Components
  mainListView(width, height) {
    return SizedBox(
      width: width,
      height: height / 1.6,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          itemCount: itemsOnBag.length,
          itemBuilder: (BuildContext context, int index) {
            ShoeModel currentBagItem = itemsOnBag[index];

            return FadeInDown(
              delay: const Duration(microseconds: 6),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 1),
                width: width,
                height: height / 5.2,
                child: Row(
                  children: [
                    SizedBox(
                      width: width / 2.5,
                      height: height / 5.7,
                      child: Stack(children: [
                        Positioned(
                          top: 20,
                          left: 10,
                          child: Container(
                            width: width / 3.6,
                            height: height / 7.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey[350],
                            ),
                          ),
                        ),
                        Positioned(
                            right: 2,
                            bottom: 15,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(-40 / 360),
                              child: SizedBox(
                                width: 110,
                                height: 110,
                                child: Image(
                                  image: AssetImage(
                                    currentBagItem.imgAddress,
                                  ),
                                ),
                              ),
                            ))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(currentBagItem.model,
                              style: AppThemes.bagProductModel),
                          const SizedBox(
                            height: 4,
                          ),
                          Text("\$${currentBagItem.price}",
                              style: AppThemes.bagProductPrice),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    itemsOnBag.remove(currentBagItem);
                                    lengthOfItemOnBag = itemsOnBag.length;
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300],
                                  ),
                                  child: const Center(
                                      child: Icon(
                                    Icons.remove,
                                    size: 15,
                                  )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("1",
                                  style: AppThemes.bagProductNumOfShoe),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300],
                                  ),
                                  child: const Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 15,
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  // Material Button Components
  materialButton(width, height) {
    return FadeInDown(
      delay: const Duration(milliseconds: 3),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minWidth: width / 1.2,
        height: height / 15,
        color: AppConstantsColor.materialButtonColor,
        onPressed: () {},
        child: const Text(
          "NEXT",
          style: TextStyle(color: AppConstantsColor.lightTextColor),
        ),
      ),
    );
  }

  bottomInfo(width, height) {
    return Container(
      margin: EdgeInsets.only(top: 0.0),
      width: width,
      child: Column(
        children: [
          FadeInDown(
            delay: const Duration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("TOTAL", style: AppThemes.bagTotalPrice),
                Text("\$${AppMethods.sumOfItemsOnBag()}",
                    style: AppThemes.bagSumOfItemOnBag),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          materialButton(width, height)
        ],
      ),
    );
  }
}
