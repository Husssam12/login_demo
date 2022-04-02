import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:login/core/app_manger/app_manger_bloc.dart';
import 'package:login/core/user_provider.dart';
import 'package:login/generated/assets.dart';
import 'package:provider/provider.dart';

import '../../../../service_locator/service_locator.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);
  static const path = '/root';
  static const name = 'root_screen';

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: ChangeNotifierProvider<UserProvider>(
        create: (context) => si(),
        child: const RootScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select<UserProvider, User>((value) => value.user);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.h,
            pinned: true,
            leadingWidth: 0,
            collapsedHeight: 50.h,
            toolbarHeight: 50.h,
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                Assets.assetsDukkantek,
                fit: BoxFit.cover,
              ),
              title: Text(
                'Welcome ${user.displayName}',
                textAlign: TextAlign.start,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<AppMangerBloc>().add(AppMangerLoggedOut());
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ServiceCard(
                    title: 'Service ${index + 1}',
                  );
                },
                childCount: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      elevation: 4,
      margin: REdgeInsets.all(8),
      child: ListTile(
        title: Text(title),
        leading: CircleAvatar(
          child: const Icon(Icons.code),
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
