# test_api.api.ExpensesApi

## Load the API package
```dart
import 'package:test_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addExpense**](ExpensesApi.md#addexpense) | **POST** /Expenses | 
[**getExpenses**](ExpensesApi.md#getexpenses) | **GET** /Expenses | 


# **addExpense**
> Expense addExpense(expense)



### Example
```dart
import 'package:test_api/api.dart';

final api_instance = ExpensesApi();
final expense = Expense(); // Expense | 

try {
    final result = api_instance.addExpense(expense);
    print(result);
} catch (e) {
    print('Exception when calling ExpensesApi->addExpense: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **expense** | [**Expense**](Expense.md)|  | [optional] 

### Return type

[**Expense**](Expense.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExpenses**
> List<Expense> getExpenses()



### Example
```dart
import 'package:test_api/api.dart';

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

[**List<Expense>**](Expense.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

