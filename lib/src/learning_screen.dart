import 'package:flutter/material.dart';
import 'progress_store.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key, required this.store});
  final ProgressStore store;
  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  static const steps = [
    ('Identify the contract', 'A contract is an agreement between two or more parties that creates enforceable rights and obligations.', 'Assess approval and commitment, identifiable rights, payment terms, commercial substance and probable collection of consideration.'),
    ('Identify performance obligations', 'Identify each promise to transfer a distinct good or service, or a series of distinct goods or services that are substantially the same and have the same pattern of transfer.', 'A promised item is distinct when the customer can benefit from it on its own or with readily available resources, and the promise is separately identifiable in the contract context.'),
    ('Determine the transaction price', 'Determine the amount of consideration to which the entity expects to be entitled in exchange for transferring promised goods or services.', 'Consider fixed and variable consideration, the constraint, significant financing component, non-cash consideration and consideration payable to a customer.'),
    ('Allocate the transaction price', 'Allocate the transaction price to each performance obligation on the basis of relative stand-alone selling prices at contract inception.', 'Relative allocation = transaction price × (stand-alone selling price of obligation ÷ total stand-alone selling prices), subject to specific allocation requirements.'),
    ('Recognise revenue', 'Recognise revenue when (or as) a performance obligation is satisfied by transferring control of a promised good or service.', 'Assess over-time criteria. If none is met, recognise at the point in time control transfers.'),
  ];

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      const Text('THE FRAMEWORK', style: TextStyle(color: Color(0xFF159D91), fontSize: 11, letterSpacing: 1.4, fontWeight: FontWeight.w800)),
      const SizedBox(height: 6),
      const Text('The five-step model', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color(0xFF101C35))),
      const SizedBox(height: 8),
      const Text('Work through the model in sequence. Each step asks a different accounting question.', style: TextStyle(color: Color(0xFF718096), height: 1.4)),
      const SizedBox(height: 18),
      ...List.generate(steps.length, (i) {
        final item = steps[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            leading: CircleAvatar(backgroundColor: const Color(0xFFE5F7F4), child: Text('${i + 1}', style: const TextStyle(color: Color(0xFF138F83), fontWeight: FontWeight.bold))),
            title: Text(item.$1, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF17243B))),
            subtitle: Text('Step ${i + 1} of 5', style: const TextStyle(fontSize: 11)),
            children: [
              Align(alignment: Alignment.centerLeft, child: Text(item.$2, style: const TextStyle(height: 1.5))),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(color: const Color(0xFFF0F7F7), borderRadius: BorderRadius.circular(14)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('DECISION CHECKPOINT', style: TextStyle(fontSize: 10, letterSpacing: 1, color: Color(0xFF138F83), fontWeight: FontWeight.w800)),
                  const SizedBox(height: 5),
                  Text(item.$3, style: const TextStyle(height: 1.45)),
                ]),
              ),
              const SizedBox(height: 12),
              Align(alignment: Alignment.centerRight, child: FilledButton.tonal(
                onPressed: () async { await widget.store.completeLesson(); if (mounted) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lesson marked complete'))); setState(() {}); } },
                child: const Text('Mark lesson complete'),
              )),
            ],
          ),
        );
      }),
      const Text('Scope note: These summaries are learning aids, not a substitute for the complete notified standard, appendices, implementation guidance or applicable amendments.', style: TextStyle(fontSize: 12, color: Color(0xFF718096), height: 1.45)),
    ],
  );
}
