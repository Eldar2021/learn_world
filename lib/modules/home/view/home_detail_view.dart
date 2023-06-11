import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markdown_widget/widget/all.dart';

import 'package:learn_world/components/components.dart';
import 'package:learn_world/core/core.dart';
import 'package:learn_world/modules/modules.dart';

class HomeDetailView extends StatelessWidget {
  const HomeDetailView(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          switch (state.fetchStatus) {
            case FetchStatus.initial:
              return const InitialWidget();
            case FetchStatus.loading:
              return const LoadingWidget();
            case FetchStatus.success:
              return DetailSuccessView(state.mdFile ?? '');
            case FetchStatus.fail:
              return const CustomErrorWidget();
          }
        },
      ),
    );
  }
}

class DetailSuccessView extends StatelessWidget {
  const DetailSuccessView(this.mdFile, {super.key});

  final String mdFile;

  @override
  Widget build(BuildContext context) {
    return MarkdownWidget(
      padding: const EdgeInsets.fromLTRB(14, 20, 14, 40),
      data: mdFile,
    );
  }
}
