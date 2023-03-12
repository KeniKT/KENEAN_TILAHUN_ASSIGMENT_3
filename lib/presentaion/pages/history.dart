import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/item.dart';
import '../../data/model/model.dart';
import '../../routes.dart';
import '../bloc/asebeza_bloc_bloc.dart';
import '../widgets/custom_appBar.dart';
import '../widgets/custom_drawer.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: BlocBuilder<AsebezaBlocBloc, AsebezaBlocState>(
          builder: (context, state) {
            if (state is AllCartItemsState) {
              double price = asbezaCalculator(state.items);
              return Padding(
                padding:
                    EdgeInsets.only(top: 30, bottom: 50, left: 10, right: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Items Added To Your Cart",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 5),
                          child: ListView.separated(
                            itemCount: state.items.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Asebeza asbezaVal =
                                  state.items[index][1][0];
                              final int count = state.items[index][1][1];

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image:
                                                NetworkImage(asbezaVal.image))),
                                    height:
                                        MediaQuery.of(context).size.height * .1,
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 11, vertical: 5),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
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
                                  SizedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () {
                                            BlocProvider.of<AsebezaBlocBloc>(
                                                    context)
                                                .add(AddItemBlocEvent(
                                                    item: Item(
                                                        asbeza: asbezaVal,
                                                        id: asbezaVal.id)));
                                            BlocProvider.of<AsebezaBlocBloc>(
                                                    context)
                                                .add(GetItemBlocEvent());
                                            Navigator.popAndPushNamed(
                                                context, Routes.history);
                                          },
                                        ),
                                        Text(
                                          count.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () {
                                            BlocProvider.of<AsebezaBlocBloc>(
                                                    context)
                                                .add(RemoveItemBlocEvent(
                                                    id: asbezaVal.id));
                                            Navigator.popAndPushNamed(
                                                context, Routes.history);
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 30,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 3,
                        thickness: 2,
                      ),
                      Center(
                        child: Text(
                          "Your Total Asebeza price is: ${price.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      )
                    ]),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  double asbezaCalculator(List items) {
    double total_price = 0;
    for (int i = 0; i < items.length; i++) {
      Asebeza asbeza = items[i][1][0];
      int count = items[i][1][1];
      total_price += (asbeza.foodPrice * count);
    }
    return total_price;
  }
}
