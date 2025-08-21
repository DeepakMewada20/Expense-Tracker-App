import 'package:expense_tracker_app/modal/expence.dart';
import 'package:get/get.dart';
import 'package:hive_local_storage/hive_local_storage.dart';

class HiveDataSave extends GetxController {
  // Initialize Hive and open the box
  @override
  void onInit() async {
    super.onInit();
    await Hive.openBox('expences');
  }

  // Method to save an expense
  Future<void> saveExpense(Expence expence) async{
    final box = Hive.box("expences");
    await box.add(expence);
  }
  

  // // Method to save an expense
  // Future<void> saveExpense(Expence expence) async {
  //   final box = Hive.box('expences');
  //   await box.add(expence);
  // }

  // // Method to retrieve all expenses
  // List<Expence> getExpenses() {
  //   final box = Hive.box('expences');
  //   return box.values.cast<Expence>().toList();
  // }
}
