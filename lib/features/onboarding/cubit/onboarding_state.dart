abstract class OnboardingState {
  final int currentPage;
  const OnboardingState(this.currentPage);
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial() : super(0); 
}

class OnboardingPageChanged extends OnboardingState {
  const OnboardingPageChanged(super.currentPage);
}
