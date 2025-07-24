import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_response_entity.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_shadow_container.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

/// A bottom sheet that starts at 70% height, expands to 90% on scroll up,
/// and can be dragged down to close. Includes search functionality.
class AnimatedBottomSheet extends StatefulWidget {
  final HomeMenuResponseEntity? homeData;

  const AnimatedBottomSheet({super.key, required this.homeData});

  @override
  State<AnimatedBottomSheet> createState() => _AnimatedBottomSheetState();
}

class _AnimatedBottomSheetState extends State<AnimatedBottomSheet> {
  final Map<String, List<AppMenuEntity>> _categorizedMenu = {};
  final Set<String> _animatedCategories = {};
  late final TextEditingController _searchController;
  String _searchQuery = '';
  late final ValueNotifier<double> _scrollNotifier;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollNotifier = ValueNotifier<double>(0.0);
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
    _groupMenuItems();
  }

  void _groupMenuItems() {
    for (AppMenuEntity item in widget.homeData?.appmenu ?? []) {
      if (item.menuCategoryId != null) {
        if (!_categorizedMenu.containsKey(item.menuCategoryId!)) {
          _categorizedMenu[item.menuCategoryId!] = [];
        }
        _categorizedMenu[item.menuCategoryId!]!.add(item);
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter logic based on the search query
    final List<MenuCategoryEntity> filteredCategories = [];
    final Map<String, List<AppMenuEntity>> filteredCategorizedMenu = {};

    if (_searchQuery.isEmpty) {
      // If no search query, show all categories and items
      filteredCategories.addAll(widget.homeData?.menuCategory ?? []);
      filteredCategorizedMenu.addAll(_categorizedMenu);
    } else {
      // If there is a search query, filter the items
      final lowerCaseQuery = _searchQuery.toLowerCase();
      for (final category in widget.homeData?.menuCategory ?? []) {
        final List<AppMenuEntity> matchingItems =
            (_categorizedMenu[category.menuCategoryId] ?? []).where((item) {
              final title = item.menuTitle?.toLowerCase() ?? '';
              final searchTitle = item.menuTitleSearch?.toLowerCase() ?? '';
              return title.contains(lowerCaseQuery) ||
                  searchTitle.contains(lowerCaseQuery);
            }).toList();

        // Only add the category if it has matching items
        if (matchingItems.isNotEmpty) {
          filteredCategories.add(category);
          filteredCategorizedMenu[category.menuCategoryId!] = matchingItems;
        }
      }
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.getColor(context).surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: VariableBag.screenHorizontalPadding,
            ),
            child: Column(
              spacing:
                  VariableBag.commonCardVerticalPadding *
                  Responsive.getResponsive(context),
              children: [
                // Draggable handle indicator
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                // Search Field
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: CustomSearchField(
                    controller: _searchController,
                    hintText: 'Search for a service...',
                  ),
                ),
                // Scrollable list of categories and their items
                Expanded(
                  child: NotificationListener<ScrollUpdateNotification>(
                    onNotification: (notification) {
                      _scrollNotifier.value = notification.metrics.pixels;
                      return false;
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      controller: scrollController,
                      itemCount: filteredCategories.length,
                      physics: BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast,
                      ),
                      itemBuilder: (context, index) {
                        final category = filteredCategories[index];
                        final categoryId = category.menuCategoryId;
                        final items = filteredCategorizedMenu[categoryId] ?? [];

                        if (items.isEmpty || categoryId == null) {
                          return const SizedBox.shrink();
                        }

                        final bool hasAnimated = _animatedCategories.contains(
                          categoryId,
                        );

                        return Column(
                          spacing:
                              VariableBag.commonCardVerticalPadding *
                              Responsive.getResponsive(context),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedCategoryTitle(
                              title:
                                  category.menuCategoryName ??
                                  'Unnamed Category',
                              icon: category.menuCategoryIcon ?? '',
                              hasAnimated: hasAnimated,
                              isFirstItem: index == 0,
                              scrollNotifier: _scrollNotifier,
                              onAnimationComplete: () {
                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  if (mounted) {
                                    setState(() {
                                      _animatedCategories.add(categoryId);
                                    });
                                  }
                                });
                              },
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: Responsive.getGridConfig(
                                      context,
                                    ).itemCount,
                                    crossAxisSpacing: Responsive.getGridConfig(
                                      context,
                                    ).spacing,
                                    mainAxisSpacing: Responsive.getGridConfig(
                                      context,
                                    ).spacing,
                                    childAspectRatio: 112 / 155,
                                  ),
                              itemCount: items.length,
                              itemBuilder: (context, gridIndex) {
                                final menuItem = items[gridIndex];
                                return InkWell(
                                  onTap: () {
                                    if (menuItem.iosMenuClick != null &&
                                        menuItem.iosMenuClick!.isNotEmpty) {
                                      context.pushNamed(menuItem.iosMenuClick!);
                                    }
                                  },
                                  child: BorderContainerWraper(
                                    padding: EdgeInsets.zero,
                                    child: CustomShadowContainer(
                                      title: menuItem.menuTitle ?? '',
                                      boxPadding:
                                          14 *
                                          Responsive.getResponsive(context),
                                      imagePadding:
                                          20 *
                                          Responsive.getResponsive(context),
                                      image: CachedNetworkImage(
                                        imageUrl: menuItem.menuIcon ?? '',
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                              baseColor: Colors.grey.shade300,
                                              highlightColor:
                                                  Colors.grey.shade100,
                                              child: Container(
                                                width: 28,
                                                height: 28,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                              'assets/images/logo.png',
                                            ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// A widget that conditionally animates its title based on an external flag
/// and its visibility within a scroll view.
class AnimatedCategoryTitle extends StatefulWidget {
  final String title;
  final String icon;
  final bool hasAnimated;
  final bool isFirstItem;
  final VoidCallback onAnimationComplete;
  final ValueNotifier<double> scrollNotifier;

  const AnimatedCategoryTitle({
    Key? key,
    required this.title,
    required this.icon,
    required this.hasAnimated,
    required this.isFirstItem,
    required this.onAnimationComplete,
    required this.scrollNotifier,
  }) : super(key: key);

  @override
  State<AnimatedCategoryTitle> createState() => _AnimatedCategoryTitleState();
}

class _AnimatedCategoryTitleState extends State<AnimatedCategoryTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool get _shouldAnimate => !widget.hasAnimated;

  @override
  void initState() {
    super.initState();
    if (_shouldAnimate) {
      _controller = AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      );
      _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onAnimationComplete();
          widget.scrollNotifier.removeListener(_checkVisibilityAndAnimate);
        }
      });

      // If it's the first item, animate it immediately after the first frame.
      if (widget.isFirstItem) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => _controller.forward(),
        );
      } else {
        // For other items, use the scroll listener.
        widget.scrollNotifier.addListener(_checkVisibilityAndAnimate);
        // Also check visibility after the first frame for items that might already be visible.
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => _checkVisibilityAndAnimate(),
        );
      }
    }
  }

  void _checkVisibilityAndAnimate() {
    if (!mounted ||
        !_shouldAnimate ||
        _controller.isAnimating ||
        _controller.status == AnimationStatus.completed) {
      return;
    }

    final RenderObject? object = context.findRenderObject();
    if (object == null || !object.attached) {
      return;
    }

    final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
    final ScrollableState? scrollable = Scrollable.of(context);
    if (scrollable == null) return;

    final position = scrollable.position;
    double widgetTopOffset = viewport.getOffsetToReveal(object, 0.0).offset;
    double widgetBottomOffset = viewport.getOffsetToReveal(object, 1.0).offset;

    if (widgetTopOffset < position.pixels + position.viewportDimension &&
        widgetBottomOffset > position.pixels) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    if (_shouldAnimate) {
      widget.scrollNotifier.removeListener(_checkVisibilityAndAnimate);
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final finalWidget = Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppTheme.getColor(context).secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              widget.title,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppTheme.getColor(context).onSecondary,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsive(context),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.icon,
                height: 40 * Responsive.getResponsive(context),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/logo.png'),
              ),
            ),
          ],
        ),
      ),
    );

    if (!_shouldAnimate) {
      return finalWidget;
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        axisAlignment: -1,
        child: finalWidget,
      ),
    );
  }
}
