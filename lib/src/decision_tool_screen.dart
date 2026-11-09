import 'package:flutter/material.dart';

class DecisionToolScreen extends StatefulWidget {
  const DecisionToolScreen({super.key});
  @override
  State<DecisionToolScreen> createState() => _DecisionToolScreenState();
}

class _DecisionToolScreenState extends State<DecisionToolScreen> {
  final transactionPrice = TextEditingController(text: '120000');
  final standaloneA = TextEditingController(text: '80000');
  final standaloneB = TextEditingController(text: '40000');
  String? recognition;
  @override
  void dispose() { transactionPrice.dispose(); standaloneA.dispose(); standaloneB.dispose(); super.dispose(); }

  double value(TextEditingController c) => double.tryParse(c.text.replaceAll(',', '').trim()) ?? 0;
  String money(double n) => '₹${n.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    final totalSsp = value(standaloneA) + value(standaloneB);
    final price = value(transactionPrice);
    final valid = totalSsp > 0 && price >= 0;
    final allocationA = valid ? price * value(standaloneA) / totalSsp : 0.0;
    final allocationB = valid ? price * value(standaloneB) / totalSsp : 0.0;
    return ListView(padding: const EdgeInsets.all(20), children: [
      const Text('ACCOUNTING WORKBENCH', style: TextStyle(color: Color(0xFF159D91), fontSize: 11, letterSpacing: 1.4, fontWeight: FontWeight.w800)),
      const SizedBox(height: 6),
      const Text('Decision & calculation tools', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF101C35))),
      const SizedBox(height: 8),
      const Text('Explore the mechanics and inspect each calculation. Inputs are illustrative.', style: TextStyle(color: Color(0xFF718096))),
      const SizedBox(height: 18),
      Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Relative stand-alone selling price allocation', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
        const SizedBox(height: 5),
        const Text('Illustration: allocate a transaction price to two performance obligations using relative stand-alone selling prices.', style: TextStyle(fontSize: 12, color: Color(0xFF718096), height: 1.4)),
        const SizedBox(height: 16),
        _numberField('Transaction price (₹)', transactionPrice),
        _numberField('Stand-alone selling price – Obligation A (₹)', standaloneA),
        _numberField('Stand-alone selling price – Obligation B (₹)', standaloneB),
        const Divider(height: 28),
        if (!valid) const Text('Enter valid amounts and ensure total stand-alone selling prices are greater than zero.', style: TextStyle(color: Colors.red))
        else ...[
          _result('Total stand-alone selling prices', money(totalSsp)),
          _result('Allocation to Obligation A', money(allocationA)),
          _result('Allocation to Obligation B', money(allocationB)),
          _result('Reconciliation', money(allocationA + allocationB)),
          const SizedBox(height: 12),
          Container(width: double.infinity, padding: const EdgeInsets.all(13), decoration: BoxDecoration(color: const Color(0xFFF0F7F7), borderRadius: BorderRadius.circular(14)), child: Text(
            'Working:\nA = ₹${price.toStringAsFixed(2)} × (${value(standaloneA).toStringAsFixed(2)} ÷ ${totalSsp.toStringAsFixed(2)}) = ${money(allocationA)}\n\nB = ₹${price.toStringAsFixed(2)} × (${value(standaloneB).toStringAsFixed(2)} ÷ ${totalSsp.toStringAsFixed(2)}) = ${money(allocationB)}',
            style: const TextStyle(height: 1.5, fontFamily: 'monospace', fontSize: 12),
          )),
        ],
      ]))),
      const SizedBox(height: 14),
      Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Over-time recognition: initial screening', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        const Text('Which fact pattern is being assessed?', style: TextStyle(color: Color(0xFF718096), fontSize: 12)),
        RadioListTile<String>(contentPadding: EdgeInsets.zero, value: 'Customer simultaneously receives and consumes benefits', groupValue: recognition, onChanged: (v) => setState(() => recognition = v), title: const Text('Customer receives and consumes benefits as performed', style: TextStyle(fontSize: 13))),
        RadioListTile<String>(contentPadding: EdgeInsets.zero, value: 'Entity creates or enhances an asset controlled by customer', groupValue: recognition, onChanged: (v) => setState(() => recognition = v), title: const Text('Customer controls the asset as it is created or enhanced', style: TextStyle(fontSize: 13))),
        RadioListTile<String>(contentPadding: EdgeInsets.zero, value: 'No alternative use and enforceable right to payment', groupValue: recognition, onChanged: (v) => setState(() => recognition = v), title: const Text('No alternative use and enforceable right to payment for work completed', style: TextStyle(fontSize: 13))),
        if (recognition != null) Container(width: double.infinity, padding: const EdgeInsets.all(13), decoration: BoxDecoration(color: const Color(0xFFF0F7F7), borderRadius: BorderRadius.circular(14)), child: const Text('This fact pattern corresponds to one of the over-time criteria in Ind AS 115. Verify the detailed facts, enforceability and relevant legal environment before concluding.')),
      ]))),
    ]);
  }

  Widget _numberField(String label, TextEditingController c) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextField(controller: c, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => setState(() {}), decoration: InputDecoration(labelText: label, isDense: true)),
  );
  Widget _result(String label, String val) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(children: [Expanded(child: Text(label, style: const TextStyle(color: Color(0xFF526078), fontSize: 12))), Text(val, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF101C35)))]),
  );
}
