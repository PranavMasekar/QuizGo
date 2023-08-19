import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/helpers/export_helpers.dart';

final List<Map<String, dynamic>> techQuizCategories = [
  {
    "category": "Docker",
    "color": AppColors.dockerColor,
    "height": 200,
    "icon": AssetHelper.dockerSvg,
  },
  {
    "category": "JavaScript",
    "color": AppColors.javaScriptColor,
    "height": 250,
    "icon": AssetHelper.javaScriptSvg,
  },
  {
    "category": "MySQL",
    "color": AppColors.mySQLColor,
    "height": 200,
    "icon": AssetHelper.mySQLSvg,
  },
  {
    "category": "Kubernetes",
    "color": AppColors.kubernetesColor,
    "height": 250,
    "icon": AssetHelper.kubernetesSvg,
  },
  {
    "category": "Linux",
    "color": AppColors.linuxColor,
    "height": 200,
    "icon": AssetHelper.linuxSvg,
  },
];
