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
final List<Map<String, dynamic>> entertainmentQuizCategories = [
  {
    "category": "General Knowledge",
    "color": AppColors.earthColor,
    "height": 200,
    "icon": AssetHelper.earthSvg,
    "id": 9,
  },
  {
    "category": "Anime",
    "color": AppColors.narutoColor,
    "height": 250,
    "icon": AssetHelper.narutoSvg,
    "id": 31,
  },
  {
    "category": "Sports",
    "color": AppColors.pinkShade.withOpacity(0.7),
    "height": 200,
    "icon": AssetHelper.gameSvg,
    "id": 21,
  },
];
