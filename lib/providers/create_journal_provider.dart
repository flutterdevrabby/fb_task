import 'package:fb_journal_app/features/create_journal/model/create_journal_model.dart';
import 'package:flutter/material.dart';

class CreateJournalProvider extends ChangeNotifier {

  CreateJournalProvider() {
    filteredList = dataList;
  }

// Journal List
  List<CreateJournalModel> dataList = [];

  // Filering search list
  List<CreateJournalModel> filteredList = [];

  void searchByTitle(String query) {
    if (query.isEmpty) {
      filteredList = List.from(dataList);
    } else {
      filteredList = dataList
          .where((journal) =>
              journal.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }


  final formKey = GlobalKey<FormState>();



  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();
  String? selectedMode;
  void setSelectedMode(String? mode) {
    selectedMode = mode;
    notifyListeners();
  }

@override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  void updateSelectedDate() async {
    DateTime pickedDate =
        await showDatePicker(
          context: formKey.currentContext!,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        ) ??
        selectedDate;

    selectedDate = pickedDate;

    dateController.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    notifyListeners();
  }


void addJournal(CreateJournalModel journal) {
    dataList.add(journal);
    filteredList = List.from(dataList);
    notifyListeners();
  }

  void updateJournal(CreateJournalModel journal, int index) {
    dataList[index] = journal;
    filteredList = List.from(dataList);
    notifyListeners();
  }

  void deleteJournal(int index) {
    dataList.removeAt(index);
    filteredList = List.from(dataList);
    notifyListeners();
  }



// clear form
void clearForm() {
    titleController.clear();
    dateController.clear();
    descriptionController.clear();
    selectedMode = null;
    selectedDate = DateTime.now();
    notifyListeners();
  }


}
