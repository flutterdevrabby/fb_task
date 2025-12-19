import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../create_journal/model/create_journal_model.dart';

class JournalCardDetailsScreen extends StatelessWidget {
  final CreateJournalModel createJournalModel;
  final int index;
  const JournalCardDetailsScreen({
    super.key,
    required this.createJournalModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Journal Details")),
      body: Card(
        elevation: 4,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          width: 1.sw,
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                createJournalModel.title,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),

              Text(
                createJournalModel.description,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.h),

              Text(
                DateFormat.yMMMEd().format(createJournalModel.date),
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 8.h),
              Text(createJournalModel.mode, style: TextStyle(fontSize: 16.sp)),
            ],
          ),
        ),
      ),
    );
  }
}
