import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shop/Constants/Colors.dart';
import 'package:furniture_shop/Widgets/AppBarButton.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Gallery/Gallery_armchair.dart';
import '../../../Gallery/Gallery_bed.dart';
import '../../../Gallery/Gallery_chair.dart';
import '../../../Gallery/Gallery_lamp.dart';
import '../../../Gallery/Gallery_popular.dart';
import '../../../Gallery/Gallery_table.dart';
import 'SearchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: const TabBarView(
          children: [
            GalleryPopular(),
            GalleryChair(),
            GalleryTable(),
            GalleryArmchair(),
            GalleryBed(),
            GalleryLamp(),
          ],
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.white,
          leading: AppBarButtonPush(
            aimRoute: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
            },
            icon: SvgPicture.asset(
              'assets/Images/Icons/search.svg',
              height: 24,
              width: 24,
            ),
          ),
          title: const TitleAppBar(),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size(100, 100),
            child: SizedBox(
              height: 100,
              child: TabBar(
                indicatorColor: AppColor.black,
                isScrollable: true,
                tabs: [
                  HomeTabBar(
                    label: 'Popular',
                    icon: SvgPicture.asset('assets/Images/Icons/star.svg'),
                  ),
                  HomeTabBar(
                      label: 'Chair',
                      icon: SvgPicture.asset('assets/Images/Icons/chair.svg')),
                  HomeTabBar(
                      label: 'Table',
                      icon: SvgPicture.asset('assets/Images/Icons/table.svg')),
                  HomeTabBar(
                      label: 'Armchair',
                      icon: SvgPicture.asset('assets/Images/Icons/sofa.svg')),
                  HomeTabBar(
                      label: 'Bed',
                      icon: SvgPicture.asset('assets/Images/Icons/bed.svg')),
                  HomeTabBar(
                      label: 'Lamp',
                      icon: SvgPicture.asset('assets/Images/Icons/lamp.svg')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


//Home Screen  ↓  ↓  ↓  ↓  ↓ ↓  ↓  ↓  ↓  ↓ ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓
class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Make home',
          style: GoogleFonts.gelasio(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          'BEAUTIFUL',
          style: GoogleFonts.gelasio(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}


//Custom Widget TabBar
class HomeTabBar extends StatelessWidget {

  const HomeTabBar({
    super.key,
    required this.label,
    required this.icon,
  });
  final dynamic icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Tab(
        child: Column(
          children: [
            Container(
              height: 44,
              width: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(144, 144, 144, 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: 28,
                width: 28,
                child: icon,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Home Screen ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑  ↑