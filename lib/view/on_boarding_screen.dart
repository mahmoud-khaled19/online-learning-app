import 'package:flutter/material.dart';
import 'package:online_learning_app/utils/colors_manager.dart';
import 'package:online_learning_app/utils/global_methods.dart';
import 'package:online_learning_app/utils/values_manager.dart';
import 'package:online_learning_app/view/login_screen.dart';
import 'package:online_learning_app/view/sign_up_screen.dart';
import 'package:online_learning_app/widgets/default_custom_text.dart';
import 'package:online_learning_app/widgets/elevated_button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../utils/strings_manager.dart';
import '../utils/style_manager.dart';
import '../view_model/on_boarding_view_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    OnBoardingViewModel.animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    OnBoardingViewModel.animationController.repeat();
    OnBoardingViewModel.animation = TextStyleTween(
      begin: TextStyle(color: Colors.blue, fontSize: AppSize.s16),
      end: TextStyle(
          color: ColorsManager.lightSecondColor, fontSize: AppSize.s16),
    ).animate(CurvedAnimation(
        parent: OnBoardingViewModel.animationController, curve: Curves.easeIn));
    super.initState();
  }

  @override
  void dispose() {
    OnBoardingViewModel.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double hSize = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s14),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  GlobalMethods.navigateTo(context, const LoginScreen());
                },
                child: ScaleTransition(
                  scale: OnBoardingViewModel.animationController,
                  child: DefaultCustomText(
                    color: ColorsManager.grey,
                    alignment: Alignment.centerRight,
                    text: AppStrings.skip,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
              ),
              SizedBox(height: AppSize.s20),
              SizedBox(
                height: hSize * 0.62,
                child: PageView.builder(
                  controller: OnBoardingViewModel.boardingController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image(
                          image: AssetImage(
                            OnBoardingViewModel.modelList[index].image,
                          ),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: AppSize.s30,
                        ),
                        DefaultCustomText(
                          text: OnBoardingViewModel.modelList[index].title,
                          fontSize: AppSize.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: AppSize.s8,
                        ),
                        DefaultCustomText(
                          text: OnBoardingViewModel.modelList[index].body1,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: AppSize.s8,
                        ),
                        DefaultCustomText(
                          text: OnBoardingViewModel.modelList[index].body2,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    );
                  },
                  onPageChanged: (value) {
                    if (value == OnBoardingViewModel.modelList.length - 1) {
                      setState(() {
                        OnBoardingViewModel.isLast = true;
                      });
                    } else {
                      setState(() {
                        OnBoardingViewModel.isLast = false;
                      });
                    }
                  },
                  itemCount: OnBoardingViewModel.modelList.length,
                ),
              ),
              SmoothPageIndicator(
                controller: OnBoardingViewModel.boardingController,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: ExpandingDotsEffect(
                  spacing: 8.0,
                  radius: 4.0,
                  dotWidth: 20.0,
                  dotHeight: 10.0,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 8,
                  dotColor: Colors.grey,
                  activeDotColor: ColorsManager.lightSecondColor,
                ),
              ),
              SizedBox(
                height: AppSize.s50,
              ),
              if (OnBoardingViewModel.isLast == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DefaultButton(
                        text: AppStrings.register,
                        function: () {
                          GlobalMethods.navigateTo(
                              context, const RegisterScreen());
                        },
                        context: context),
                    DefaultButton(
                        text: AppStrings.login,
                        function: () {
                          GlobalMethods.navigateTo(
                              context, const LoginScreen());
                        },
                        context: context),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
