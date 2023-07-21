import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties:
      AdditionalProperties(pubName: 'flup_openapi_lib', pubAuthor: 'Laura'),
  inputSpecFile: '../../backend/swagger/swagger.json',
  generatorName: Generator.dart,
  outputDirectory: '../flup_openapi_lib',
  alwaysRun: true,
  fetchDependencies: true,
)
class Example extends OpenapiGeneratorConfig {}
