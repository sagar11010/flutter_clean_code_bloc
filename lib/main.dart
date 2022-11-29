import 'package:clean_code_structure/di/app_component_base.dart';
import 'package:clean_code_structure/features/dashboard/presentation/pages/homepage.dart';
import 'package:clean_code_structure/shared/shared.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await AppComponentBase.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      builder: (context, widget) {
//        final _appTheme = AppTheme.of(context);
        ScreenUtil.init(
          context,
          designSize: const Size(375, 812),
        );
        return Stack(
          children: <Widget>[
            StreamBuilder<bool?>(
                initialData: false,
                stream: AppComponentBase.instance.progressDialogStream,
                builder: (context, snapshot) {
                  return IgnorePointer(
                      ignoring: snapshot.data ?? false, child: widget);
                }),
            StreamBuilder<bool?>(
                initialData: true,
                stream: AppComponentBase
                    .instance.networkManage.internetConnectionStream,
                builder: (context, snapshot) {
                  return SafeArea(
                    child: AnimatedContainer(
                        height: snapshot.data ?? false ? 0 : 100.h,
                        duration: Constants.animationDuration,
                        color: AppColors.primaryColor,
                        child: const Material(
                          type: MaterialType.transparency,
                          child: Center(
                              child: Text(
                            Strings.noInternetConnection,
                          )),
                        )),
                  );
                }),
            StreamBuilder<bool?>(
                initialData: false,
                stream: AppComponentBase.instance.progressDialogStream,
                builder: (context, snapshot) {
                  if (snapshot.data ?? false) {
                    return const Center(child: CustomProgressDialog());
                  } else {
                    return const Offstage();
                  }
                })
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    AppComponentBase.instance.dispose();
    super.dispose();
  }
}
