import 'package:flutter/material.dart';
import 'package:islami_hti/app_colors.dart';
import 'package:islami_hti/providers/app_provider.dart';
import 'package:islami_hti/screens/home/tabs/ahadeth_tab.dart';
import 'package:islami_hti/screens/home/tabs/quran.dart';
import 'package:islami_hti/screens/home/tabs/radio_tab.dart';
import 'package:islami_hti/screens/home/tabs/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_hti/screens/home/tabs/settings_tab.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  static const String routeName = "home" ;
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image:
         AssetImage(provider.isDarkThemeEnabled ? "assets/dark_bg.png": "assets/home_bg.png"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.islami,),
        ),
        body: tabs[selectedTabIndex],
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: provider.isDarkThemeEnabled ? AppColors.primiaryDarkColor: AppColors.primiaryColor
          ),
          child: BottomNavigationBar(
            onTap: (index){
              selectedTabIndex = index;
              setState(() {});
            },
            currentIndex: selectedTabIndex,
            items: [
              BottomNavigationBarItem(icon: const ImageIcon(
                AssetImage("assets/ic__quran.png")
              ), label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(icon: const ImageIcon(
                  AssetImage("assets/ic_ahadeth.png")
              ),label: AppLocalizations.of(context)!.ahadeth),
              BottomNavigationBarItem(icon: const ImageIcon(
                  AssetImage("assets/ic_sebha.png")
              ), label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(icon: const ImageIcon(
                  AssetImage("assets/ic_radio.png")
              ), label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
            ],
          ),
        ),
      ),
    );
  }
}
