import 'dart:math';

import 'package:devpace_test/core/config/dimens.dart';
import 'package:devpace_test/core/config/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/common/widgets/button/custom_widget.dart';
import '../data/model/padding_model.dart';
import '../managers/main_bloc.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        });
        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              PaddingModel paddings =
                  _calculatePadding(constraints, state.listItems.length);
              double logoTopPadding = paddings.logoTopPadding;
              double gridTopPadding = paddings.gridTopPadding;
              return SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(Margins.medium),
                  child: Column(
                    children: [
                      SizedBox(height: logoTopPadding),
                      Image.asset(
                        Img.logo,
                        height: Dimens.logoSize,
                      ),
                      SizedBox(
                          height: state.listItems.isEmpty
                              ? Margins.zero
                              : gridTopPadding - Dimens.logoSize),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: Margins.smaller,
                          crossAxisSpacing: Margins.smaller,
                        ),
                        itemCount: state.listItems.length,
                        itemBuilder: (context, index) {
                          return CustomWidget(title: state.listItems[index]);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<MainBloc>(context).add(MainAddItemEvent());
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: Margins.smaller),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<MainBloc>(context).add(MainRemoveItemEvent());
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }
}

PaddingModel _calculatePadding(BoxConstraints constraints, int itemCount) {
  double logoTopPadding =
      max(0, constraints.maxHeight / 2 - Dimens.logoSize / 2 - itemCount * 50);
  double gridTopPadding =
      max(Dimens.logoSize, constraints.maxHeight / 2 - itemCount * 50);

  return PaddingModel(
    logoTopPadding: logoTopPadding,
    gridTopPadding: gridTopPadding,
  );
}
