/// Admin View Page
///
/// Created by Aasifhusain Shaikh
///
/// This page serves as the main interface for the admin view in the My-co Employee app.
/// It displays a list of admin menu categories with a searchable interface.
/// The page uses the following key technologies and patterns:
/// - **BLoC Pattern**: Manages the state of the admin view (loading, loaded, error) using AdminViewBloc.
/// - **Dependency Injection (DI)**: Uses GetIt to inject dependencies like PreferenceManager for accessing user data.
/// - **Routing**: Uses go_router for navigation (e.g., navigating back to the home page).
/// - **Localization**: Uses LanguageManager for multilingual support.
/// - **UI Components**: Uses Flutter's Material Design widgets, CustomText widget for consistent text styling, and Shimmer for loading animations.
/// - **Stateful Search**: Implements a debounced search with dynamic hint text animation for a better user experience.
library;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/features/admin_view/presentation/bloc/admin_view_bloc.dart';
import 'package:myco_flutter/features/admin_view/presentation/pages/admin_menu_list.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

/// The main admin view page, a stateless widget that sets up the scaffold and triggers initial data fetching.
///
/// This widget is the entry point for the admin view. It uses a [Scaffold] to define the app bar and body,
/// and it triggers the initial data fetch when the page is first built. It also handles navigation when
/// the user tries to pop the page.
class AdminViewPage extends StatelessWidget {
  const AdminViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Schedule a callback to run after the frame is built to fetch initial data.
    // This ensures the context is ready and avoids calling BLoC methods during build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchInitialData(context);
    });

    /// Wraps the [Scaffold] to control back navigation behavior.
    ///
    /// Prevents the page from popping directly and redirects to the home route instead.
    return Scaffold(
      /// Defines the app bar with a custom title and back button.
      ///
      /// Uses [AppColors.primary] for the background and [CustomText] for the title
      /// to maintain consistent styling. The back button navigates to the home page.
      appBar: AppBar(
        // Primary color defined in AppColors.
        title: CustomText(
          LanguageManager().get('admin_view'),
          // Localized title for the admin view.
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      // Light background color for the body.
      body: RefreshIndicator(
        /// Allows pull-to-refresh functionality to reload data.
        ///
        /// Calls [_refreshData] when the user pulls down to refresh.
        onRefresh: () => _refreshData(context),
        color: AppColors.primary, // Refresh indicator color.
        child: const AdminViewBody(), // Main content of the page.
      ),
    );
  }

  /// Fetches initial data for the admin view when the page loads.
  ///
  /// Retrieves user-related data (companyId, userId, languageId) from [PreferenceManager]
  /// using dependency injection (GetIt) and triggers a BLoC event to load data.
  ///
  /// @param context The build context to access the BLoC.
  Future<void> _fetchInitialData(BuildContext context) async {
    // Access PreferenceManager via GetIt (dependency injection).
    final preferenceManager = GetIt.I<PreferenceManager>();
    // Retrieve stored user data (company ID, user ID, language ID).
    final companyId = await preferenceManager.getCompanyId();
    final userId = preferenceManager.getUserId();
    final languageId = await preferenceManager.getLanguageId();

    // Check if the widget is still mounted to avoid calling setState on a disposed widget.
    if (context.mounted) {
      // Dispatch a BLoC event to fetch admin view data.
      context.read<AdminViewBloc>().add(
        FetchAdminView(
          companyId: companyId!,
          // Non-null assertion as ID is expected to exist.
          userId: '1401',
          languageId: languageId!,
        ),
      );
    }
  }

  /// Refreshes the admin view data when the user pulls to refresh.
  ///
  /// Similar to [_fetchInitialData], but dispatches a [RefreshAdminViewData] event
  /// to reload the data.
  ///
  /// @param context The build context to access the BLoC.
  Future<void> _refreshData(BuildContext context) async {
    final preferenceManager = GetIt.I<PreferenceManager>();
    final companyId = await preferenceManager.getCompanyId();
    final userId =await preferenceManager.getUserId();
    final languageId = await preferenceManager.getLanguageId();

    if (context.mounted) {
      context.read<AdminViewBloc>().add(
        FetchAdminView(
          companyId: companyId??'',
          userId: userId??'',
          languageId: languageId??'',
        ),
      );
    }
  }
}

/// The body of the admin view page, a stateful widget that handles the search bar and content display.
///
/// This widget manages the search functionality, dynamic hint text animation,
/// and displays the content based on the BLoC state (loading, loaded, or error).
class AdminViewBody extends StatefulWidget {
  const AdminViewBody({super.key});

  @override
  State<AdminViewBody> createState() => _AdminViewBodyState();
}

/// The state class for [AdminViewBody], managing search and animation logic.
///
/// This class handles the search input, debouncing, dynamic hint text rotation,
/// and cleanup of resources when the widget is disposed.
class _AdminViewBodyState extends State<AdminViewBody> {
  // Controller for the search text field to capture user input.
  final _searchController = TextEditingController();

  // Timer for debouncing search input to avoid excessive updates.
  Timer? _debounce;

  // Stores the current search query after debouncing.
  String _currentSearchQuery = '';

  // List of words for dynamic hint text in the search bar.
  final List<String> _dynamicWords = [];

  // Index of the current word being displayed in the search bar hint.
  int _currentWordIndex = 0;

  // Timer for rotating dynamic hint text words.
  Timer? _textSwitcherTimer;

