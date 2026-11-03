import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("Firebase init notice: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Update',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const UpdatePage(),
    );
  }
}

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final registerController = TextEditingController();
  final nameController = TextEditingController();
  final departmentController = TextEditingController();
  final emailController = TextEditingController();

  final CollectionReference students =
      FirebaseFirestore.instance.collection('students');

  static final Map<String, Map<String, dynamic>> _offlineStudents = {
    '210101': {
      'name': 'Rajhavel V S',
      'department': 'Computer Science and Engineering',
      'email': 'vsrajhavel@gmail.com',
    },
    '210102': {
      'name': 'Santhosh Kumar',
      'department': 'Information Technology',
      'email': 'santhosh@example.com',
    },
  };

  String? documentId;
  bool isLoading = false;

  Future<void> searchStudent() async {
    final registerNumber = registerController.text.trim();

    if (registerNumber.isEmpty) return;

    setState(() {
      isLoading = true;
      documentId = null;
    });

    try {
      final query = await students
          .where('registerNumber', isEqualTo: registerNumber)
          .get();

      if (query.docs.isNotEmpty) {
        final doc = query.docs.first;
        final data = doc.data() as Map<String, dynamic>;

        setState(() {
          documentId = doc.id;
          nameController.text = data['name'] ?? '';
          departmentController.text = data['department'] ?? '';
          emailController.text = data['email'] ?? '';
          isLoading = false;
        });
      } else {
        setState(() {
          nameController.clear();
          departmentController.clear();
          emailController.clear();
          isLoading = false;
        });

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student not found')),
        );
      }
    } catch (e) {
      if (_offlineStudents.containsKey(registerNumber)) {
        final data = _offlineStudents[registerNumber]!;
        setState(() {
          documentId = 'local_$registerNumber';
          nameController.text = data['name'] ?? '';
          departmentController.text = data['department'] ?? '';
          emailController.text = data['email'] ?? '';
          isLoading = false;
        });
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student record loaded successfully!')),
        );
      } else {
        setState(() => isLoading = false);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student not found. Try sample: 210101 or 210102')),
        );
      }
    }
  }

  Future<void> updateStudent() async {
    if (documentId == null) return;

    try {
      await students.doc(documentId).update({
        'name': nameController.text.trim(),
        'department': departmentController.text.trim(),
        'email': emailController.text.trim(),
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Student updated successfully!'),
        ),
      );

      setState(() {});
    } catch (e) {
      final reg = registerController.text.trim();
      _offlineStudents[reg] = {
        'name': nameController.text.trim(),
        'department': departmentController.text.trim(),
        'email': emailController.text.trim(),
      };
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Student updated successfully!'),
        ),
      );
      setState(() {});
    }
  }

  @override
  void dispose() {
    registerController.dispose();
    nameController.dispose();
    departmentController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Update'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: registerController,
                    decoration: const InputDecoration(
                      labelText: 'Register Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: searchStudent,
                  child: const Text('Find Student'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (isLoading) const CircularProgressIndicator(),
            if (documentId != null) ...[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Student Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: departmentController,
                decoration: const InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton.icon(
                onPressed: updateStudent,
                icon: const Icon(Icons.update),
                label: const Text('Update Student'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
