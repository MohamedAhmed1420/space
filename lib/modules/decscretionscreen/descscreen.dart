import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:space/core/module/planet_model.dart';
import 'package:space/modules/widgets/title_widget.dart';

import '../../core/colors/app_colors.dart';

class DescScreen extends StatelessWidget {
  static const routeName = 'DescScreen';

  DescScreen({super.key});

  Planet? planet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final planet = ModalRoute.of(context)?.settings.arguments as Planet?;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // نقلنا الـ TitleWidget هنا ليعمل بشكل صحيح داخل الـ body
            TitleWidget(title: planet!.name, description: planet.title),
            AspectRatio(
              aspectRatio: 1,
              child: ModelViewer(
                backgroundColor: AppColors.black,
                src: 'assets/models/${planet.model3D}',
                alt: planet.title,
                ar: false,
                autoRotate: true,
                iosSrc: planet.model3D,
                disableZoom: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // التصحيح هنا
                children: [
                  Text('About', style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  Text(planet.about, style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  Text(
                    "Distance from Sun (km) : ${planet.distanceFromSun}",
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(planet.lengthOfDay, style: theme.textTheme.bodyLarge),
                  Text(
                    planet.orbitalPeriod.toString(),
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(planet.radius, style: theme.textTheme.bodyLarge),
                  Text(planet.mass, style: theme.textTheme.bodyLarge),
                  Text(
                    planet.gravity.toString(),
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(planet.surfaceArea, style: theme.textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
