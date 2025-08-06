import 'package:dio/dio.dart';
import 'package:laza/core/networking/api_constants.dart';
import 'package:laza/features/home/data/models/category_model.dart';
import 'package:laza/features/home/data/models/product_model.dart';
import 'package:laza/features/login/data/models/login_request_body.dart';
import 'package:laza/features/login/data/models/login_response.dart';
import 'package:laza/features/signup/data/models/signup_request_body.dart';
import 'package:laza/features/signup/data/models/signup_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
  @GET(ApiConstants.products)
  Future<List<ProductModel>> getProducts(
    @Queries() Map<String, dynamic> productsPaginationQuery,
  );
  @GET(ApiConstants.categories)
  Future<List<CategoryModel>> getCategories();

  @GET(ApiConstants.products)
  Future<List<ProductModel>> getCategoryProducts({
    @Query('categoryId') required int categoryId,
    @Queries() Map<String, dynamic> productsPaginationQuery = const {},
  });
}
