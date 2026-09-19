import 'package:anime_verse/widgets/app.scaffold.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AppScaffold(
        body: LayoutBuilder(
          builder: (context, constraints){
            final isLargeScreen = constraints.maxWidth > 600;
            final maxWidth = isLargeScreen ? 400.0 : constraints.maxWidth;
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  width: maxWidth,
                  padding: EdgeInsets.all(screenWidth * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.14),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: screenWidth * (isLargeScreen ? 0.06 : 0.1),
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        'Sign in to continue your anime journey',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: screenHeight * 0.05),

                      // Email TextField
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.white70,
                          ),
                          filled: true,
                          fillColor: Colors.white.withValues(alpha: 0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.03),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white70,
                            size: screenWidth * 0.06,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.025,
                            horizontal: screenWidth * 0.055,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      // Password TextField
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.white70,
                          ),
                          filled: true,
                          fillColor: Colors.white.withValues(alpha: 0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.03),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white70,
                            size: screenWidth * 0.06,
                          ),
                          suffixIcon: Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.white70,
                            size: screenWidth * 0.06,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.025,
                            horizontal: screenWidth * 0.055,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.white,
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      // Forget Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: Colors.blue.shade500,
                            ),
                          ),
                          onPressed: () {
                            // TODO : Implement forgot password functionality
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        height: screenHeight * 0.075,
                        child: ElevatedButton(
                            onPressed: (){
                              // TODO : Implmeent sign in functionality
                            },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.withValues(alpha: 0.8),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(screenWidth * 0.03),
                            ),
                            elevation: 5,
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ),
                      SizedBox(height: screenHeight * 0.03),
                    ],
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
