import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

/// This file defines an abstract class [ApiResultState] to represent the state of API responses.
/// It includes support for different states like Loading, Success, API Errors, and Server Errors.
/// A factory constructor is provided to handle exceptions (especially DioException) and convert them into appropriate states.
///
/// Created by Aasif Shaikh.

// Using Equatable to allow for value-based comparison of state objects.
abstract class ApiResultState<T> extends Equatable {
  const ApiResultState();

  @override
  List<Object?> get props => [];
}

/// Represents the loading state of an API call.
class Loading<T> extends ApiResultState<T> {
  const Loading();
}

/// Represents the success state of an API call, containing the response data.
class Success<T> extends ApiResultState<T> {
  final T data;

  const Success(this.data);

  @override
  List<Object?> get props => [data];
}

/// Represents an API error with a specific status code and message.
class ApiError<T> extends ApiResultState<T> {
  final int statusCode;
  final String message;
  final bool viewErrorDialog;
  final bool viewErrorDialogAPICall;
  final String userID;

  const ApiError({
    required this.statusCode,
    required this.message,
    this.viewErrorDialog = false,
    this.viewErrorDialogAPICall = false,
    this.userID = '0',
  });

  @override
  List<Object?> get props => [
    statusCode,
    message,
    viewErrorDialog,
    viewErrorDialogAPICall,
    userID,
  ];
}

/// Represents a server error with a specific error code and message.
class ServerError<T> extends ApiResultState<T> {
  final int errorCode;
  final String errorMessage;

  const ServerError({required this.errorCode, required this.errorMessage});

  @override
  List<Object?> get props => [errorCode, errorMessage];
}

/// A utility function to handle exceptions and convert them into an appropriate [ApiResultState].
/// It's designed to work with exceptions thrown by the 'dio' package.
ApiResultState<T> handleException<T>(Exception exception) {
  if (exception is DioException) {
    final response = exception.response;
    final statusCode = response?.statusCode ?? 0;
    final dynamic responseData = response?.data;

    // Handle cases where the server returns a non-200 status code but with a specific error structure.
    if (statusCode >= 200 && statusCode < 300 && responseData != null) {
      try {
        // Assuming responseData might be a string that needs decoding,
        // or it could already be a map.
        final errorJson = responseData is String
            ? jsonDecode(responseData)
            : responseData as Map<String, dynamic>;

        final apiError = errorJson['error'] as String;
        final message = errorJson['message'] as String;

        return ApiError(
          statusCode: statusCode,
          message: message,
          viewErrorDialog: errorJson['view_dialog'] as bool,
          viewErrorDialogAPICall: errorJson['view_dialog_api_call'] as bool,
          userID: errorJson['user_id'] as String,
        );
      } catch (e) {
        // If parsing the success-range error response fails.
        return ApiError(
          statusCode: statusCode,
          message: 'We encountered an issue. Please try again later.',
        );
      }
    }
    // Handle non-2xx server errors.
    else if (response != null) {
      return ServerError(
        errorCode: statusCode,
        errorMessage: _mapErrorMessage(statusCode),
      );
    }
    // Handle other Dio errors (e.g., connection timeout, no internet).
    else {
      return const ApiError(
        statusCode: 0,
        message:
            "Oops! We're experiencing technical difficulties. Please refresh the page or try again in a few minutes.",
      );
    }
  }
  // Handle other types of exceptions.
  else {
    return const ApiError(
      statusCode: 0,
      message:
          "Oops! We're experiencing technical difficulties. Please refresh the page or try again in a few minutes.",
    );
  }
}

/// Utility function to map HTTP status codes to user-friendly messages.
String _mapErrorMessage(int statusCode) {
  switch (statusCode) {
    case 400:
      return 'Oops!\nSomething went wrong.\nPlease check your input and try again.';
    case 401:
      return 'Attention!\nYou’re not logged in.\nPlease sign in and try again.';
    case 403:
      return 'Sorry!\nYou don’t have permission to do this.\nPlease contact support if needed.';
    case 404:
      return 'Not Found!\nWe couldn’t find what you were looking for.\nPlease try again later.';
    case 408:
      return 'Timeout!\nThe request is taking too long.\nPlease check your connection and try again.';
    case 429:
      return 'Hold On!\nYou’re doing that too much!\nPlease wait and try again later.';
    case 500:
      return "Oops! We're experiencing technical difficulties. Please refresh the page or try again in a few minutes.";
    case 502:
      return 'Connection Issue!\nWe’re having issues connecting to the server.\nPlease try again later.';
    case 503:
      return 'Unavailable!\nThe service is currently unavailable.\nPlease try again shortly.';
    case 504:
      return 'Connection Timeout!\nIt’s taking too long to connect.\nPlease check your internet and try again.';
    default:
      return 'Error!\nSomething went wrong (Error $statusCode).\nPlease try again later.';
  }
}
