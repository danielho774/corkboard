import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data/board_repository.dart';
import '../domain/board.dart';

class BoardFormModal extends ConsumerStatefulWidget {

  const BoardFormModal({super.key});


  @override
  ConsumerState<BoardFormModal> createState() => _BoardFormModalState();
}

class _BoardFormModalState extends ConsumerState<BoardFormModal> {

  // 1. Create the key
  final _formKey = GlobalKey<FormState>();
  
  // 2. Create controllers to get the text out later
  final _nameController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose(); // Always dispose controllers to avoid memory leaks
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true; // Start loading
      });


      try {
        final newEntry = await ref.read(boardRepositoryProvider)
          .createBoard(BoardEntry(name: _nameController.text,members: []));

        if(mounted) {
          context.push('/board/${newEntry.name}/${newEntry.id}');
        }
        
      } catch (error) {
        // Handle errors (e.g., show an error dialog)
        if(mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error submitting form: $error')));
        }

      } finally {
        setState(() {
          _isLoading = false; // End loading
        });
        if(mounted) {
          Navigator.of(context).pop();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey, // 3. Attach the key
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Board Name'),
              // 4. Add validation logic
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name for your board';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Create Board'),
                ),
          ],
        ),
      ),
    );
  }
}

