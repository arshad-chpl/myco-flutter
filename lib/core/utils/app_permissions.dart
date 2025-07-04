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

  // Request a single permission
  static Future<bool> requestPermission(AppPermission permission) async {
    final status = await _getPermission(permission).request();
    return status.isGranted;
  }

  // Check if a single permission is granted
  static Future<bool> isPermissionGranted(AppPermission permission) async {
    final status = await _getPermission(permission).status;
    return status.isGranted;
  }

  // Request multiple permissions
  static Future<Map<AppPermission, bool>> requestMultiplePermissions(
    List<AppPermission> permissions,
  ) async {
    final Map<AppPermission, bool> results = {};

    for (AppPermission permission in permissions) {
      final status = await _getPermission(permission).request();
      results[permission] = status.isGranted;
    }

    return results;
  }

  // Open app settings
  static Future<bool> openAppSettingsPage() async => await openAppSettings();

  // Show dialog when permission is denied
  static void showPermissionDeniedDialog(
    BuildContext context, {
    String message = 'Permission denied to access media.',
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
              fontSize: 20 * getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onSurface,
            ),
          ],
        ),
        content: CustomText(
          message,
          fontSize: 16 * getResponsiveText(context),
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
              fontSize: 18 * getResponsiveText(context),
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
              fontSize: 14 * getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // Map enum to real platform permission
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

  static Future<bool> checkPermissionByPickerType(
    String type,
    BuildContext context,
  ) async {
    bool granted = false;

    if (type == 'camera') {
      granted = await PermissionUtil.requestPermission(AppPermission.camera);
    } else if (type == 'gallery') {
      final int sdkInt = await PermissionUtil.getAndroidSdkInt();

      if (Platform.isAndroid && sdkInt < 33) {
        // Android 12 (API 32) and below
        granted = await PermissionUtil.requestPermission(AppPermission.storage);
      } else {
        // Android 13+ (API 33+)
        granted = await PermissionUtil.requestPermission(AppPermission.photos);
      }
    } else if (type == 'document') {
      if (Platform.isAndroid) {
        granted = await PermissionUtil.requestPermission(
          AppPermission.manageExternalStorage,
        );
      } else {
        granted = true;
      }
    }

    if (!granted && context.mounted) {
      PermissionUtil.showPermissionDeniedDialog(context);
    }

    return granted;
  }
}
