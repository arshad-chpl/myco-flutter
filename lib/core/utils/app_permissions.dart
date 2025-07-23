import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:permission_handler/permission_handler.dart';

enum AppPermission {
  camera,
  storage,
  photos,
  mediaLibrary,
  microphone,
  location,
  notification,
  manageExternalStorage,
}

class PermissionUtil {
  static const MethodChannel _channel = MethodChannel(
    'custom.permission/channel',
  );

  static Future<int> getAndroidSdkInt() async {
    if (Platform.isAndroid) {
      try {
        final int sdkInt = await _channel.invokeMethod('getAndroidSdkInt');
        return sdkInt;
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }

  // Fixed: Proper iOS permission checking
  static Future<bool> isPermissionGranted(AppPermission permission) async {
    try {
      final status = await _getPermission(permission).status;

      // iOS: Multiple valid states for granted permission
      if (Platform.isIOS) {
        switch (permission) {
          case AppPermission.photos:
            return status.isGranted || status.isLimited;
          case AppPermission.camera:
            return status.isGranted;
          default:
            return status.isGranted || status.isLimited;
        }
      }

      return status.isGranted;
    } catch (e) {
      debugPrint('Permission check error: $e');
      return false;
    }
  }

  // Fixed: Don't request if already granted
  static Future<bool> requestPermission(AppPermission permission) async {
    try {
      // First check if already granted
      final isAlreadyGranted = await isPermissionGranted(permission);
      if (isAlreadyGranted) {
        return true;
      }

      // Only request if not already granted
      final status = await _getPermission(permission).request();

      // iOS: Handle different success states
      if (Platform.isIOS) {
        switch (permission) {
          case AppPermission.photos:
            return status.isGranted || status.isLimited;
          case AppPermission.camera:
            return status.isGranted;
          default:
            return status.isGranted || status.isLimited;
        }
      }

      return status.isGranted;
    } catch (e) {
      debugPrint('Permission request error: $e');
      return false;
    }
  }

  // Request multiple permissions
  static Future<Map<AppPermission, bool>> requestMultiplePermissions(
    List<AppPermission> permissions,
  ) async {
    final Map<AppPermission, bool> results = {};

    for (AppPermission permission in permissions) {
      results[permission] = await requestPermission(permission);
    }

    return results;
  }

  // Open app settings
  static Future<bool> openAppSettingsPage() async => await openAppSettings();

  // Show permission denied dialog
  static void showPermissionDeniedDialog(
    BuildContext context, {
    String message = 'Permission denied. Please enable it from Settings.',
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.getColor(context).onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
        contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        title: Row(
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: AppColors.spanishYellow,
              size: 28,
            ),
            const SizedBox(width: 10),
            CustomText(
              'Permission Needed',
              fontSize: 20 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onSurface,
            ),
          ],
        ),
        content: CustomText(
          message,
          fontSize: 16 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
          color: AppTheme.getColor(context).onSurfaceVariant,
        ),
        actionsPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        actionsAlignment: MainAxisAlignment.end,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: CustomText(
              'Cancel',
              fontSize: 18 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
              color: AppTheme.getColor(context).outline,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettingsPage();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.getColor(context).primary,
              foregroundColor: AppTheme.getColor(context).onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              elevation: 2,
            ),
            icon: const Icon(Icons.settings, size: 20),
            label: CustomText(
              'Open Settings',
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // Map enum to platform permission
  static Permission _getPermission(AppPermission permission) {
    switch (permission) {
      case AppPermission.camera:
        return Permission.camera;
      case AppPermission.storage:
        return Platform.isIOS ? Permission.photos : Permission.storage;
      case AppPermission.photos:
        return Permission.photos;
      case AppPermission.mediaLibrary:
        return Permission.mediaLibrary;
      case AppPermission.microphone:
        return Permission.microphone;
      case AppPermission.location:
        return Permission.location;
      case AppPermission.notification:
        return Permission.notification;
      case AppPermission.manageExternalStorage:
        return Permission.manageExternalStorage;
    }
  }

  // MAIN FIX: Proper iOS permission flow
  static Future<bool> checkPermissionByPickerType(
    String type,
    BuildContext context,
  ) async {
    bool granted = false;

    try {
      if (type == 'camera') {
        // Check if already granted first
        if (Platform.isAndroid) {
          granted = await isPermissionGranted(AppPermission.camera);
        } else if (Platform.isIOS) {
          granted = await isPermissionGranted(AppPermission.camera);

          // granted = true;
        } else {
          granted = await requestPermission(AppPermission.camera);
          showPermissionDeniedDialog(context);
        }

        // if (!granted) {
        //   // Only request if not already granted
        // }

        debugPrint('Camera permission: $granted');
      } else if (type == 'gallery') {
        if (Platform.isIOS) {
          // Check if already granted first
          granted = await isPermissionGranted(AppPermission.photos);

          if (!granted) {
            // Only request if not already granted
            granted = true;
          } else {
            granted = await requestPermission(AppPermission.photos);
            showPermissionDeniedDialog(context);
          }

          debugPrint('Photos permission: $granted');
        } else {
          // Android logic
          final int sdkInt = await getAndroidSdkInt();
          final permission = sdkInt < 33
              ? AppPermission.storage
              : AppPermission.photos;

          granted = await isPermissionGranted(permission);
          if (!granted) {
            granted = await requestPermission(permission);
          }
        }
      } else if (type == 'document') {
        if (Platform.isIOS) {
          granted = true; // No explicit permission needed for documents on iOS
        } else {
          final int sdkInt = await getAndroidSdkInt();
          final permission = sdkInt >= 30
              ? AppPermission.manageExternalStorage
              : AppPermission.storage;

          granted = await isPermissionGranted(permission);
          if (!granted) {
            granted = await requestPermission(permission);
          }
        }
      }
    } catch (e) {
      debugPrint('Permission error for $type: $e');
      granted = false;
    }

    // IMPORTANT: Only show dialog if permission is actually denied
    if (!granted && context.mounted) {
      // Double check the permission status before showing dialog
      bool finalCheck = false;

      if (type == 'camera') {
        finalCheck = await isPermissionGranted(AppPermission.camera);
      } else if (type == 'gallery' && Platform.isIOS) {
        finalCheck = await isPermissionGranted(AppPermission.photos);
      }

      // Only show dialog if final check also fails
      if (!finalCheck) {
        String message = '';
        if (type == 'camera') {
          message =
              'Camera access is needed to take photos. Please allow access in Settings.';
        } else if (type == 'gallery') {
          message = Platform.isIOS
              ? 'Photo library access is needed to select images. Please allow access in Settings.'
              : 'Storage access is needed to select images. Please allow access in Settings.';
        } else if (type == 'document') {
          message =
              'Storage access is needed to select documents. Please allow access in Settings.';
        }

        showPermissionDeniedDialog(context, message: message);
      } else {
        // Update granted status if final check passed
        granted = true;
      }
    }

    return granted;
  }

  // Debug method to check current permission status
  static Future<void> debugPermissionStatus(AppPermission permission) async {
    final status = await _getPermission(permission).status;
    debugPrint(
      'Permission ${permission.toString()} status: ${status.toString()}',
    );
    debugPrint('Is granted: ${status.isGranted}');
    debugPrint('Is limited: ${status.isLimited}');
    debugPrint('Is denied: ${status.isDenied}');
    debugPrint('Is permanently denied: ${status.isPermanentlyDenied}');
  }
}
