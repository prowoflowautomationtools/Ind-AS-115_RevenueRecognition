import 'package:flutter/material.dart';
import 'progress_store.dart';

class CasePracticeScreen extends StatefulWidget {
  const CasePracticeScreen({super.key, required this.store});
  final ProgressStore store;
  @override
  State<CasePracticeScreen> createState() => _CasePracticeScreenState();
}

class _CasePracticeScreenState extends State<CasePracticeScreen> {
  int? selected;
  bool submitted = false;
  static const options = [
    'Recognise the entire ₹1,20,000 when the contract is signed.',
    'Assess the distinct promises, allocate consideration using relative stand-alone selling prices, and recognise each allocated amount as its performance obligation is satisfied.',
    'Recognise revenue only when the customer pays cash.',
    'Split revenue equally between the two promises regardless of their stand-alone selling prices.',
  ];
  static const correct = 1;

  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: [
    const Text('PRACTICAL APPLICATION', style: TextStyle(color: Color(0xFF159D91), fontSize: 11, letterSpacing: 1.4, fontWeight: FontWeight.w800)),
    const SizedBox(height: 6),
    const Text('Case practice', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color(0xFF101C35))),
    const SizedBox(height: 14),
    Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('CASE 01 · SOFTWARE & IMPLEMENTATION', style: TextStyle(color: Color(0xFF159D91), fontSize: 10, letterSpacing: 1.1, fontWeight: FontWeight.w800)),
      const SizedBox(height: 10),
      const Text('A software entity enters into a contract for a software licence and a separately priced implementation service. The customer can benefit from the software licence on its own, and the implementation service does not significantly modify or customise the software. The contract consideration is ₹1,20,000.', style: TextStyle(height: 1.55)),
      const SizedBox(height: 12),
      const Text('Question', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
      const Text('Which approach best reflects the Ind AS 115 model?', style: TextStyle(color: Color(0xFF718096))),
      const SizedBox(height: 12),
      ...List.generate(options.length, (i) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: submitted && i == correct ? const Color(0xFFE8F7F2) : selected == i ? const Color(0xFFEDF2FA) : Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: submitted && i == correct ? const Color(0xFF19A68F) : const Color(0xFFE4E9F0)),
        ),
        child: Material(
        color: Colors.transparent,
        child: RadioListTile<int>(
        value: i,
        groupValue: selected,
        onChanged: submitted ? null : (v) => setState(() => selected = v),
        title: Text(
        options[i],
        style: const TextStyle(fontSize: 12, height: 1.4),
       ),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
       ),
     ))),
      if (!submitted) FilledButton(onPressed: selected == null ? null : () async {
        setState(() => submitted = true);
        await widget.store.recordAnswer(selected == correct);
      }, child: const Text('Check my answer')),
      if (submitted) ...[
        const SizedBox(height: 10),
        Text(selected == correct ? 'Correct approach' : 'Review the reasoning', style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF138F83))),
        const SizedBox(height: 6),
        const Text('Reasoning: The fact pattern indicates two potentially distinct performance obligations. The entity should assess the contract promises under the distinct criteria, determine the transaction price, allocate it using relative stand-alone selling prices (unless a specific allocation exception applies), and recognise revenue when or as each obligation is satisfied. The question does not provide stand-alone selling prices or transfer facts, so a numerical allocation or precise recognition date cannot be concluded.', style: TextStyle(height: 1.5, fontSize: 12)),
        Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () => setState(() { selected = null; submitted = false; }), child: const Text('Try again'))),
      ],
    ]))),
    const SizedBox(height: 12),
    const Text('Case study is illustrative and intentionally omits facts required for a complete accounting conclusion. In practice, assess licensing nature, distinctness, control transfer, contract terms and relevant guidance.', style: TextStyle(fontSize: 12, color: Color(0xFF718096), height: 1.45)),
  ]);
}
