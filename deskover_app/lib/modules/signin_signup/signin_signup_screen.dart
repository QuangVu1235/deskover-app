import 'package:deskover_app/themes/space_values.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SigninSignupScreen extends StatefulWidget {
  final int initScreen;

  SigninSignupScreen({Key? key, this.initScreen = 0, this.initPhone}) : super(key: key);

  String? initPhone;

  @override
  State<StatefulWidget> createState() => _SigninSignupScreen();
}

class _SigninSignupScreen extends State<SigninSignupScreen>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            SvgImageAssets.imgLogo,
            fit: BoxFit.contain,
            height: 40,
          ),
          centerTitle: true,
          leadingWidth: 0,
          leading: const SizedBox.shrink(),
          bottom: TabBar(
            indicatorColor: UIColors.navSelected,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: UIColors.navSelected,
            labelStyle: const TextStyle(fontWeight: FontWeight.w700),
            unselectedLabelColor: UIColors.navNonSelected,
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
            indicatorWeight: 2,
            labelPadding: EdgeInsets.zero,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: SpaceValues.space40, vertical: 0),
            isScrollable: true,
            tabs: [
              Container(
                width: MediaQuery.of(context).size.width * .4 - SpaceValues.space24,
                decoration: const BoxDecoration(
                  border: Border(right: BorderSide(color: UIColors.dividerDark, width: 1)),
                ),
                child: const Tab(
                  text: 'Đăng ký',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .4 - SpaceValues.space24,
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(color: UIColors.dividerDark, width: 1)),
                ),
                child: const Tab(
                  text: 'Đăng nhập',
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SignupScreen(initPhone: widget.initPhone),
            SigninPage(initPhone: widget.initPhone),
          ],
        ),
      ),
    );
  }

  // @override
  // SigninSignupModel createViewModel() => getIt<SigninSignupModel>();
}
