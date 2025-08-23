import 'package:flutter/material.dart';
import 'patient/home.dart';
import 'caregiver/home.dart';
import 'doctor/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = 'Patient';
  final TextEditingController patientIdController = TextEditingController();
  final TextEditingController doctorIdController = TextEditingController();
  final TextEditingController caregiverCodeController = TextEditingController();

  String? patientIdError;
  String? doctorIdError;
  String? caregiverCodeError;

  @override
  void dispose() {
    patientIdController.dispose();
    doctorIdController.dispose();
    caregiverCodeController.dispose();
    super.dispose();
  }

  // A helper getter to check if the sign-in button should be enabled
  bool get _isLoginButtonEnabled {
    switch (selectedRole) {
      case 'Patient':
        return patientIdController.text.isNotEmpty &&
            doctorIdController.text.isNotEmpty;
      case 'Doctor':
        return doctorIdController.text.isNotEmpty;
      case 'Caregiver':
        return caregiverCodeController.text.isNotEmpty;
      default:
        return false;
    }
  }

  Widget _buildRoleButton(String role) {
    bool isSelected = selectedRole == role;
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            selectedRole = role;
            // Clear any previous errors when the role changes
            patientIdError = null;
            doctorIdError = null;
            caregiverCodeError = null;
          });
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.5),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: isSelected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          role,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginFields() {
    return Column(
      children: [
        if (selectedRole == 'Patient' || selectedRole == 'Doctor')
          TextField(
            controller: doctorIdController,
            onChanged: (text) => setState(() {}),
            decoration: InputDecoration(
              labelText: 'Doctor ID',
              errorText: doctorIdError,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).colorScheme.surface,
              filled: true,
            ),
          ),
        if (selectedRole == 'Patient') const SizedBox(height: 16),
        if (selectedRole == 'Patient')
          TextField(
            controller: patientIdController,
            onChanged: (text) => setState(() {}),
            decoration: InputDecoration(
              labelText: 'Patient ID',
              errorText: patientIdError,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).colorScheme.surface,
              filled: true,
            ),
          ),
        if (selectedRole == 'Caregiver')
          TextField(
            controller: caregiverCodeController,
            onChanged: (text) => setState(() {}),
            decoration: InputDecoration(
              labelText: 'Special Caregiver Code',
              errorText: caregiverCodeError,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).colorScheme.surface,
              filled: true,
            ),
          ),
      ],
    );
  }

  void _handleLogin(BuildContext context) {
    setState(() {
      // Reset errors before validation
      patientIdError = null;
      doctorIdError = null;
      caregiverCodeError = null;
    });

    bool isValid = true;

    switch (selectedRole) {
      case 'Patient':
        if (patientIdController.text.isEmpty) {
          setState(() {
            patientIdError = 'Patient ID is required.';
          });
          isValid = false;
        }
        if (doctorIdController.text.isEmpty) {
          setState(() {
            doctorIdError = 'Doctor ID is required.';
          });
          isValid = false;
        }
        if (isValid) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PatientHomeScreen(
                patientId: patientIdController.text,
                doctorId: doctorIdController.text,
              ),
            ),
          );
        }
        break;
      case 'Doctor':
        if (doctorIdController.text.isEmpty) {
          setState(() {
            doctorIdError = 'Doctor ID is required.';
          });
          isValid = false;
        }
        if (isValid) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorHomeScreen(
                doctorId: doctorIdController.text,
              ),
            ),
          );
        }
        break;
      case 'Caregiver':
        if (caregiverCodeController.text.isEmpty) {
          setState(() {
            caregiverCodeError = 'Caregiver Code is required.';
          });
          isValid = false;
        }
        if (isValid) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CaregiverHomeScreen(
                caregiverId: caregiverCodeController.text,
              ),
            ),
          );
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size to make the UI responsive
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                screenSize.width * 0.08, // Responsive horizontal padding
            vertical: screenSize.height * 0.05, // Responsive vertical padding
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenSize.height * 0.1), // Top spacing
              // Welcome Back Text
              Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              // Subtitle
              Text(
                'Sign in to your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7),
                ),
              ),
              SizedBox(height: screenSize.height * 0.08),
              // Role selection text
              Text(
                'Select your role',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 16),
              // Role selection buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRoleButton('Patient'),
                  const SizedBox(width: 10),
                  _buildRoleButton('Doctor'),
                  const SizedBox(width: 10),
                  _buildRoleButton('Caregiver'),
                ],
              ),
              SizedBox(height: screenSize.height * 0.04),
              // Dynamically loaded fields
              _buildLoginFields(),
              const SizedBox(height: 24),
              // Sign In button
              ElevatedButton(
                onPressed:
                    _isLoginButtonEnabled ? () => _handleLogin(context) : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isLoginButtonEnabled
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.1),
                  foregroundColor: _isLoginButtonEnabled
                      ? Theme.of(context).colorScheme.onSecondary
                      : Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Forgot Password link
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.1),
              // Don't have an account text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.7))),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
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
    );
  }
}
