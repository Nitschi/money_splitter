# flup_openapi_lib.api.ExpensesApi

## Load the API package
```dart
import 'package:flup_openapi_lib/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addExpense**](ExpensesApi.md#addexpense) | **POST** /Expenses | 
[**getExpenses**](ExpensesApi.md#getexpenses) | **GET** /Expenses | 
[**removeExpense**](ExpensesApi.md#removeexpense) | **DELETE** /Expenses | 


# **addExpense**
> ExpenseDto addExpense(expenseDto)



### Example
```dart
import 'package:flup_openapi_lib/api.dart';

final api_instance = ExpensesApi();
final expenseDto = ExpenseDto(); // ExpenseDto | 

try {
    final result = api_instance.addExpense(expenseDto);
    print(result);
} catch (e) {
    print('Exception when calling ExpensesApi->addExpense: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **expenseDto** | [**ExpenseDto**](ExpenseDto.md)|  | [optional] 

### Return type

[**ExpenseDto**](ExpenseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExpenses**
> List<ExpenseDto> getExpenses()



### Example
```dart
import 'package:flup_openapi_lib/api.dart';

final api_instance = ExpensesApi();

try {
    final result = api_instance.getExpenses();
    print(result);
} catch (e) {
    print('Exception when calling ExpensesApi->getExpenses: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<ExpenseDto>**](ExpenseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeExpense**
> removeExpense(expenseDto)



### Example
```dart
import 'package:flup_openapi_lib/api.dart';

final api_instance = ExpensesApi();
final expenseDto = ExpenseDto(); // ExpenseDto | 

try {
    api_instance.removeExpense(expenseDto);
} catch (e) {
    print('Exception when calling ExpensesApi->removeExpense: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **expenseDto** | [**ExpenseDto**](ExpenseDto.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

