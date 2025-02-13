import 'package:convention/core/generic_widgets/bottom_navigation_bar/bottom_navigation_bar_items.dart';
import 'package:convention/core/generic_widgets/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
import 'package:convention/features/home/screens/cart_screen.dart';
import 'package:convention/features/home/screens/home_screen.dart';
import 'package:convention/features/home/screens/profile_screen.dart';
import 'package:convention/features/home/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    context
                        .read<BottomNavigationCubit>()
                        .changePageIndex(index);
                  },
                  children: [
                    HomeScreen(),
                    const SearchScreen(),
                    const CartScreen(),
                    ProfileScreen(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.h,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomBottomNavBar(
                      currentIndex: state.selectedIndex,
                      onTap: (index) {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                        context
                            .read<BottomNavigationCubit>()
                            .changePageIndex(index);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
