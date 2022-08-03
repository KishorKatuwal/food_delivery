import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import '../api/api_client.dart';

class PopularProductReop extends GetxService {
  final ApiClient apiClient;

  PopularProductReop({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
    // return await apiClient.getData("/api/v1/products/popular");
  }
}
