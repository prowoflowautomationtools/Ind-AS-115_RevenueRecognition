import 'package:flutter/material.dart';
import 'progress_store.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.store, required this.onNavigate});
  final ProgressStore store;
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
      children: [
        Row(children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(color: const Color(0xFF101C35), borderRadius: BorderRadius.circular(14)),
            child: const Icon(Icons.functions_rounded, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('IND AS 115 STUDIO', style: TextStyle(fontSize: 11, letterSpacing: 1.4, fontWeight: FontWeight.w800, color: Color(0xFF718096))),
            Text('Revenue, understood.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF101C35))),
          ])),
          const Icon(Icons.bookmark_border_rounded, color: Color(0xFF526078)),
        ]),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF101C35), Color(0xFF233D63)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('YOUR LEARNING WORKSPACE', style: TextStyle(color: Color(0xFF9DDDD5), fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Master the logic\nbehind revenue.', style: TextStyle(color: Colors.white, fontSize: 27, height: 1.12, fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            const Text('Learn the standard. Apply the principles. Explain every conclusion.', style: TextStyle(color: Color(0xFFD3DCE9), height: 1.4)),
            const SizedBox(height: 18),
            FilledButton(
              onPressed: () => onNavigate(1),
              style: FilledButton.styleFrom(backgroundColor: const Color(0xFF19B6A4), foregroundColor: const Color(0xFF082B2B)),
              child: const Text('Continue learning  →'),
            ),
          ]),
        ),
        const SizedBox(height: 20),
        Row(children: [
          Expanded(child: _Metric(value: '${store.completedLessons}', label: 'Lessons done', icon: Icons.menu_book_outlined)),
          const SizedBox(width: 10),
          Expanded(child: _Metric(value: '${store.correctAnswers}/${store.attempts}', label: 'Correct answers', icon: Icons.track_changes_rounded)),
        ]),
        const SizedBox(height: 24),
        const Text('Explore the framework', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF101C35))),
        const SizedBox(height: 12),
        _FeatureTile(number: '01', title: 'Learn the five-step model', subtitle: 'Concepts, checkpoints and illustrations', icon: Icons.school_outlined, onTap: () => onNavigate(1)),
        _FeatureTile(number: '02', title: 'Decision & calculation tools', subtitle: 'Contract assessment and allocation', icon: Icons.account_tree_outlined, onTap: () => onNavigate(2)),
        _FeatureTile(number: '03', title: 'Practical case practice', subtitle: 'Apply the principles to a business fact pattern', icon: Icons.assignment_turned_in_outlined, onTap: () => onNavigate(3)),
        const SizedBox(height: 14),
        const Text('Learning note: This MVP is an educational aid. Verify conclusions against the currently applicable notified text and facts of each engagement.', style: TextStyle(color: Color(0xFF718096), fontSize: 12, height: 1.45)),
      ],
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.value, required this.label, required this.icon});
  final String value, label;
  final IconData icon;
  @override
  Widget build(BuildContext context) => Card(child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, color: const Color(0xFF19A999)),
      const SizedBox(height: 12),
      Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF101C35))),
      Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF718096))),
    ]),
  ));
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({required this.number, required this.title, required this.subtitle, required this.icon, required this.onTap});
  final String number, title, subtitle;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      leading: CircleAvatar(backgroundColor: const Color(0xFFE5F7F4), child: Icon(icon, color: const Color(0xFF138F83))),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF17243B))),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
    ),
  );
}
