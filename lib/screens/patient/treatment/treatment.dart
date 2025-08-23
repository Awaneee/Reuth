import 'package:flutter/material.dart';

class TreatmentPlanScreen extends StatelessWidget {
  const TreatmentPlanScreen({super.key});

  Widget _buildPlanItem(String text, {bool completed = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            completed ? Icons.check_circle : Icons.hourglass_bottom,
            color: completed ? Colors.green : Colors.orange,
          ),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Your Progress: 60%",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _buildPlanItem("Physiotherapy Sessions", completed: true),
          _buildPlanItem("Medication Adherence", completed: true),
          _buildPlanItem("Follow-up Appointment", completed: false),
          const Divider(height: 32),
          const Text("Supplementary Guide"),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Text("🏠 Physiotherapy Exercises for Home",
                style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
