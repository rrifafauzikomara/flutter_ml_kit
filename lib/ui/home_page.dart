import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ml_kit/bloc/bloc.dart';
import 'package:flutter_ml_kit/utils/view_data.dart';
import 'package:flutter_ml_kit/widget/field_item.dart';
import 'package:flutter_ml_kit/widget/image_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _openCamera() {}

  void _openGallery(BuildContext context) {
    context.read<ScanBloc>().add(ScanIdCard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter ML Kit')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<ScanBloc, ScanState>(
          builder: (context, state) {
            final status = state.idCardState.status;
            if (status.isInitial) {
              return const Center(child: Text('No Photo found'));
            } else if (status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (status.isError) {
              return Center(child: Text(state.idCardState.message));
            } else if (status.isSuccess) {
              final data = state.idCardState.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageView(file: data.filePhoto),
                    const SizedBox(height: 30),
                    FieldItem(title: 'ID', value: data.cardModel.id),
                    FieldItem(title: 'Name', value: data.cardModel.name),
                    FieldItem(
                      title: 'Date of Birth',
                      value: data.cardModel.dob,
                    ),
                    FieldItem(
                      title: 'Place of Birth',
                      value: data.cardModel.placeOfDob,
                    ),
                    FieldItem(title: 'Gender', value: data.cardModel.gender),
                    FieldItem(title: 'Address', value: data.cardModel.address),
                    FieldItem(
                      title: 'Religion',
                      value: data.cardModel.religion,
                    ),
                    FieldItem(title: 'Status', value: data.cardModel.status),
                    FieldItem(title: 'Job', value: data.cardModel.job),
                    FieldItem(
                      title: 'Nationality',
                      value: data.cardModel.nationality,
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _openCamera(),
            child: const Icon(Icons.camera),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => _openGallery(context),
            child: const Icon(Icons.photo),
          ),
        ],
      ),
    );
  }
}
