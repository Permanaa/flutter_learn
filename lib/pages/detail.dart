import 'package:flutter/material.dart';
import 'package:flutter_learn/models/diet_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.diet});

  final DietModel diet;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(widget.diet.iconPath),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.diet.name,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                '${widget.diet.level} | ${widget.diet.duration} | ${widget.diet.calorie}',
                style: TextStyle(
                    color: Color(0xFF7B6F72),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xFFF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Icons.chevron_left_rounded,
          ),
        ),
      ),
    );
  }
}
