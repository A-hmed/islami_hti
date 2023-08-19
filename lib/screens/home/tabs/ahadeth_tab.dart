import 'package:flutter/material.dart';
import 'package:islami_hti/app_colors.dart';

import '../../hadeth_details/hadeth_details.dart';
import '../../sura_details/sura_details.dart';

class AhadethTab extends StatelessWidget {
  List<int> ahadethNumbers = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset("assets/hadeth_logo.png")),
        SizedBox(
          height: 8,
        ),
        Divider(
          color: AppColors.primiaryColor,
          thickness: 3,
        ),
        Text(
          "Ahadeth",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: AppColors.accentColor),
        ),
        Divider(
          color: AppColors.primiaryColor,
          thickness: 3,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: ahadethNumbers.length,
              itemBuilder: (context, index) {
                return buildHadethName(context, index);
              }),
        ),
      ],
    );
  }

  Widget buildHadethName(BuildContext context,int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.routeName, arguments: index);
      },
      child: Text(
         " ${index+1} حديث رقم ",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.accentColor,
            fontSize: 25),
      ),
    );
  }
}
