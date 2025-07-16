import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/admin_view/presentation/bloc/admin_view_bloc.dart';
import 'package:myco_flutter/features/admin_view/presentation/pages/admin_menu_list.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
import 'package:shimmer/shimmer.dart';

class AdminViewPage extends StatefulWidget {
  const AdminViewPage({super.key});

  @override
  State<AdminViewPage> createState() => _AdminViewPageState();
}

class _AdminViewPageState extends State<AdminViewPage> {
  final _searchController = TextEditingController();
  Timer? _debounce;
  String _currentSearchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchInitialData() async {
    final preferenceManager = GetIt.I<PreferenceManager>();
    final companyId = await preferenceManager.getCompanyId();
    final userId = preferenceManager.getUserId();
    final languageId = await preferenceManager.getLanguageId();

    if (mounted) {
      context.read<AdminViewBloc>().add(
        FetchAdminView(
          companyId: companyId!,
          userId: userId,
          languageId: languageId!,
        ),
      );
    }
  }

  Future<void> _refreshData() async {
    final preferenceManager = GetIt.I<PreferenceManager>();
    final companyId = await preferenceManager.getCompanyId();
    final userId = preferenceManager.getUserId();
    final languageId = await preferenceManager.getLanguageId();

    if (mounted) {
      context.read<AdminViewBloc>().add(
        FetchAdminView(
          companyId: companyId!,
          userId: userId,
          languageId: languageId!,
        ),
      );
    }
  }

  void _onSearchChanged() {
    setState(() {});
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _currentSearchQuery = _searchController.text.trim();
        });
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _currentSearchQuery = '');
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.getColor(context).surface,
    appBar: CustomAppbar(title: 'admin_view', isKey: true),
    body: RefreshIndicator(
      onRefresh: _refreshData,
      color: AppColors.primary,
      child: Column(children: [_buildSearchBar(), _buildContent()]),
    ),
  );

  Widget _buildSearchBar() => Padding(
    padding: EdgeInsets.only(
      left: 16.0 * Responsive.getResponsive(context),
      right: 16.0 * Responsive.getResponsive(context),
      bottom: 16.0 * Responsive.getResponsive(context),
    ),
    child: MyCoTextfield(
      controller: _searchController,
      hintText: LanguageManager().get('search'),
      preFixImage: AppAssets.imageSearch,
      suFixImage: _searchController.text.isNotEmpty
          ? AppAssets.imageScanner
          : null,
      onTap1: _clearSearch,
      boarderRadius: 12.0,
      height: 0.06 * Responsive.getHeight(context),
      contentPadding: EdgeInsets.symmetric(
        vertical: 8 * Responsive.getResponsive(context),
      ),
      // prefixImageHeight: 0. * Responsive.getHeight(context),
    ),
  );

  Widget _buildContent() => Expanded(
    child: BlocBuilder<AdminViewBloc, AdminViewState>(
      builder: (context, state) {
        if (state is AdminViewInitial || state is AdminViewLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 6,
              itemBuilder: (_, __) => Container(
                margin: const EdgeInsets.only(bottom: 16),
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          );
        }
        if (state is AdminViewLoaded) {
          final categories = state.adminViewData.adminMenuCategory ?? [];
          return AdminMenuList(
            categories: categories,
            searchQuery: _currentSearchQuery,
            isFromNotificationReminder: false,
            adminViewResponse: state.adminViewData,
          );
        }
        if (state is AdminViewError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.error_outline,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                CustomText(
                  state.message,
                  color: AppColors.error,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _refreshData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: CustomText(
                    LanguageManager().get('retry'),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    ),
  );
}
