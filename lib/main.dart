import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Feeding',
      theme: ThemeData(
        fontFamily: 'ComicNeue',
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF8B5E3C), // Brown
          onPrimary: Colors.white,
          secondary: Color(0xFFC8AD7F), // Beige
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: Color(0xFFFFF8F0), // Light beige/white
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome to",
                style: TextStyle(fontSize: 24, color: colorScheme.onBackground),
              ),
              Text(
                "Pet Feeding",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Healthy Pets meals at your finger tips...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onBackground.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 30),
              Image.asset('dogcatt.png', height: 200),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  "Log in",
                  style: TextStyle(color: colorScheme.onPrimary),
                ),
              ),
              const SizedBox(height: 15),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: BorderSide(color: colorScheme.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  "Sign up",
                  style: TextStyle(color: colorScheme.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome\nBack",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email ID"),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Please enter your password' : null,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: const Text("Forgot?")),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: colorScheme.primary,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: colorScheme.onPrimary),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Or, login with"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.g_mobiledata, size: 32),
                  SizedBox(width: 20),
                  Icon(Icons.facebook, size: 32),
                  SizedBox(width: 20),
                  Icon(Icons.apple, size: 32),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: const Text("New to Pet Feeding? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('sign.png', height: 150),
              const SizedBox(height: 20),
              Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),
              const Text("Or, sign up with"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.g_mobiledata, size: 32),
                  SizedBox(width: 20),
                  Icon(Icons.facebook, size: 32),
                  SizedBox(width: 20),
                  Icon(Icons.apple, size: 32),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Full name"),
                validator:
                    (value) => value!.isEmpty ? 'Please enter your name' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email ID"),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Please enter your password' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: colorScheme.primary,
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(color: colorScheme.onPrimary),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Back to login
                },
                child: const Text("Already have an account? Log in"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedingSchedule {
  final DateTime time;
  final String label;
  final String measurement;

  FeedingSchedule({
    required this.time,
    required this.label,
    required this.measurement,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FeedingSchedule? nextFeeding;
  List<FeedingSchedule> feedingRecords = [];

  void _setFeedingSchedule() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date == null) return;

    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) return;

    final label = await _askForLabel();
    if (label == null || label.trim().isEmpty) return;

    final measurement = await _askForMeasurement();
    if (measurement == null || measurement.trim().isEmpty) return;

    setState(() {
      nextFeeding = FeedingSchedule(
        time: DateTime(date.year, date.month, date.day, time.hour, time.minute),
        label: label.trim(),
        measurement: measurement.trim(),
      );
      feedingRecords.add(nextFeeding!);
    });
  }

  Future<String?> _askForLabel() async {
    String label = '';
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Feeding Label'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'e.g., breakfast'),
            onChanged: (value) => label = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, label),
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<String?> _askForMeasurement() async {
    String input = '';
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter Measurement'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'e.g., 200g'),
            onChanged: (value) => input = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, input),
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Updated Header with settings menu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back_ios, size: 24),
                  const Text(
                    'Pet Feeder 5G',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.settings),
                    onSelected: (value) {
                      if (value == 'profile') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileEditScreen(),
                          ),
                        );
                      } else if (value == 'logout') {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      }
                    },
                    itemBuilder:
                        (context) => const [
                          PopupMenuItem(
                            value: 'profile',
                            child: Text('Edit Profile'),
                          ),
                          PopupMenuItem(
                            value: 'logout',
                            child: Text('Log Out'),
                          ),
                        ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue.shade100,
                child: Image.asset('assets/we.jpg', height: 80),
              ),
              const SizedBox(height: 10),
              const Text(
                "Standby",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                "Next time: ${nextFeeding != null ? "${nextFeeding!.time.toString().substring(0, 16)} | ${nextFeeding!.label} (${nextFeeding!.measurement})" : "Not Set"}",
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.schedule),
                  title: const Text("Feeding Schedule"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: _setFeedingSchedule,
                ),
              ),
              const SizedBox(height: 10),
              if (feedingRecords.isNotEmpty)
                ...feedingRecords.map((record) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(Icons.receipt_long),
                      title: Text(
                        "Feeding: ${record.label} (${record.measurement})",
                      ),
                      subtitle: Text(
                        "${record.time.toString().substring(0, 16)}",
                      ),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  );
                }).toList()
              else
                const Text(
                  "No feeding records yet.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Food dispensed!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Feed",
                  style: TextStyle(fontSize: 18, color: colorScheme.onPrimary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String? _imagePath;

  Future<void> _pickImage() async {
    // Simulating image picking, replace this with actual image picker logic
    // For real usage: Use image_picker package
    setState(() {
      _imagePath = 'assets/we.jpg'; // Just a placeholder
    });

    // Example using image_picker (uncomment after adding the dependency):
    // final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    // if (picked != null) {
    //   setState(() {
    //     _imagePath = picked.path;
    //   });
    // }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // You can now save or update profile data here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage:
                      _imagePath != null ? AssetImage(_imagePath!) : null,
                  child:
                      _imagePath == null
                          ? const Icon(Icons.add_a_photo, size: 30)
                          : null,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator:
                    (value) =>
                        value == null || value.trim().isEmpty
                            ? 'Please enter your name'
                            : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: colorScheme.primary,
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(color: colorScheme.onPrimary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
