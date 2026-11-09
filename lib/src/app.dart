import 'package:flutter/material.dart';
import 'case_practice_screen.dart';
import 'dashboard_screen.dart';
import 'decision_tool_screen.dart';
import 'learning_screen.dart';
import 'progress_store.dart';

class IndAs115App extends StatelessWidget {
  const IndAs115App({super.key, required this.progressStore});
  final ProgressStore progressStore;

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF101C35);
    const teal = Color(0xFF19B6A4);
    return MaterialApp(
      title: 'Ind AS 115 Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: teal,
          brightness: Brightness.light,
          primary: navy,
          secondary: teal,
          surface: const Color(0xFFF6F8FC),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6F8FC),
          foregroundColor: navy,
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFFE8ECF3)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE1E7EF)),
          ),
        ),
      ),
      home: AppShell(progressStore: progressStore),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.progressStore});
  final ProgressStore progressStore;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardScreen(
        store: widget.progressStore,
        onNavigate: (index) => setState(() => selected = index),
      ),
      LearningScreen(store: widget.progressStore),
      DecisionToolScreen(),
      CasePracticeScreen(store: widget.progressStore),
    ];
    return Scaffold(
      body: SafeArea(child: IndexedStack(index: selected, children: pages)),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (value) => setState(() => selected = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.grid_view_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.menu_book_rounded), label: 'Learn'),
          NavigationDestination(icon: Icon(Icons.account_tree_rounded), label: 'Tools'),
          NavigationDestination(icon: Icon(Icons.fact_check_rounded), label: 'Practice'),
        ],
      ),
    );
  }
}
