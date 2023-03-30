import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/item.dart';
import '../../data/model/model.dart';
import '../bloc/asebeza_bloc_bloc.dart';
import '../widgets/custom_appBar.dart';
import '../widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: BlocBuilder<AsebezaBlocBloc, AsebezaBlocState>(
          builder: (context, state) {
            
            if (state is AsebezaBlocInitial) {
              BlocProvider.of<AsebezaBlocBloc>(context)
                        .add(FetchAsebezaBlocEvent());
            }
            if (state is AsbezaBlockLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AsbezaBlockSuccess) {
              return Container(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 5),
                height: MediaQuery.of(context).size.height * .88,
                child: ListView.builder(
                  itemCount: state.asbeza.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Asebeza asbezaVal = state.asbeza[index];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image:
                                              NetworkImage(asbezaVal.image))),
                                  height:
                                      MediaQuery.of(context).size.height * .1,
                                  width: MediaQuery.of(context).size.width * .3,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 11, vertical: 5),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(asbezaVal.foodTitle),
                                      Text(
                                        "${asbezaVal.foodPrice}\$",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    for (var element in state.asbeza) {
                                      if (element.id == asbezaVal.id) {
                                        
                                        continue;
                                      }
                                    }
                                  });
                                  BlocProvider.of<AsebezaBlocBloc>(context).add(
                                      AddItemBlocEvent(
                                          item: Item(
                                              asbeza: asbezaVal,
                                              id: asbezaVal.id)));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "You added ${asbezaVal.foodTitle}item to your cart")));
                                },
                                icon: const Icon(Icons.shopping_cart))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    );
                  },
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
