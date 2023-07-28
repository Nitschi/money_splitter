# General
- Generate flup_openapi_lib
- Based on backend/swagger/swagger.json
- Needs to be regenerated when RestAPI changes
- Generate the DTO types, converting to json, sending via HTTP to backend

# Usage
1. Delete content of flup_openapi_lib folder - do not delete the folder itself
2. `cd <ReadmeDir>` to this folder
3. execute - `flutter pub get`
4. execute - `flutter pub run build_runner build --delete-conflicting-outputs`
5. After generating the flup_openapi_lib, check in the folder in an own new commit

# FAQ (from openapi_generator)

FAQ

Q: I run source gen (flutter pub run build_runner build --delete-conflicting-outputs), The api generator does not run.

A: The source generator of flutter only runs when there are changes to the file that has the annotation. If this ever happens, just go to the file that has the @openapi annotation and edit something in the file.