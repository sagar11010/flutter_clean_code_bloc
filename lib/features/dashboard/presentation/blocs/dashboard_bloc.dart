import 'package:bloc/bloc.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:clean_code_structure/di/app_component_base.dart';
import 'package:clean_code_structure/domain/usecase/dashboard_fetch/dashboard_fetch.dart';
import 'package:clean_code_structure/features/dashboard/presentation/blocs/dashboard_event.dart';
import 'package:clean_code_structure/features/dashboard/presentation/blocs/dashboard_state.dart';

class DashboardBloc extends Bloc<DashBoardEvent, DashBoradState> {
  final DashboardFetch _dashboardFetch;

  DashboardBloc({
    required DashboardFetch dashboardFetch,
  })  : _dashboardFetch = dashboardFetch,
        super(DataLoaderInitial()) {
    on<GetDataFromBloc>((event, emit) async {
      List<SwipeItem> _swipeItems = <SwipeItem>[];
      AppComponentBase.instance.showProgressDialog();
      await Future.delayed(Duration(seconds:2));
      AppComponentBase.instance.hideProgressDialog();

      final response = await _dashboardFetch.call();

      response.fold((l) => print("error"), (r) {
        //   var model = await GetMainData.getMainDataFromDataSource();
        r.data!.properties!.forEach((element) {
          _swipeItems.add(SwipeItem(
              content: element,
              likeAction: () {
                print('liked');
              },
              nopeAction: () {
                print('disliked');
              },
              onSlideUpdate: (SlideRegion? region) async {
                element.liked = region == null ? false : true;

                //   DashboardBloc().add(event);
              }));
        });
        emit(DataLoaded(_swipeItems));
      });
    });
  }
}
