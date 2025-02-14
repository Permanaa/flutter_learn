import 'package:flutter/material.dart';
import 'package:flutter_learn/models/category_model.dart';
import 'package:flutter_learn/models/diet_model.dart';
import 'package:flutter_learn/models/popular_model.dart';
import 'package:flutter_learn/pages/detail.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: ListView(
        children: [
          searchField(),
          SizedBox(
            height: 25,
          ),
          categorySection(),
          SizedBox(
            height: 20,
          ),
          dietSection(),
          SizedBox(
            height: 20,
          ),
          popularDietSection(),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Column popularDietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            "Popular",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        ListView.separated(
            itemCount: popularDiets.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 12, right: 12),
            separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
            itemBuilder: (context, index) {
              return Container(
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF1D1617).withAlpha(14),
                          offset: Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(popularDiets[index].iconPath),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popularDiets[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text(
                          '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}',
                          style: TextStyle(
                              color: Color(0xFF7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/button.svg',
                        width: 30,
                        height: 30,
                      ),
                    )
                  ],
                ),
              );
            })
      ],
    );
  }

  Column dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            "Recommendation\nfor Diet",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.separated(
              itemCount: diets.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 12, right: 12),
              separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
              itemBuilder: (context, index) {
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                      color: diets[index].boxColor.withAlpha(30),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diets[index].iconPath),
                      Column(
                        children: [
                          Text(
                            diets[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          Text(
                            '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                            style: TextStyle(
                                color: Color(0xFF7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    diet: diets[index],
                                  )));
                        },
                        child: Container(
                          height: 45,
                          width: 130,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFF9DCEFF),
                                Color(0xFF92A3FD)
                              ]),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              'View',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Column categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            "Category",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 12, right: 12),
              separatorBuilder: (context, index) => SizedBox(
                    width: 12,
                  ),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: categories[index].boxColor.withAlpha(30),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Container searchField() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 12, right: 12),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xFF1D1617).withAlpha(20),
            blurRadius: 20,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search Pancakes",
            hintStyle: TextStyle(fontSize: 14, color: Color(0xFFDDDADA)),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black38,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 2),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Breakfast',
        style: TextStyle(
            color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            width: 37,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFFF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        )
      ],
    );
  }
}
