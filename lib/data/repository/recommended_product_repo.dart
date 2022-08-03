import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import '../api/api_client.dart';

class RecommendedProductReop extends GetxService {
  final ApiClient apiClient;

  RecommendedProductReop({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
