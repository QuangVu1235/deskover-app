import 'package:deskover_app/component/widget/global_input_form_widget.dart';
import 'package:deskover_app/themes/space_values.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


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
          title: const Text("Deskover APP"),
          // SvgPicture.asset(
          //   SvgImageAssets.imgLogo,
          //   fit: BoxFit.contain,
          //   height: 40,
          // ),
          centerTitle: true,
          leadingWidth: 0,
          leading: const SizedBox.shrink(),
        ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: UIColors.border10,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                semanticContainer: true,
                margin: const EdgeInsets.all(SpaceValues.space16),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: SpaceValues.space24,
                      top: SpaceValues.space24,
                      right: SpaceValues.space24,
                      bottom: SpaceValues.space16,
                    ),
                    child: Form(
                      // key: viewModel.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Tiếp tục với số điện thoại",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: SpaceValues.space16),
                          GlobalInputFormWidget(
                            // controller: viewModel.inputPhone,
                            validator: Validator.phone,
                            textInputType: TextInputType.phone,
                            title: 'Số điện thoại',
                            hint: 'Vui lòng nhập số điện thoại',
                          ),
                          const SizedBox(height: SpaceValues.space40),
                          GlobalInputFormWidget(
                            // controller: viewModel.inputPassword,
                            validator: Validator.password,
                            textInputType: TextInputType.visiblePassword,
                            title: 'Mật khẩu',
                            hint: 'Vui lòng nhập mật khẩu',
                            security: true,
                          ),
                          const SizedBox(height: SpaceValues.space24),
                          FractionallySizedBox(
                            widthFactor: 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: UIColors.black70
                              ),
                              // onPressed: viewModel.onLogin,
                              onPressed: _updateText,
                              child: const Text('Tiếp tục'),
                            ),
                          ),
                          const SizedBox(
                            height: SpaceValues.space8,
                          ),
                          InkWell(
                            // onTap: viewModel.onForgetPassword,
                            child: const Text(
                              "Quên mật khẩu?",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: SpaceValues.space40,
              ),
            ],
          ),
        )
      ),
    );
  }
  void _updateText() {
    setState(() {
      // Update the text.
      // textToShow = 'Flutter is Awesome!';
    });
  }

  // @override
  // SigninSignupModel createViewModel() => getIt<SigninSignupModel>();
}
