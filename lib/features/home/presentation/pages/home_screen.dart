import 'package:events_app/features/home/presentation/widgets/drawer/home_drawer.dart';
import 'package:events_app/features/home/presentation/widgets/home/home_body.dart';
import 'package:flutter/material.dart';
import 'package:events_app/features/home/presentation/widgets/home/home_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.h), child: const HomeAppBar()),
      body: const HomeBody(),
    );
  }
}
