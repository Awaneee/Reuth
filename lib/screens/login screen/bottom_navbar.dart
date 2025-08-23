import 'package:flutter/material.dart';

class AuthBar extends StatefulWidget {
  const AuthBar({
    super.key,
    required this.isEnabled,
    required this.onSignIn,
    required this.colorScheme,
  });

  final bool isEnabled;
  final VoidCallback onSignIn;
  final ColorScheme colorScheme;

  @override
  State<AuthBar> createState() => _AuthBarState();
}

class _AuthBarState extends State<AuthBar> {
  @override
  Widget build(BuildContext context) {
    final keyboard =
        MediaQuery.of(context).viewInsets.bottom; // keyboard height
    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: keyboard > 0 ? keyboard : 0),
      child: Material(
        color: widget.colorScheme.surface,
        elevation: 8,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: widget.isEnabled ? widget.onSignIn : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.isEnabled
                          ? widget.colorScheme.secondary
                          : widget.colorScheme.surfaceContainerHighest,
                      foregroundColor: widget.isEnabled
                          ? widget.colorScheme.onSecondary
                          : widget.colorScheme.onSurface.withValues(alpha: 0.7),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color:
                            widget.colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: widget.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
