import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoes_app_firebase/data/dummy_data.dart';
import 'package:shoes_app_firebase/models/models.dart';
import 'package:shoes_app_firebase/utils/constants.dart';
import 'package:shoes_app_firebase/view/Details/detail_view.dart';
import '../../theme/custom_app_theme.dart';
import 'Components/home_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeature = 1;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppConstantsColor.backgroundColor,
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          _categoryMethod(height, width),
          SizedBox(
            height: height * 0.02,
          ),
          mainShoesListView(width, height),
          moreTextAndIcon(),
          bottomSideCategory(width, height),
        ],
      ),
    ));
  }

  // Last Categories Widget Components
  bottomSideCategory(width, height) {
    return SizedBox(
      width: width,
      height: height / 4,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: availableShoes.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            ShoeModel model = availableShoes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => DetailView(
                      model: model,
                      isComeFromMoreSection: true,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: width / 2,
                height: height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      child: FadeInDown(
                        from: 50,
                        delay: const Duration(milliseconds: 6),
                        child: Container(
                          width: width / 13,
                          height: height / 10,
                          color: Colors.red,
                          child: const RotatedBox(
                              quarterTurns: -1,
                              child: Center(
                                  child: Text("NEW",
                                      style: AppThemes.homeGridNewText))),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      child: FadeInDown(
                        from: 10,
                        delay: const Duration(milliseconds: 2),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: AppConstantsColor.darkTextColor,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 26,
                      left: 25,
                      child: FadeInDown(
                        from: 50,
                        delay: const Duration(milliseconds: 6),
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(-15 / 360),
                          child: SizedBox(
                            width: width / 3,
                            height: height / 9,
                            child: Hero(
                              tag: model.model,
                              child: Image(
                                image: AssetImage(model.imgAddress),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 124,
                      left: 45,
                      child: SizedBox(
                        width: width / 4,
                        height: height / 42,
                        child: FittedBox(
                          child: FadeInRight(
                            from: 10,
                            delay: const Duration(milliseconds: 2),
                            child: Text("${model.name} ${model.model}",
                                style: AppThemes.homeGridNameAndModel),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 145,
                      left: 45,
                      child: SizedBox(
                        width: width / 4,
                        height: height / 42,
                        child: FittedBox(
                          child: FadeInLeft(
                            from: 20,
                            delay: const Duration(milliseconds: 3),
                            child: Text("\$${model.price.toStringAsFixed(2)}",
                                style: AppThemes.homeGridPrice),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  // More Text and Next open page Icon .
  Padding moreTextAndIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("More", style: AppThemes.homeMoreText),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(CupertinoIcons.arrow_right, size: 27),
          )
        ],
      ),
    );
  }

  //  main shoes List View
  Row mainShoesListView(double width, double height) {
    return Row(
      children: [
        //!  Side Menu .
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.05),
          height: height / 2.5,
          width: width / 10,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: featured.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        selectedIndexOfFeature = index;
                      });
                    },
                    child: Center(
                      child: Text(
                        featured[index],
                        style: TextStyle(
                            fontSize: selectedIndexOfFeature == index ? 21 : 18,
                            color: selectedIndexOfFeature == index
                                ? AppConstantsColor.darkTextColor
                                : AppConstantsColor.unSelectedTextColor,
                            fontWeight: selectedIndexOfFeature == index
                                ? FontWeight.bold
                                : FontWeight.w600),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        // ! List of Shoes .
        SizedBox(
          height: height * 0.4,
          width: width * 0.8,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: availableShoes.length,
            itemBuilder: (context, index) {
              ShoeModel model = availableShoes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => DetailView(
                        model: model,
                        isComeFromMoreSection: false,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 0.005, vertical: height * 0.01),
                  width: width / 1.5,
                  child: Stack(
                    children: [
                      Container(
                        width: width / 1.81,
                        decoration: BoxDecoration(
                            color: model.modelColor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Positioned(
                        left: 10,
                        child: FadeInDown(
                          from: 30,
                          delay: const Duration(microseconds: 1),
                          child: Row(
                            children: [
                              Text(model.name,
                                  style: AppThemes.homeProductName),
                              SizedBox(width: width * 0.3),
                              IconButton(
                                  onPressed: () {},
                                  icon: const FaIcon(
                                    Icons.favorite_border,
                                    size: 27,
                                    color: AppConstantsColor.lightTextColor,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      //  ! model Text .
                      Positioned(
                        top: 35,
                        left: 10,
                        child: FadeInDown(
                          from: 10,
                          delay: const Duration(microseconds: 2),
                          child: Text(
                            model.model,
                            style: AppThemes.homeProductModel,
                          ),
                        ),
                      ),
                      // ! Price Text .
                      Positioned(
                        top: 70,
                        left: 10,
                        child: FadeInDown(
                          from: 5,
                          delay: const Duration(microseconds: 2),
                          child: Text(
                            model.price.toStringAsFixed(2),
                            style: AppThemes.homeProductPrice,
                          ),
                        ),
                      ),

                      // ! model Image .

                      Positioned(
                        top: 60,
                        right: 20,
                        child: FadeInDown(
                          from: 60,
                          delay: const Duration(microseconds: 6),
                          child: Hero(
                            tag: model.imgAddress,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(-30 / 360),
                              child: SizedBox(
                                  height: 210,
                                  width: 230,
                                  child: Image(
                                    image: AssetImage(
                                      model.imgAddress,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      // ! Next page Open Icon
                      Positioned(
                        top: 230,
                        left: 150,
                        child: FadeInDown(
                            from: 5,
                            delay: const Duration(microseconds: 2),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const FaIcon(
                                      CupertinoIcons.arrow_right_circle_fill,
                                      color: Colors.white,
                                      size: 27)),
                            )),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  // you can put this method inside components folders later it .
  Row _categoryMethod(double height, double width) {
    return Row(
      children: [
        SizedBox(
          height: height * 0.04,
          width: width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      selectedIndexOfCategory = index;
                    });
                  },
                  child: Center(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                          fontSize: selectedIndexOfCategory == index ? 21 : 18,
                          color: selectedIndexOfCategory == index
                              ? AppConstantsColor.darkTextColor
                              : AppConstantsColor.unSelectedTextColor,
                          fontWeight: selectedIndexOfCategory == index
                              ? FontWeight.bold
                              : FontWeight.w600),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
