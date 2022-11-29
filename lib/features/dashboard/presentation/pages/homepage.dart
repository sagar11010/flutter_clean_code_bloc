import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:clean_code_structure/features/dashboard/presentation/blocs/dashboard_event.dart';
import 'package:clean_code_structure/features/dashboard/presentation/blocs/dashboard_state.dart';
import 'package:clean_code_structure/features/dashboard/presentation/widgets/maincard_widget.dart';
import 'package:clean_code_structure/features/dashboard/presentation/widgets/scroll_indicator.dart';
import 'package:clean_code_structure/injection_container.dart' as di;
import 'package:clean_code_structure/shared/shared.dart';

import '../blocs/dashboard_bloc.dart';
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => di.sl<DashboardBloc>()..add(GetDataFromBloc()),
          child: BlocBuilder<DashboardBloc, DashBoradState>(
            builder: (context, state) {
              if (state is DataLoaded) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: AppColors.commonShadow),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SwipeCards(
                      matchEngine: MatchEngine(swipeItems: state.mainData),
                      onStackFinished: () {},
                      itemBuilder: (context, index) {
                        ScrollController controller = ScrollController();
                        return Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                    color: AppColors.white,
                                    child: SingleChildScrollView(
                                      controller: controller,
                                      child: DashboardMainCard(
                                          data: state.mainData[index].content),
                                    ))),
                            WhiteScrollIndicator(controller: controller)
                          ],
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
