
import 'package:flutter/material.dart';
import 'package:musicoo/constants/CustomWidget.dart';
import 'package:musicoo/constants/constants.dart';

class VerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Container(
          width: size.width,
          padding: getPadding(
            left: 23,
            top: 24,
            right: 23,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgArrowleft,
                height: getSize(
                  24.00,
                ),
                width: getSize(
                  24.00,
                ),
                margin: getMargin(
                  left: 1,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 18,
                ),
                child: Text(
                  "Verify your email",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getFontSize(
                      30,
                    ),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: getHorizontalSize(
                  306.00,
                ),
                margin: getMargin(
                  top: 7,
                ),
                child: Text(
                  "Hi Johny! We’ve sent an email to johny123@gmail.com to verify your email address and activate your account. The link in the email will expire in 24 hours.",
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getFontSize(
                      12,
                    ),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 1,
                  top: 20,
                  bottom: 5,
                ),
                child: Row(
                  children: [
                    Text(
                      "Click Here",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getFontSize(
                          12,
                        ),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 4,
                      ),
                      child: Text(
                        "Click Here",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getFontSize(
                            12,
                          ),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
