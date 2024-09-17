import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpi_drive/src/core/dependencies/getIt.dart';
import 'package:kpi_drive/src/core/resources/app_colors.dart';
import 'package:kpi_drive/src/core/widgets/column_spacer.dart';
import 'package:kpi_drive/src/core/widgets/row_spacer.dart';
import 'package:kpi_drive/src/feautures/screens/widgets/board_widget.dart';

import '../../../core/widgets/rectangle_widget.dart';
import 'logic/bloc/board_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BoardBloc>()..add(BoardEvent()),
      child: BlocBuilder<BoardBloc, BoardState>(
        builder: (context, state) {
          if (state is IndicatorFail) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is IndicatorLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is IndicatorSuccess) {
            return Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        color: AppColors.darkBlueColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                RowSpacer(3),
                                const RectangleWidget(
                                  height: 41,
                                  width: 41,
                                  icon: Icon(
                                    Icons.home_filled,
                                    color: Colors.white,
                                  ),
                                ),
                                RowSpacer(1),
                                RectangleWidget(
                                    height: 41,
                                    width: 137,
                                    icon: const Icon(
                                      Icons.analytics_outlined,
                                      color: Colors.white,
                                    ),
                                    text: Text(
                                      'Боарды',
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20,
                                          color: Colors.white),
                                    )),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RectangleWidget(
                                  height: 41,
                                  width: 41,
                                  icon: Icon(
                                    Icons.add_circle_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                RowSpacer(0.5),
                                RectangleWidget(
                                  height: 41,
                                  width: 41,
                                  icon: Icon(
                                    Icons.info_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                RowSpacer(0.5),
                                CircleAvatar(
                                  backgroundColor: Colors.amber,
                                ),
                                RowSpacer(3),
                              ],
                            )
                          ],
                        ),
                      ),
                      
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.blueColor,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 30, vertical: 30),
                          child: MultiBoardListExample(
                           indicatorData: state.indicatorData,
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }
          return Container();
        },
      ),
    );
  }
}
