import '../data_source/cart_items.dart';
import '../data_source/remote_data_provider.dart';
import '../model/item.dart';
import '../model/model.dart';

class AsbezaRepository {
  final ApiServiceProvider dataSource = ApiServiceProvider();
  AsbezaRepository();

  Future<List<Asebeza>> getGroceryItems() async {
    return await dataSource.getGroceryItems();
  }

  addItemToCart(Item item) {
    if (purchasedItems.containsKey(item.id)) {
      purchasedItems[item.id][1] += 1;
    } else {
      purchasedItems[item.id] = [item.asbeza, 1];
    }
  }

  getItemsFromCart() {
    final id_with_value = [];
    for (final mapEntry in purchasedItems.entries) {
      final key = mapEntry.key;
      final value = mapEntry.value;
      id_with_value.add([key, value]);
    }
    return id_with_value;
  }

  removeItemFromCart(int id) {
    if (purchasedItems[id] == 1) {
      purchasedItems.remove(id);
    } else {
      purchasedItems[id][1] -= 1;
    }
  }

  removeAllItems() {
    purchasedItems.clear();
  }
}
