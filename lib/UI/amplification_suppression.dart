import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../main_menu.dart';
import 'UI_recorces/tool_containers.dart';

class AmplificationSuppressionPage extends StatefulWidget {
  const AmplificationSuppressionPage({super.key});

  @override
  State<AmplificationSuppressionPage> createState() =>
      _AmplificationSuppressionPageState();
}

class _AmplificationSuppressionPageState
    extends State<AmplificationSuppressionPage> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double screenHeight =
        MediaQuery.of(context).size.height - statusBarHeight;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: customColors.backgroundTool,
      body: SafeArea(
        top: true,
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.07),
            SizedBox(
              height: screenHeight * 0.0725,
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.2),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: const Center(
                      child: AutoSizeText(
                        'Amplification and Suppression calculator',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.2),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              children: [
                SizedBox(width: screenWidth * 0.05),
                Column(
                  children: [
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.35,
                          width: screenWidth * 0.9,
                        ),
                        TollContainerTitleBar(
                            title: "Voltage / Current",
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Stack(
                      children: [
                        TollContainer(
                          height: screenHeight * 0.35,
                          width: screenWidth * 0.9,
                        ),
                        TollContainerTitleBar(
                            title: "Period",
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.05),
              ],
            ),
            SizedBox(height: screenHeight * 0.085),
          ],
        ),
      ),
    );
  }
}
