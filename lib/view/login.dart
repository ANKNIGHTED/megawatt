import 'package:flutter/material.dart';
import 'package:megawatt/utils/textstyles.dart';

/// This widget represents the login page of the application.
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: AppTextStyles.heading2(context)),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Login',
              textAlign: TextAlign.center,
              style: AppTextStyles.heading1(context),
            ),
            const SizedBox(height: 32),
            // Email Input Field
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Password Input Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Login Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement login logic here
                debugPrint('Login button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Login', style: AppTextStyles.button(context)),
            ),
            const SizedBox(height: 16),
            // Link to the sign-up page
            GestureDetector(
              onTap: () {
                // TODO: Implement navigation back to the sign-up page
                debugPrint('Navigate back to sign up');
                // You can use a Navigator push replacement to go back to the home/signup page
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(builder: (context) => const HomePage()),
                // );
              },
              child: Text(
                "Don't have an account? Sign Up",
                textAlign: TextAlign.center,
                style: AppTextStyles.body(context).copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
