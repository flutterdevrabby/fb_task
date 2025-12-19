import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../providers/create_journal_provider.dart';
import '../../../routes/routes.dart';
import '../../create_journal/model/create_journal_model.dart';

class JournalCardWidget extends StatelessWidget {
  final CreateJournalModel createJournalModel;
  final int index;
  const JournalCardWidget({
    super.key,
    required this.createJournalModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              createJournalModel.title,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              DateFormat.yMMMEd().format(createJournalModel.date),
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 8.h),
            Text(createJournalModel.mode, style: TextStyle(fontSize: 16.sp)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, size: 20.sp, color: Colors.blue),
                  onPressed: () {
                    // Edit action
                    context.push(
                      AppRoutes.editJournalScreen,
                      extra: {'index': index, 'journal': createJournalModel},
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, size: 20.sp, color: Colors.red),
                  onPressed: () {
                    context.read<CreateJournalProvider>().deleteJournal(index);

                    Fluttertoast.showToast(msg: "Journal deleted Successfully");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
