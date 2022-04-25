import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../forgot_password/forgot_password_widget.dart';
import '../register/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController;
  TextEditingController passswordController;
  bool passswordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passswordController = TextEditingController();
    passswordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0x33090F13),
      body: Align(
        alignment: AlignmentDirectional(-0.14, -0.08),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x19444D59),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: Image.asset(
                'assets/images/gradient_background.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 130, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/app_logo.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 14,
                            color: Color(0x34090F13),
                            offset: Offset(0, 8),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
                        child: TextFormField(
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            hintText: 'Email Address',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Rubik',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 14,
                            color: Color(0x32000000),
                            offset: Offset(0, 8),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
                        child: TextFormField(
                          controller: passswordController,
                          obscureText: !passswordVisibility,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context).bodyText1,
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () =>
                                    passswordVisibility = !passswordVisibility,
                              ),
                              child: Icon(
                                passswordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: FlutterFlowTheme.of(context).grayDark,
                                size: 24,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Rubik',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1, 1),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordWidget(),
                        ),
                      );
                    },
                    text: 'Forgot password?',
                    options: FFButtonOptions(
                      width: 200,
                      height: 20,
                      color: Color(0x00090F13),
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyText1
                          .override(
                            fontFamily: 'Rubik',
                            color: FlutterFlowTheme.of(context).secondaryColor,
                          ),
                      elevation: 0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: 0,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    final user = await signInWithEmail(
                      context,
                      emailController.text,
                      passswordController.text,
                    );
                    if (user == null) {
                      return;
                    }

                    Navigator.pop(context);
                  },
                  text: 'Sign In',
                  options: FFButtonOptions(
                    width: 300,
                    height: 55,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w600,
                        ),
                    elevation: 10,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: 20,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 62,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 150),
                        reverseDuration: Duration(milliseconds: 150),
                        child: RegisterWidget(),
                      ),
                    );
                  },
                  text: 'Don’t have an account? Sign up!',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: Color(0x004B39EF),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Rubik',
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                    elevation: 0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: 12,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
