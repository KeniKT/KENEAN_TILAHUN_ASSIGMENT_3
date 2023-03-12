import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes.dart';
import '../bloc/asebeza_bloc_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black,
      title: const Text("Asebeza"),
      actions: [
        IconButton(
            onPressed: () {
              BlocProvider.of<AsebezaBlocBloc>(context).add(GetItemBlocEvent());
              Navigator.pushNamed(context, Routes.history);
            },
            icon: const Icon(Icons.shopping_bag)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.profile);
            },
            icon: const Icon(Icons.account_circle_rounded)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);
}
