import 'package:fb_journal_app/common_widget/custom_text_field_widget.dart';
import 'package:fb_journal_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/create_journal_provider.dart';
import 'widgets/journal_card_widget.dart';

class JournalHomeScreen extends StatefulWidget {
  const JournalHomeScreen({super.key});

  @override
  State<JournalHomeScreen> createState() => _JournalHomeScreenState();
}

class _JournalHomeScreenState extends State<JournalHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Journal")),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          spacing: 20.h,
          children: [
            CustomTextFormField(
              hintText: "Search journals by Title",
              prefixIcon: Icon(Icons.search),
              onChanged: (value) {
              context.read<CreateJournalProvider>().searchByTitle(value);
              },
            ),
            Expanded(
              child: Consumer<CreateJournalProvider>(
                builder: (context, provider, child) {
                  if (provider.dataList.isEmpty) {
                    return Center(
                      child: Text(
                        "No journals yet.\nTap + to add your first journal.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),
                    );
                  }
              
                  if (provider.filteredList.isEmpty) {
                    return Center(
                      child: Text(
                        "No journals found for your search.",
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: provider.filteredList.length,
                    itemBuilder: (context, index) {
                      var data = provider.filteredList[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to journal details screen
                          context.push(
                            AppRoutes.journalCardDetailsScreen,
                            extra: {'index': index, 'journal': data},
                          );
                        },
                        child: JournalCardWidget(
                          createJournalModel: data,
                          index: index,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Go to the new journal screen
          context.push(AppRoutes.createJournalScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
