import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ml_kit/bloc/bloc.dart';
import 'package:flutter_ml_kit/utils/view_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _openCamera() {}

  void _openGallery(BuildContext context) {
    context.read<ScanBloc>().add(ScanIdCard());
  }

  Widget _field({required String title, required String value}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(title),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(':'),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _image({required File file}) {
    return SizedBox(
      height: 250,
      child: Image.file(file),
    );
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
                    _image(file: data.filePhoto),
                    const SizedBox(height: 30),
                    _field(title: 'ID', value: data.cardModel.id),
                    _field(title: 'Name', value: data.cardModel.name),
                    _field(title: 'Date of Birth', value: data.cardModel.dob),
                    _field(
                      title: 'Place of Birth',
                      value: data.cardModel.placeOfDob,
                    ),
                    _field(title: 'Gender', value: data.cardModel.gender),
                    _field(title: 'Address', value: data.cardModel.address),
                    _field(title: 'Religion', value: data.cardModel.religion),
                    _field(title: 'Status', value: data.cardModel.status),
                    _field(title: 'Job', value: data.cardModel.job),
                    _field(
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
