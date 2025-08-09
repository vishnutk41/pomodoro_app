import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'timer_provider.dart';
import 'styles.dart';
import 'theme_data.dart';

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
    final theme = timerProvider.currentTheme;

    return Scaffold(
      backgroundColor: timerProvider.isWorkTime
          ? theme.workBackgroundColor
          : theme.breakBackgroundColor,
      appBar: AppBar(
        backgroundColor: timerProvider.isWorkTime
            ? theme.workBackgroundColor
            : theme.breakBackgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => _showThemeSelector(context, timerProvider),
            icon: Icon(
              Icons.settings,
              color: timerProvider.isWorkTime
                  ? theme.workTimerColor
                  : theme.breakTimerColor,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0.r),
              decoration: BoxDecoration(
                color: timerProvider.isWorkTime
                    ? theme.workBackgroundColor.withOpacity(0.8)
                    : theme.breakBackgroundColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                timerProvider.isWorkTime ? '🧠 Focus' : '☕ Short Break',
                style: AppStyles.modeTextStyle(
                  isWorkTime: timerProvider.isWorkTime,
                  color: timerProvider.isWorkTime
                      ? theme.workTimerColor
                      : theme.breakTimerColor,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _formatMinutes(timerProvider.remainingTime),
                  style: AppStyles.timerTextStyle(
                    isWorkTime: timerProvider.isWorkTime,
                    color: timerProvider.isWorkTime
                        ? theme.workTimerColor
                        : theme.breakTimerColor,
                  ),
                ),
                Text(
                  _formatSeconds(timerProvider.remainingTime),
                  style: AppStyles.timerTextStyle(
                    isWorkTime: timerProvider.isWorkTime,
                    color: timerProvider.isWorkTime
                        ? theme.workTimerColor
                        : theme.breakTimerColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildControlButton(Icons.refresh, timerProvider.resetTimer, theme, timerProvider.isWorkTime),
                SizedBox(width: 20.w),
                _buildControlButton(
                  timerProvider.isRunning ? Icons.pause : Icons.play_arrow,
                  timerProvider.toggleTimer,
                  theme,
                  timerProvider.isWorkTime,
                  isMain: true,
                ),
                SizedBox(width: 20.w),
                _buildControlButton(
                  Icons.skip_next,
                  timerProvider.isWorkTime
                      ? timerProvider.switchToBreak
                      : timerProvider.switchToWork,
                  theme,
                  timerProvider.isWorkTime,
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
    VoidCallback onPressed,
    AppTheme theme,
    bool isWorkTime, {
    bool isMain = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsets.all(20.r),
        backgroundColor: isMain
            ? theme.buttonColor
            : (isWorkTime ? theme.workBackgroundColor : theme.breakBackgroundColor).withOpacity(0.8),
        foregroundColor: isWorkTime ? theme.workTimerColor : theme.breakTimerColor,
      ),
      child: Icon(icon, size: 30.r),
    );
  }

  void _showThemeSelector(BuildContext context, TimerProvider timerProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Theme'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: AppThemeData.themes.length,
              itemBuilder: (BuildContext context, int index) {
                final theme = AppThemeData.themes[index];
                return ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(backgroundColor: theme.workBackgroundColor),
                      SizedBox(width: 5),
                      CircleAvatar(backgroundColor: theme.breakBackgroundColor),
                    ],
                  ),
                  title: Text('Theme ${index + 1}'),
                  onTap: () {
                    timerProvider.setTheme(index);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}