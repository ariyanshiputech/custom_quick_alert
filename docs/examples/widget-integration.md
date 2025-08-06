# 🧩 Widget Integration Guide

This guide demonstrates how to integrate Custom Quick Alert with various Flutter widgets and patterns for seamless user experiences.

## 📋 Table of Contents

- [Form Integration](#-form-integration)
- [List & ListView Integration](#-list--listview-integration)
- [Navigation Integration](#-navigation-integration)
- [State Management Integration](#-state-management-integration)
- [Dialog Replacement Patterns](#-dialog-replacement-patterns)
- [Scaffold Integration](#-scaffold-integration)
- [Custom Widget Patterns](#-custom-widget-patterns)

## 📝 Form Integration

### Basic Form Validation

```dart
class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  
  void _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      CustomQuickAlert.warning(
        title: 'Form Validation Error',
        message: 'Please fill in all required fields correctly.',
        position: QuickAlertPosition.top,
      );
      return;
    }

    // Show loading
    CustomQuickAlert.loading(
      title: 'Submitting Form',
      message: 'Please wait while we process your information...',
    );

    try {
      await _submitToServer();
      CustomQuickAlert.dismiss();
      
      CustomQuickAlert.success(
        title: 'Form Submitted!',
        message: 'Your information has been successfully submitted.',
        onConfirm: () => Navigator.pop(context),
      );
    } catch (e) {
      CustomQuickAlert.dismiss();
      
      CustomQuickAlert.error(
        title: 'Submission Failed',
        message: 'Unable to submit form. Please try again.',
        confirmText: 'Retry',
        onConfirm: () => _submitForm(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Example')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Name is required';
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Email is required';
                  if (!value!.contains('@')) return 'Invalid email format';
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit Form'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitToServer() async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));
    // Throw exception for demo
    // throw Exception('Network error');
  }
}
```

### Advanced Form with Field-Level Validation

```dart
class AdvancedFormWidget extends StatefulWidget {
  @override
  _AdvancedFormWidgetState createState() => _AdvancedFormWidgetState();
}

class _AdvancedFormWidgetState extends State<AdvancedFormWidget> {
  final Map<String, TextEditingController> _controllers = {
    'name': TextEditingController(),
    'email': TextEditingController(),
    'phone': TextEditingController(),
    'address': TextEditingController(),
  };
  
  final Map<String, String?> _errors = {};
  
  void _validateField(String field, String value) {
    setState(() {
      switch (field) {
        case 'name':
          _errors[field] = value.length < 2 ? 'Name must be at least 2 characters' : null;
          break;
        case 'email':
          _errors[field] = !value.contains('@') ? 'Invalid email format' : null;
          break;
        case 'phone':
          _errors[field] = value.length < 10 ? 'Phone must be at least 10 digits' : null;
          break;
        case 'address':
          _errors[field] = value.length < 5 ? 'Address must be at least 5 characters' : null;
          break;
      }
    });
    
    // Show inline validation alert for critical errors
    if (_errors[field] != null && value.isNotEmpty) {
      CustomQuickAlert.warning(
        title: 'Field Validation',
        message: _errors[field]!,
        position: QuickAlertPosition.top,
        autoCloseDuration: Duration(seconds: 2),
        showConfirm: false,
      );
    }
  }
  
  void _submitAdvancedForm() {
    final hasErrors = _errors.values.any((error) => error != null);
    final hasEmptyFields = _controllers.values.any((controller) => controller.text.isEmpty);
    
    if (hasErrors || hasEmptyFields) {
      final errorMessages = <String>[];
      
      _controllers.forEach((field, controller) {
        if (controller.text.isEmpty) {
          errorMessages.add('${field.toUpperCase()} is required');
        } else if (_errors[field] != null) {
          errorMessages.add(_errors[field]!);
        }
      });
      
      CustomQuickAlert.error(
        title: 'Form Validation Failed',
        message: 'Please fix the following issues:\n\n${errorMessages.join('\n')}',
        width: 350,
      );
      return;
    }
    
    CustomQuickAlert.success(
      title: 'Validation Passed',
      message: 'All fields are valid. Submitting form...',
      onConfirm: () => _processFormSubmission(),
    );
  }
  
  void _processFormSubmission() async {
    CustomQuickAlert.loading(
      title: 'Processing...',
      message: 'Submitting your information securely.',
    );
    
    await Future.delayed(Duration(seconds: 3));
    CustomQuickAlert.dismiss();
    
    CustomQuickAlert.success(
      title: 'Success!',
      message: 'Your form has been submitted successfully.',
      confirmText: 'Continue',
      onConfirm: () => Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Advanced Form')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: _controllers.entries.map((entry) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: TextFormField(
                controller: entry.value,
                decoration: InputDecoration(
                  labelText: entry.key.toUpperCase(),
                  errorText: _errors[entry.key],
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _validateField(entry.key, value),
              ),
            );
          }).toList()
            ..add(
              SizedBox(height: 32),
            )
            ..add(
              ElevatedButton(
                onPressed: _submitAdvancedForm,
                child: Text('Submit Advanced Form'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
        ),
      ),
    );
  }
}
```

## 📋 List & ListView Integration

### Delete Confirmation in Lists

```dart
class TodoListWidget extends StatefulWidget {
  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  List<TodoItem> _todos = [
    TodoItem(id: '1', title: 'Buy groceries', completed: false),
    TodoItem(id: '2', title: 'Walk the dog', completed: true),
    TodoItem(id: '3', title: 'Finish project', completed: false),
    TodoItem(id: '4', title: 'Call mom', completed: false),
  ];

  void _deleteTodoWithConfirmation(TodoItem todo) {
    CustomQuickAlert.confirm(
      title: 'Delete Todo',
      message: 'Are you sure you want to delete "${todo.title}"?',
      confirmText: 'Delete',
      cancelText: 'Cancel',
      showCancel: true,
      confirmBtnColor: Colors.red,
      position: QuickAlertPosition.center,
      onConfirm: () => _deleteTodo(todo),
    );
  }

  void _deleteTodo(TodoItem todo) {
    setState(() {
      _todos.removeWhere((item) => item.id == todo.id);
    });

    CustomQuickAlert.success(
      title: 'Todo Deleted',
      message: '"${todo.title}" has been removed from your list.',
      autoCloseDuration: Duration(seconds: 2),
      showConfirm: false,
      position: QuickAlertPosition.bottom,
    );
  }

  void _toggleTodoCompletion(TodoItem todo) {
    setState(() {
      todo.completed = !todo.completed;
    });

    if (todo.completed) {
      CustomQuickAlert.success(
        title: 'Task Completed!',
        message: 'Great job completing "${todo.title}"',
        autoCloseDuration: Duration(seconds: 2),
        showConfirm: false,
        position: QuickAlertPosition.top,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Checkbox(
                value: todo.completed,
                onChanged: (_) => _toggleTodoCompletion(todo),
              ),
              title: Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.completed ? TextDecoration.lineThrough : null,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteTodoWithConfirmation(todo),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog() {
    final controller = TextEditingController();
    
    CustomQuickAlert.custom(
      title: 'Add New Todo',
      customContent: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter todo title...',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
      ),
      confirmText: 'Add',
      cancelText: 'Cancel',
      showCancel: true,
      onConfirm: () {
        if (controller.text.isNotEmpty) {
          _addTodo(controller.text);
        }
      },
    );
  }

  void _addTodo(String title) {
    setState(() {
      _todos.add(TodoItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        completed: false,
      ));
    });

    CustomQuickAlert.success(
      title: 'Todo Added',
      message: '"$title" has been added to your list.',
      autoCloseDuration: Duration(seconds: 2),
      showConfirm: false,
    );
  }
}

class TodoItem {
  final String id;
  final String title;
  bool completed;

  TodoItem({required this.id, required this.title, required this.completed});
}
```

## 🧭 Navigation Integration

### Navigation with Confirmation

```dart
class NavigationExampleWidget extends StatelessWidget {
  void _navigateWithConfirmation(BuildContext context, String destination) {
    CustomQuickAlert.confirm(
      title: 'Navigate to $destination',
      message: 'You are about to leave this page. Do you want to continue?',
      confirmText: 'Continue',
      cancelText: 'Stay',
      showCancel: true,
      onConfirm: () => _performNavigation(context, destination),
    );
  }

  void _performNavigation(BuildContext context, String destination) {
    CustomQuickAlert.loading(
      title: 'Loading $destination',
      message: 'Please wait...',
    );

    // Simulate loading time
    Future.delayed(Duration(seconds: 1), () {
      CustomQuickAlert.dismiss();
      
      Navigator.pushNamed(context, '/$destination').then((_) {
        CustomQuickAlert.info(
          title: 'Welcome Back',
          message: 'You have returned from $destination.',
          autoCloseDuration: Duration(seconds: 2),
          showConfirm: false,
        );
      });
    });
  }

  void _showNavigationMenu(BuildContext context) {
    final destinations = ['home', 'profile', 'settings', 'about'];
    
    CustomQuickAlert.custom(
      title: 'Choose Destination',
      customContent: Column(
        mainAxisSize: MainAxisSize.min,
        children: destinations.map((dest) => 
          ListTile(
            title: Text(dest.toUpperCase()),
            leading: Icon(_getIconForDestination(dest)),
            onTap: () {
              CustomQuickAlert.dismiss();
              _navigateWithConfirmation(context, dest);
            },
          ),
        ).toList(),
      ),
      showConfirm: false,
      showCancel: true,
      cancelText: 'Cancel',
    );
  }

  IconData _getIconForDestination(String dest) {
    switch (dest) {
      case 'home': return Icons.home;
      case 'profile': return Icons.person;
      case 'settings': return Icons.settings;
      case 'about': return Icons.info;
      default: return Icons.navigate_next;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showNavigationMenu(context),
              child: Text('Show Navigation Menu'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _navigateWithConfirmation(context, 'Settings'),
              child: Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Back Button Override

```dart
class FormWithUnsavedChanges extends StatefulWidget {
  @override
  _FormWithUnsavedChangesState createState() => _FormWithUnsavedChangesState();
}

class _FormWithUnsavedChangesState extends State<FormWithUnsavedChanges> {
  bool _hasUnsavedChanges = false;
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _hasUnsavedChanges = _textController.text.isNotEmpty;
      });
    });
  }

  Future<bool> _onWillPop() async {
    if (!_hasUnsavedChanges) return true;

    CustomQuickAlert.warning(
      title: 'Unsaved Changes',
      message: 'You have unsaved changes. Are you sure you want to leave?',
      confirmText: 'Leave',
      cancelText: 'Stay',
      showCancel: true,
      confirmBtnColor: Colors.red,
      onConfirm: () => Navigator.of(context).pop(true),
      onCancel: () => Navigator.of(context).pop(false),
    );

    return false; // Prevent immediate navigation
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Form with Unsaved Changes'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              final shouldPop = await _onWillPop();
              if (shouldPop) Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Your input',
                  hintText: 'Type something...',
                ),
                maxLines: 5,
              ),
              SizedBox(height: 16),
              if (_hasUnsavedChanges)
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.warning, color: Colors.orange),
                      SizedBox(width: 8),
                      Text('You have unsaved changes'),
                    ],
                  ),
                ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _saveChanges,
                      child: Text('Save'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _discardChanges,
                      child: Text('Discard'),
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

  void _saveChanges() {
    CustomQuickAlert.loading(
      title: 'Saving...',
      message: 'Please wait while we save your changes.',
    );

    Future.delayed(Duration(seconds: 2), () {
      CustomQuickAlert.dismiss();
      setState(() {
        _hasUnsavedChanges = false;
      });
      
      CustomQuickAlert.success(
        title: 'Changes Saved',
        message: 'Your changes have been saved successfully.',
        onConfirm: () => Navigator.of(context).pop(),
      );
    });
  }

  void _discardChanges() {
    CustomQuickAlert.warning(
      title: 'Discard Changes',
      message: 'Are you sure you want to discard all changes?',
      confirmText: 'Discard',
      cancelText: 'Keep',
      showCancel: true,
      confirmBtnColor: Colors.red,
      onConfirm: () {
        setState(() {
          _textController.clear();
          _hasUnsavedChanges = false;
        });
        
        CustomQuickAlert.info(
          title: 'Changes Discarded',
          message: 'All changes have been discarded.',
          autoCloseDuration: Duration(seconds: 2),
          showConfirm: false,
        );
      },
    );
  }
}
```

## 🏗️ State Management Integration

### Provider Integration

```dart
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
    
    if (_count % 10 == 0) {
      CustomQuickAlert.success(
        title: 'Milestone Reached!',
        message: 'You have reached $_count clicks!',
        autoCloseDuration: Duration(seconds: 2),
        showConfirm: false,
        position: QuickAlertPosition.top,
      );
    }
  }

  void reset() {
    CustomQuickAlert.confirm(
      title: 'Reset Counter',
      message: 'Are you sure you want to reset the counter to 0?',
      confirmText: 'Reset',
      cancelText: 'Cancel',
      showCancel: true,
      onConfirm: () {
        _count = 0;
        notifyListeners();
        
        CustomQuickAlert.success(
          title: 'Counter Reset',
          message: 'The counter has been reset to 0.',
          autoCloseDuration: Duration(seconds: 2),
          showConfirm: false,
        );
      },
    );
  }

  void saveCount() async {
    CustomQuickAlert.loading(
      title: 'Saving Count',
      message: 'Saving current count to storage...',
    );

    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));
      await _saveToStorage(_count);
      
      CustomQuickAlert.dismiss();
      CustomQuickAlert.success(
        title: 'Count Saved',
        message: 'Your count of $_count has been saved successfully.',
      );
    } catch (e) {
      CustomQuickAlert.dismiss();
      CustomQuickAlert.error(
        title: 'Save Failed',
        message: 'Unable to save count. Please try again.',
        confirmText: 'Retry',
        onConfirm: () => saveCount(),
      );
    }
  }

  Future<void> _saveToStorage(int count) async {
    // Simulate storage operation
    await Future.delayed(Duration(milliseconds: 500));
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counter, child) {
        return Scaffold(
          appBar: AppBar(title: Text('Counter with Alerts')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Count: ${counter.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: counter.increment,
                      child: Text('Increment'),
                    ),
                    ElevatedButton(
                      onPressed: counter.reset,
                      child: Text('Reset'),
                    ),
                    ElevatedButton(
                      onPressed: counter.saveCount,
                      child: Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
```

### BLoC Integration

```dart
// Events
abstract class CounterEvent {}
class IncrementCounter extends CounterEvent {}
class ResetCounter extends CounterEvent {}
class SaveCounter extends CounterEvent {}

// States
abstract class CounterState {}
class CounterInitial extends CounterState {}
class CounterUpdated extends CounterState {
  final int count;
  CounterUpdated(this.count);
}
class CounterSaving extends CounterState {}
class CounterSaved extends CounterState {}
class CounterError extends CounterState {
  final String message;
  CounterError(this.message);
}

// BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _count = 0;

  CounterBloc() : super(CounterInitial()) {
    on<IncrementCounter>(_onIncrement);
    on<ResetCounter>(_onReset);
    on<SaveCounter>(_onSave);
  }

  void _onIncrement(IncrementCounter event, Emitter<CounterState> emit) {
    _count++;
    emit(CounterUpdated(_count));
    
    if (_count % 10 == 0) {
      CustomQuickAlert.success(
        title: 'Milestone!',
        message: 'You reached $_count!',
        autoCloseDuration: Duration(seconds: 2),
        showConfirm: false,
      );
    }
  }

  void _onReset(ResetCounter event, Emitter<CounterState> emit) {
    CustomQuickAlert.confirm(
      title: 'Reset Counter',
      message: 'Reset count to 0?',
      onConfirm: () {
        _count = 0;
        emit(CounterUpdated(_count));
      },
    );
  }

  void _onSave(SaveCounter event, Emitter<CounterState> emit) async {
    emit(CounterSaving());
    
    CustomQuickAlert.loading(
      title: 'Saving...',
      message: 'Saving count to server.',
    );

    try {
      await Future.delayed(Duration(seconds: 2));
      emit(CounterSaved());
      
      CustomQuickAlert.dismiss();
      CustomQuickAlert.success(
        title: 'Saved!',
        message: 'Count saved successfully.',
      );
    } catch (e) {
      emit(CounterError('Failed to save'));
      
      CustomQuickAlert.dismiss();
      CustomQuickAlert.error(
        title: 'Save Failed',
        message: 'Unable to save. Try again?',
        confirmText: 'Retry',
        onConfirm: () => add(SaveCounter()),
      );
    }
  }
}

class BlocCounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        int count = 0;
        if (state is CounterUpdated) count = state.count;

        return Scaffold(
          appBar: AppBar(title: Text('BLoC Counter')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Count: $count'),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
                      child: Text('Increment'),
                    ),
                    ElevatedButton(
                      onPressed: () => context.read<CounterBloc>().add(ResetCounter()),
                      child: Text('Reset'),
                    ),
                    ElevatedButton(
                      onPressed: () => context.read<CounterBloc>().add(SaveCounter()),
                      child: Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
```

## 🔄 Dialog Replacement Patterns

### Replacing ShowDialog

```dart
// Instead of using showDialog
void _showOldStyleDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Old Style'),
      content: Text('This is the old way'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    ),
  );
}

// Use CustomQuickAlert instead
void _showNewStyleAlert() {
  CustomQuickAlert.info(
    title: 'Modern Style',
    message: 'This is the new way with CustomQuickAlert',
    confirmText: 'Great!',
  );
}
```

### Replacing ShowModalBottomSheet

```dart
// Instead of showModalBottomSheet
void _showOldBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Choose an option'),
          ListTile(
            title: Text('Option 1'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Option 2'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    ),
  );
}

// Use CustomQuickAlert with bottom position
void _showNewBottomAlert() {
  CustomQuickAlert.custom(
    title: 'Choose an option',
    position: QuickAlertPosition.bottom,
    customContent: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('Option 1'),
          leading: Icon(Icons.star),
          onTap: () {
            CustomQuickAlert.dismiss();
            _handleOption1();
          },
        ),
        ListTile(
          title: Text('Option 2'),
          leading: Icon(Icons.favorite),
          onTap: () {
            CustomQuickAlert.dismiss();
            _handleOption2();
          },
        ),
      ],
    ),
    showConfirm: false,
    showCancel: true,
    cancelText: 'Close',
  );
}

