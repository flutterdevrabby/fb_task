import 'package:fb_journal_app/common_widget/custom_button.dart';
import 'package:fb_journal_app/common_widget/custom_text_field_widget.dart';
import 'package:fb_journal_app/const/text_stye.dart';
import 'package:fb_journal_app/features/create_journal/model/create_journal_model.dart';
import 'package:fb_journal_app/providers/create_journal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/drop_down_widget.dart';

class CreateJournalScreen extends StatefulWidget {
  const CreateJournalScreen({super.key});

  @override
  State<CreateJournalScreen> createState() => _CreateJournalScreenState();
}

class _CreateJournalScreenState extends State<CreateJournalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Journal')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<CreateJournalProvider>(
            builder: (context, createJournalProvider, child) {
              return Form(
                key: createJournalProvider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    SizedBox(height: 16.h),
                    Text('Title', style: TextFontStyle.headLine16C082438W700),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      hintText: 'title here',
                      controller: createJournalProvider.titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),

                    // Date
                    SizedBox(height: 16.h),
                    Text('Date', style: TextFontStyle.headLine16C082438W700),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      onTap: () {
                        context
                            .read<CreateJournalProvider>()
                            .updateSelectedDate();
                      },

                      controller: createJournalProvider.dateController,

                      readOnly: true,
                      hintText: 'Enter date',
                      suffixIcon: Icon(Icons.date_range),
                    ),

                    // Description
                    SizedBox(height: 16.h),
                    Text(
                      'Description',
                      style: TextFontStyle.headLine16C082438W700,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      hintText: 'Enter description',
                      maxLines: 5,
                      controller: createJournalProvider.descriptionController,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),

                    // Mode
                    SizedBox(height: 16.h),
                    Text('Mode', style: TextFontStyle.headLine16C082438W700),
                    SizedBox(height: 8.h),
                    DropDownWidget(
                      items: ['Happy', 'Sad', 'Neutral', 'Excited', 'Tired'],
                      selectedValue: createJournalProvider.selectedMode,
                      onChanged: (value) {
                        context.read<CreateJournalProvider>().setSelectedMode(
                          value,
                        );
                      },
                    ),

                    SizedBox(height: 16.h),
                    CustomButton(
                      onPressed: () {
                        if (!createJournalProvider.formKey.currentState!
                            .validate()) {
                          return;
                        }
                        //
                        else if (createJournalProvider
                            .dateController
                            .text
                            .isEmpty) {
                          Fluttertoast.showToast(msg: 'Please select date');
                        } else if (createJournalProvider.selectedMode == null) {
                          Fluttertoast.showToast(msg: 'Please select mode');
                        } else {
                          createJournalProvider.addJournal(
                            CreateJournalModel(
                              title: createJournalProvider.titleController.text,
                              date: createJournalProvider.selectedDate,
                              description: createJournalProvider
                                  .descriptionController
                                  .text,
                              mode: createJournalProvider.selectedMode!,
                            ),
                          );

                          createJournalProvider.clearForm();

                          Fluttertoast.showToast(
                            msg: "Journal Created successfully",
                          );

                          Navigator.of(context).pop();
                        }
                      },
                      buttonName: 'Save Journal',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
