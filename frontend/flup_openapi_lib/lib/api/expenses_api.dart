//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ExpensesApi {
  ExpensesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /Expenses' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ExpenseDto] expenseDto:
  Future<Response> addExpenseWithHttpInfo({ ExpenseDto? expenseDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Expenses';

    // ignore: prefer_final_locals
    Object? postBody = expenseDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [ExpenseDto] expenseDto:
  Future<ExpenseDto?> addExpense({ ExpenseDto? expenseDto, }) async {
    final response = await addExpenseWithHttpInfo( expenseDto: expenseDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ExpenseDto',) as ExpenseDto;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Expenses' operation and returns the [Response].
  Future<Response> getExpensesWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/Expenses';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<List<ExpenseDto>?> getExpenses() async {
    final response = await getExpensesWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ExpenseDto>') as List)
        .cast<ExpenseDto>()
        .toList();

    }
    return null;
  }

  /// Performs an HTTP 'DELETE /Expenses' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ExpenseDto] expenseDto:
  Future<Response> removeExpenseWithHttpInfo({ ExpenseDto? expenseDto, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Expenses';

    // ignore: prefer_final_locals
    Object? postBody = expenseDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [ExpenseDto] expenseDto:
  Future<void> removeExpense({ ExpenseDto? expenseDto, }) async {
    final response = await removeExpenseWithHttpInfo( expenseDto: expenseDto, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
