// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoes_app_firebase/models/models.dart';

import '../../data/dummy_data.dart';
import '../../theme/custom_app_theme.dart';
import '../../utils/app_methods.dart';
import '../../utils/constants.dart';
import 'Components/app_bar.dart';

class DetailView extends StatefulWidget {
  DetailView(
      {super.key, required this.model, required this.isComeFromMoreSection});
  final ShoeModel model;
  bool isComeFromMoreSection;
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  int? _isSelectedSize;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppConstantsColor.backgroundColor,
      appBar: customAppBarDe(
        context,
      ),
      body: Container(
        color: widget.model.modelColor.withOpacity(0.2),
        height: height * 1.1,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ! Top Products Images and Bg .
              topProductsImagesAndBg(width, height),
              // ! Shoes Details Size and Number  .
              morePicOfProducts(width, height),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Divider(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    productNameAndPrice(),
                    productInfo(width, height),
                    moreDetailsText(width, height),
                    sizeAndCountrySelectedSelection(width, height),
                    bottomSizeSelection(width, height),
                    addToBagButton(width, height)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //end section Sizes And Button Components
  bottomSizeSelection(width, height) {
    return SizedBox(
      width: width,
      height: height / 14,
      child: FadeInDown(
        from: 70,
        delay: const Duration(milliseconds: 3),
        child: Row(
          children: [
            Container(
              width: width / 4.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1)),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Try it",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    RotatedBox(
                        quarterTurns: -1,
                        child: FaIcon(FontAwesomeIcons.shoePrints))
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: width / 1.5,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSelectedSize = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: width / 4.4,
                        height: height / 13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: _isSelectedSize == index
                                  ? Colors.black
                                  : Colors.grey,
                              width: 1.5),
                          color: _isSelectedSize == index
                              ? Colors.black
                              : AppConstantsColor.backgroundColor,
                        ),
                        child: Center(
                          child: Text(
                            sizes[index].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _isSelectedSize == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  //Size Text And Country Button Components
  sizeAndCountrySelectedSelection(width, height) {
    return FadeInDown(
      delay: Duration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Size",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstantsColor.darkTextColor,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: width / 4,
            child: TextButton(
              onPressed: () {
                setState(() {
                  widget.isComeFromMoreSection = false;
                });
              },
              child: Text(
                "UK",
                style: TextStyle(
                  fontWeight: widget.isComeFromMoreSection
                      ? FontWeight.w400
                      : FontWeight.bold,
                  color: widget.isComeFromMoreSection
                      ? Colors.grey
                      : AppConstantsColor.darkTextColor,
                  fontSize: 19,
                ),
              ),
            ),
          ),
          SizedBox(
            width: width / 5,
            child: TextButton(
              onPressed: () {
                setState(() {
                  widget.isComeFromMoreSection = true;
                });
              },
              child: Text(
                "USA",
                style: TextStyle(
                  fontWeight: widget.isComeFromMoreSection
                      ? FontWeight.bold
                      : FontWeight.w400,
                  color: widget.isComeFromMoreSection
                      ? AppConstantsColor.darkTextColor
                      : Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FadeInDown morePicOfProducts(double width, double height) {
    return FadeInDown(
      from: 50,
      delay: const Duration(milliseconds: 3),
      child: SizedBox(
        width: width,
        height: height * 0.10,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  4,
                  (index) => index == 3
                      ? Container(
                          padding: const EdgeInsets.all(2),
                          width: width / 5,
                          height: height / 14,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            image: DecorationImage(
                              image: AssetImage(widget.model.imgAddress),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.grey.withOpacity(1), BlendMode.darken),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.play_circle_fill,
                              color: AppConstantsColor.lightTextColor,
                              size: 30,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: roundedImage(width, height),
                        ))),
        ),
      ),
    );
  }

  SizedBox topProductsImagesAndBg(double width, double height) {
    return SizedBox(
      width: width,
      height: height / 2.2,
      child: Stack(
        children: [
          // ! AweSome Design Pattern .
          Positioned(
            left: 40,
            child: FadeInDown(
              from: 20,
              delay: const Duration(milliseconds: 1),
              child: Container(
                width: width,
                height: height / 2.2,
                decoration: BoxDecoration(
                    color: widget.model.modelColor,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(1500))),
              ),
            ),
          ),
          // ! model Images .
          Positioned(
            top: 110,
            left: 20,
            child: Hero(
              tag: widget.isComeFromMoreSection
                  ? widget.model
                  : widget.model.imgAddress,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-30 / 360),
                child: SizedBox(
                    height: height / 4.3,
                    width: width / 1.3,
                    child: Image.asset(widget.model.imgAddress)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Rounded Image Widget About Below method Components
  Container roundedImage(width, height) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(
        image: AssetImage(widget.model.imgAddress),
      ),
    );
  }

  //MaterialButton Components
  addToBagButton(width, height) {
    return FadeInLeft(
      from: 100,
      delay: const Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minWidth: width / 1.2,
          height: height / 15,
          color: widget.model.modelColor,
          onPressed: () {
            AppMethods.addToCart(widget.model, context);
          },
          child: const Text(
            "ADD TO BAG",
            style: TextStyle(color: AppConstantsColor.lightTextColor),
          ),
        ),
      ),
    );
  }

  //more details Text Components
  moreDetailsText(width, height) {
    return FadeInDown(
      from: 70,
      delay: const Duration(milliseconds: 2),
      child: Container(
        padding: const EdgeInsets.only(right: 280),
        height: height / 50,
        child: const FittedBox(
            child: Text('MORE DETAILS', style: AppThemes.detailsMoreText)),
      ),
    );
  }

  //About Shoe Text Components
  productInfo(width, height) {
    return FadeInDown(
      from: 60,
      delay: const Duration(microseconds: 2),
      child: SizedBox(
        width: width,
        height: height / 9,
        child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt laoreet enim, eget sodales ligula semper at. Sed id aliquet eros, nec vestibulum felis. Nunc maximus aliquet aliquam. Quisque eget sapien at velit cursus tincidunt. Duis tempor lacinia erat eget fermentum.",
            style: AppThemes.detailsProductDescriptions),
      ),
    );
  }

  //Name And Price Text Components
  Widget productNameAndPrice() {
    return FadeInDown(
      delay: const Duration(),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Text(
              widget.model.model,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppConstantsColor.darkTextColor,
              ),
            ),
            Expanded(child: Container()),
            Text('\$${widget.model.price.toStringAsFixed(2)}',
                style: AppThemes.detailsProductPrice),
          ],
        ),
      ),
    );
  }
}
