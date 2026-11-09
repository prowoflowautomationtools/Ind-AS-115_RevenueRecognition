import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ind_as115_learning/src/app.dart';
import 'package:ind_as115_learning/src/progress_store.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('dashboard renders primary learning routes', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final store = ProgressStore(await SharedPreferences.getInstance());
    await tester.pumpWidget(IndAs115App(progressStore: store));
    expect(find.text('Revenue, understood.'), findsOneWidget);
    expect(find.text('Explore the framework'), findsOneWidget);
  });
}
