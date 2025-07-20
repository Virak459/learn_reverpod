import 'dart:io';
import 'package:logger/logger.dart';

final logger = Logger();

void main(List<String> args) {
  if (args.isEmpty) {
    logger.e('Please provide a feature name.');
    logger.e('Usage: dart scripts/create_new_mvvm_feature.dart feature_name');
    exit(1);
  }

  final featureName = args[0].toLowerCase();
  final featureNameCamelCase = _toCamelCase(featureName);
  final featureNamePascalCase = _toPascalCase(featureName);

  // Create feature directory
  final featureDir = Directory('lib/features/$featureName');
  if (featureDir.existsSync()) {
    logger.e('Feature "$featureName" already exists.');
    exit(1);
  }

  // Create subdirectories
  final modelDir = Directory('${featureDir.path}/models');
  final viewDir = Directory('${featureDir.path}/views');
  final viewModelDir = Directory('${featureDir.path}/viewmodels');
  final widgetDir = Directory('${featureDir.path}/widgets');

  featureDir.createSync(recursive: true);
  modelDir.createSync();
  viewDir.createSync();
  viewModelDir.createSync();
  widgetDir.createSync();

  // Create model file
  final modelFile = File('${modelDir.path}/${featureName}_model.dart');
  modelFile.writeAsStringSync('''
class ${featureNamePascalCase}Model {
  ${featureNamePascalCase}Model();
  
  // TODO: Add model properties and methods
}
''');

  // Create view file
  final viewFile = File('${viewDir.path}/${featureName}_view.dart');
  viewFile.writeAsStringSync('''
import 'package:flutter/material.dart';
import '../viewmodels/${featureName}_viewmodel.dart';
import '../widgets/${featureName}_widget.dart';

class ${featureNamePascalCase}View extends StatelessWidget {
  const ${featureNamePascalCase}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = ${featureNamePascalCase}ViewModel();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('$featureNamePascalCase'),
      ),
      body: ${featureNamePascalCase}Widget(viewModel: viewModel),
    );
  }
}
''');

  // Create viewmodel file
  final viewModelFile = File('${viewModelDir.path}/${featureName}_viewmodel.dart');
  viewModelFile.writeAsStringSync('''
import '../models/${featureName}_model.dart';

class ${featureNamePascalCase}ViewModel {
  final ${featureNamePascalCase}Model _model = ${featureNamePascalCase}Model();
  
  // TODO: Add viewmodel properties and methods
  String get featureName => '$featureNameCamelCase';
}
''');

  // Create widget file
  final widgetFile = File('${widgetDir.path}/${featureName}_widget.dart');
  widgetFile.writeAsStringSync('''
import 'package:flutter/material.dart';
import '../viewmodels/${featureName}_viewmodel.dart';

class ${featureNamePascalCase}Widget extends StatelessWidget {
  final ${featureNamePascalCase}ViewModel viewModel;
  
  const ${featureNamePascalCase}Widget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$featureNameCamelCase Widget'),
    );
  }
}
''');

  // Create barrel file for easy imports
  final barrelFile = File('${featureDir.path}/$featureName.dart');
  barrelFile.writeAsStringSync('''
export 'models/${featureName}_model.dart';
export 'views/${featureName}_view.dart';
export 'viewmodels/${featureName}_viewmodel.dart';
export 'widgets/${featureName}_widget.dart';
''');

  logger.i('Successfully created MVVM feature: $featureName');
  logger.i('Structure:');
  logger.i('lib/features/$featureName/');
  logger.i('├── models/');
  logger.i('│   └── ${featureName}_model.dart');
  logger.i('├── views/');
  logger.i('│   └── ${featureName}_view.dart');
  logger.i('├── viewmodels/');
  logger.i('│   └── ${featureName}_viewmodel.dart');
  logger.i('├── widgets/');
  logger.i('│   └── ${featureName}_widget.dart');
  logger.i('└── $featureName.dart (barrel file)');
}

String _toCamelCase(String text) {
  final words = text.split('_');
  var result = words[0];
  
  for (var i = 1; i < words.length; i++) {
    final word = words[i];
    if (word.isNotEmpty) {
      result += word[0].toUpperCase() + word.substring(1);
    }
  }
  
  return result;
}

String _toPascalCase(String text) {
  final words = text.split('_');
  final result = StringBuffer();
  
  for (final word in words) {
    if (word.isNotEmpty) {
      result.write(word[0].toUpperCase() + word.substring(1));
    }
  }
  
  return result.toString();
}
