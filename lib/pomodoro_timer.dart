import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'timer_provider.dart';
import 'styles.dart';

class PomodoroTimer extends StatelessWidget {
  const PomodoroTimer({super.key});

  String _formatMinutes(int seconds) {
    return (seconds ~/ 60).toString().padLeft(2, '0');
  }

  String _formatSeconds(int seconds) {
    return (seconds % 60).toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    return Scaffold(
      backgroundColor: timerProvider.isWorkTime
          ? const Color(0xFFF4EDE4)
          : const Color(0xFFE0F7FA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0.r),
              decoration: BoxDecoration(
                color: timerProvider.isWorkTime
                    ? const Color(0xFFE8DCD1)
                    : const Color(0xFFB2EBF2),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                timerProvider.isWorkTime ? '🧠 Focus' : '☕ Short Break',
                style: AppStyles.modeTextStyle(isWorkTime: timerProvider.isWorkTime),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _formatMinutes(timerProvider.remainingTime),
                  style: AppStyles.timerTextStyle(isWorkTime: timerProvider.isWorkTime),
                ),
                Text(
                  _formatSeconds(timerProvider.remainingTime),
                  style: AppStyles.timerTextStyle(isWorkTime: timerProvider.isWorkTime),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildControlButton(Icons.refresh, timerProvider.resetTimer),
                SizedBox(width: 20.w),
                _buildControlButton(
                  timerProvider.isRunning ? Icons.pause : Icons.play_arrow,
                  timerProvider.toggleTimer,
                  isMain: true,
                ),
                SizedBox(width: 20.w),
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

  Widget _buildControlButton(
    IconData icon,
    VoidCallback onPressed, {
    bool isMain = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsets.all(20.r),
        backgroundColor:
            isMain ? const Color(0xFFE57373) : const Color(0xFFE8DCD1),
        foregroundColor: const Color(0xFF5D3B2E),
      ),
      child: Icon(icon, size: 50.r),
    );
  }
}