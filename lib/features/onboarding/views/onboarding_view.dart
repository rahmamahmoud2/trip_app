import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_state.dart';
import '../models/onboarding_item_model.dart';
import 'widgets/onboarding_bottom_bar.dart';
import 'widgets/onboarding_page_item.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const _OnboardingViewBody(),
    );
  }
}

class _OnboardingViewBody extends StatefulWidget {
  const _OnboardingViewBody();

  @override
  State<_OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<_OnboardingViewBody> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: OnboardingItemModel.pages.length,
                onPageChanged: cubit.onPageChanged,
                itemBuilder: (context, index) {
                  final item = OnboardingItemModel.pages[index];
                  final bool isLast =
                      index == OnboardingItemModel.pages.length - 1;

                  return OnboardingPageItem(
                    item: item,
                    showSkip: !isLast,
                    onSkip: () => cubit.skip(_pageController),
                  );
                },
              ),
            ),
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return OnboardingBottomBar(
                  currentPage: state.currentPage,
                  isLastPage: state.isLastPage,
                  onNext: () => cubit.nextPage(_pageController),
                  onAuthAction: () => cubit.onAuthAction(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
