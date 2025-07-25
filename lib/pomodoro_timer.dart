import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'timer_provider.dart';

class PomodoroTimer extends StatelessWidget {
  const PomodoroTimer({super.key});

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    return Scaffold(
      backgroundColor: timerProvider.isWorkTime ? const Color(0xFFF4EDE4) : const Color(0xFFE0F7FA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: timerProvider.isWorkTime ? const Color(0xFFE8DCD1) : const Color(0xFFB2EBF2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                timerProvider.isWorkTime ? '🧠 Focus' : '☕ Short Break',
                style: TextStyle(
                  color: timerProvider.isWorkTime ? const Color(0xFF5D3B2E) : const Color(0xFF00796B),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              _formatTime(timerProvider.remainingTime),
              style: TextStyle(
                color: timerProvider.isWorkTime ? const Color(0xFF5D3B2E) : const Color(0xFF00796B),
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildControlButton(Icons.refresh, timerProvider.resetTimer),
                const SizedBox(width: 20),
                _buildControlButton(
                  timerProvider.isRunning ? Icons.pause : Icons.play_arrow,
                  timerProvider.isRunning
                      ? timerProvider.stopTimer
                      : timerProvider.startTimer,
                  isMain: true,
                ),
                const SizedBox(width: 20),
                _buildControlButton(
                  Icons.skip_next,
                  timerProvider.isWorkTime
                      ? timerProvider.switchToBreak
                      : timerProvider.switchToWork,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton(IconData icon, VoidCallback onPressed,
      {bool isMain = false}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        backgroundColor: isMain ? const Color(0xFFE57373) : const Color(0xFFE8DCD1),
        foregroundColor: const Color(0xFF5D3B2E),
      ),
      child: Icon(icon, size: 30),
    );
  }
}