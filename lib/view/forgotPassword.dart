import 'package:flutter/material.dart';
import 'package:megawatt/controller/services/authenticationServices/authenticationServices.dart';
import 'package:megawatt/utils/mybutton.dart';
import 'package:megawatt/utils/textfields.dart';
import 'package:megawatt/utils/textstyles.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final Authenticationservices _authService = Authenticationservices();

  void resetPassword() async {
    if (emailController.text.isEmpty) {
      _showErrorDialog("Please enter your email address.");
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await _authService.sendPasswordResetEmail(emailController.text.trim());

      if (mounted) Navigator.pop(context);

      _showSuccessDialog("Password reset link sent to your email!");
    } catch (e) {
      if (mounted) Navigator.pop(context);

      _showErrorDialog(
        "Failed to send link. Please check your email and try again.",
      );
      debugPrint('Password reset error: $e');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Success!"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Go back to Login screen
                },
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your email to receive a password reset link.",
                style: AppTextStyles.body(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: emailController,
                hintText: "Email Address",
                labelText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 25),
              Mybutton(text: "Send Link", onTap: resetPassword),
            ],
          ),
        ),
      ),
    );
  }
}