  // Focus node to track the focus state of the search bar.
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Add a listener to the search controller to detect text changes.
    _searchController.addListener(_onSearchChanged);
    // Add a listener to the focus node to update UI when focus changes.
    _searchFocusNode.addListener(() {
      setState(() {}); // Rebuild to reflect focus state changes.
    });
  }

  /// Handles changes in the search text field with debouncing.
  ///
  /// Updates the UI immediately and debounces the search query to reduce
  /// unnecessary updates. The debounce timer waits 300ms before processing
  /// the search query.
  void _onSearchChanged() {
    setState(
      () {},
    ); // Rebuild to reflect text changes (e.g., show/hide clear button).

    // Cancel any existing debounce timer.
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    // Start a new debounce timer.
    _debounce = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _currentSearchQuery = _searchController.text
            .trim(); // Update search query.
      });
    });
  }

  /// Updates the list of dynamic words for the search bar hint text.
  ///
  /// Clears the existing words, adds new ones from the provided list, and
  /// starts a timer to rotate through them every 2 seconds.
  ///
  /// @param words The list of words to use for dynamic hints.
  void _updateDynamicWords(List<String?> words) {
    _dynamicWords.clear();
    // Filter out null values and add non-null words to the list.
    _dynamicWords.addAll(words.where((w) => w != null).cast<String>());
    _textSwitcherTimer?.cancel(); // Cancel any existing timer.
    if (_dynamicWords.isNotEmpty) {
      // Start a timer to rotate through the words.
      _textSwitcherTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
        if (mounted) {
          setState(() {
            _currentWordIndex = (_currentWordIndex + 1) % _dynamicWords.length;
          });
        }
      });
    }
  }

  /// Clears the search input and resets the search state.
  ///
  /// Clears the text field, resets the search query, and removes focus from the search bar.
  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _currentSearchQuery = '';
    });
    _searchFocusNode.unfocus();
  }

  /// Refreshes the admin view data.
  ///
  /// Similar to the top-level [_refreshData], but called from within the stateful widget.
  /// Fetches user data and dispatches a [RefreshAdminViewData] event.
  Future<void> _refreshData() async {
    final preferenceManager = GetIt.I<PreferenceManager>();
    final companyId = await preferenceManager.getCompanyId();
    final userId =await  preferenceManager.getUserId();
    final languageId = await preferenceManager.getLanguageId();

    if (mounted) {
      context.read<AdminViewBloc>().add(
        FetchAdminView(
          companyId: companyId??'',
          userId: userId??'',
          languageId: languageId??'',
        ),
      );
    }
  }

  @override
  void dispose() {
    // Clean up resources to prevent memory leaks.
    _debounce?.cancel();
    _textSwitcherTimer?.cancel();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      /// Search bar container with shadow and rounded corners.
      ///
      /// Contains a [TextField] with dynamic hint text and a clear button.
      Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.08),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: BlocBuilder<AdminViewBloc, AdminViewState>(
          /// Builds the search bar UI based on the BLoC state.
          ///
          /// Updates the hint text dynamically based on admin menu categories
          /// and handles focus and clear button visibility.
          builder: (context, state) {
            LanguageManager().get('search');

            if (state is AdminViewLoaded) {
              final categories = state.adminViewData.adminMenuCategory ?? [];
              // Update dynamic hint words based on menu categories.
              _updateDynamicWords(categories.map((c) => c.accessType).toList());
            }

            final bool showHint = _searchController.text.isEmpty;
            return Row(
              children: [
                Icon(
                  Icons.search,
                  color: _searchFocusNode.hasFocus
                      ? AppColors.primary
                      : Colors.grey.shade500,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      /// The search text field with no default border.
                      ///
                      /// Uses a [TextEditingController] for input and a [FocusNode]
                      /// to track focus state.
                      TextField(
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        decoration: const InputDecoration(
                          hintText: '',
                          // Empty to use custom hint.
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        onSubmitted: (_) {
                          _searchFocusNode.unfocus(); // Unfocus on submit.
                        },
                      ),
                      // Custom animated hint text.
                      if (showHint && _dynamicWords.isNotEmpty)
                        AnimatedOpacity(
                          opacity: showHint ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: IgnorePointer(
                            child: Row(
                              children: [
                                Text(
                                  '${LanguageManager().get('search')} ',
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                  ),
                                ),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: Text(
                                    _dynamicWords[_currentWordIndex],
                                    key: ValueKey(
                                      _dynamicWords[_currentWordIndex],
                                    ),
                                    style: const TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                // Clear button, shown only when text is present.
                if (_searchController.text.isNotEmpty)
                  AnimatedScale(
                    scale: _searchController.text.isNotEmpty ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.grey.shade500,
                        size: 20,
                      ),
                      onPressed: _clearSearch,
                      splashRadius: 20,
                    ),
                  ),
              ],
            );
          },
        ),
      ),

      /// Main content area that changes based on the BLoC state.
      ///
      /// Displays a shimmer loading effect, the admin menu list, an error message,
      /// or a no-data message depending on the state.
      BlocBuilder<AdminViewBloc, AdminViewState>(
        builder: (context, state) {
          // Handle initial state or loading state - show shimmer
          if (state is AdminViewLoading || state is AdminViewInitial) {
            return Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 6,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
            );
          } else if (state is AdminViewLoaded) {
            final categories = state.adminViewData.adminMenuCategory ?? [];
            return Expanded(
              child: AdminMenuList(
                categories: categories,
                searchQuery: _currentSearchQuery,
                isFromNotificationReminder: false,
                adminViewResponse: state.adminViewData,
              ),
            );
          } else if (state is AdminViewError) {
            return Expanded(
              child: Center(
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
                        color: AppColors.error,
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
              ),
            );
          }

          // This should rarely be reached now, but kept as fallback
          // You could also return a loading shimmer here instead
          return Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 6,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}
