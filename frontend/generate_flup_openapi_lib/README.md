# General
- Generate flup_openapi_lib
- Based on backend/swagger/swagger.json
- Needs to be regenerated when RestAPI changes
- Generate the DTO types, converting to json, sending via HTTP to backend

# Usage
1. Delete content of flup_openapi_lib folder - do not delete the folder itself
2. From this folder execute - `flutter pub run build_runner build --delete-conflicting-outputs`
3. After generating the flup_openapi_lib, check in the folder in an own new commit