void _handleOption1() {
  CustomQuickAlert.success(
    title: 'Option 1 Selected',
    message: 'You chose the first option.',
  );
}

void _handleOption2() {
  CustomQuickAlert.success(
    title: 'Option 2 Selected',
    message: 'You chose the second option.',
  );
}
```

## 📱 Scaffold Integration

### Replacing SnackBar

```dart
class SnackBarReplacementExample extends StatelessWidget {
  void _showOldSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('This is a traditional SnackBar'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {},
        ),
      ),
    );
  }

  void _showNewTopAlert() {
    CustomQuickAlert.success(
      title: 'Action Completed',
      message: 'This is a modern top alert replacement',
      position: QuickAlertPosition.top,
      autoCloseDuration: Duration(seconds: 3),
      showConfirm: false,
      width: double.infinity,
      backgroundColor: Colors.green.shade50,
    );
  }

  void _showUndoAlert() {
    CustomQuickAlert.warning(
      title: 'Item Deleted',
      message: 'The item has been removed from your list.',
      position: QuickAlertPosition.bottom,
      confirmText: 'UNDO',
      cancelText: 'OK',
      showCancel: true,
      autoCloseDuration: Duration(seconds: 5),
      onConfirm: () {
        CustomQuickAlert.success(
          title: 'Restored',
          message: 'Item has been restored to your list.',
          autoCloseDuration: Duration(seconds: 2),
          showConfirm: false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SnackBar Replacement')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showOldSnackBar(context),
              child: Text('Show Old SnackBar'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showNewTopAlert,
              child: Text('Show New Top Alert'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showUndoAlert,
              child: Text('Show Undo Alert'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🎨 Custom Widget Patterns

### Loading Overlay Widget

```dart
class LoadingOverlayWidget extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final String? loadingMessage;

  const LoadingOverlayWidget({
    Key? key,
    required this.child,
    required this.isLoading,
    this.loadingMessage,
  }) : super(key: key);

  @override
  _LoadingOverlayWidgetState createState() => _LoadingOverlayWidgetState();
}

class _LoadingOverlayWidgetState extends State<LoadingOverlayWidget> {
  bool _wasLoading = false;

  @override
  void didUpdateWidget(LoadingOverlayWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.isLoading && !_wasLoading) {
      // Show loading alert
      CustomQuickAlert.loading(
        title: 'Loading',
        message: widget.loadingMessage ?? 'Please wait...',
      );
    } else if (!widget.isLoading && _wasLoading) {
      // Dismiss loading alert
      CustomQuickAlert.dismiss();
    }
    
    _wasLoading = widget.isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

// Usage example
class DataListWidget extends StatefulWidget {
  @override
  _DataListWidgetState createState() => _DataListWidgetState();
}

class _DataListWidgetState extends State<DataListWidget> {
  bool _isLoading = false;
  List<String> _data = [];

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        _data = List.generate(10, (index) => 'Item ${index + 1}');
        _isLoading = false;
      });

      CustomQuickAlert.success(
        title: 'Data Loaded',
        message: 'Successfully loaded ${_data.length} items.',
        autoCloseDuration: Duration(seconds: 2),
        showConfirm: false,
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      CustomQuickAlert.error(
        title: 'Loading Failed',
        message: 'Unable to load data. Please try again.',
        confirmText: 'Retry',
        onConfirm: () => _loadData(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlayWidget(
      isLoading: _isLoading,
      loadingMessage: 'Loading your data...',
      child: Scaffold(
        appBar: AppBar(title: Text('Data List')),
        body: _data.isEmpty
            ? Center(
                child: ElevatedButton(
                  onPressed: _loadData,
                  child: Text('Load Data'),
                ),
              )
            : ListView.builder(
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_data[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: _loadData,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
```

### Alert Manager Service

```dart
class AlertService {
  static void showNetworkError({VoidCallback? onRetry}) {
    CustomQuickAlert.error(
      title: 'Network Error',
      message: 'Please check your internet connection and try again.',
      confirmText: onRetry != null ? 'Retry' : 'OK',
      showCancel: onRetry != null,
      cancelText: 'Cancel',
      onConfirm: onRetry,
    );
  }

  static void showValidationError(List<String> errors) {
    CustomQuickAlert.warning(
      title: 'Validation Error',
      message: 'Please fix the following issues:\n\n${errors.join('\n')}',
      width: 350,
    );
  }

  static void showSuccessWithNavigation(String title, String message, VoidCallback onNavigate) {
    CustomQuickAlert.success(
      title: title,
      message: message,
      confirmText: 'Continue',
      onConfirm: onNavigate,
    );
  }

  static void showLoadingWithProgress(String operation) {
    CustomQuickAlert.loading(
      title: 'Processing',
      message: 'Currently $operation...',
    );
  }

  static void showCustomChoice({
    required String title,
    required List<ChoiceOption> options,
  }) {
    CustomQuickAlert.custom(
      title: title,
      customContent: Column(
        mainAxisSize: MainAxisSize.min,
        children: options.map((option) => 
          ListTile(
            title: Text(option.title),
            subtitle: option.subtitle != null ? Text(option.subtitle!) : null,
            leading: option.icon != null ? Icon(option.icon) : null,
            onTap: () {
              CustomQuickAlert.dismiss();
              option.onTap();
            },
          ),
        ).toList(),
      ),
      showConfirm: false,
      showCancel: true,
      cancelText: 'Cancel',
    );
  }
}

class ChoiceOption {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback onTap;

  ChoiceOption({
    required this.title,
    this.subtitle,
    this.icon,
    required this.onTap,
  });
}

// Usage examples
class AlertServiceExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Service Examples')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => AlertService.showNetworkError(
                onRetry: () => print('Retrying...'),
              ),
              child: Text('Show Network Error'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => AlertService.showValidationError([
                'Name is required',
                'Email format is invalid',
                'Password must be at least 8 characters',
              ]),
              child: Text('Show Validation Error'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => AlertService.showCustomChoice(
                title: 'Choose an Action',
                options: [
                  ChoiceOption(
                    title: 'Edit Item',
                    subtitle: 'Modify the selected item',
                    icon: Icons.edit,
                    onTap: () => print('Edit selected'),
                  ),
                  ChoiceOption(
                    title: 'Share Item',
                    subtitle: 'Share with others',
                    icon: Icons.share,
                    onTap: () => print('Share selected'),
                  ),
                  ChoiceOption(
                    title: 'Delete Item',
                    subtitle: 'Remove permanently',
                    icon: Icons.delete,
                    onTap: () => print('Delete selected'),
                  ),
                ],
              ),
              child: Text('Show Custom Choice'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

This comprehensive widget integration guide demonstrates how to seamlessly integrate Custom Quick Alert with various Flutter patterns and widgets, providing a foundation for creating professional and user-friendly applications.
