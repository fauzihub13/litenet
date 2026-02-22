import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:litenet/core/helper/user_agent_helper.dart';
import 'package:litenet/core/provider/token_manager_provider.dart';
import 'package:litenet/core/provider/user_manager_provider.dart';
import 'package:litenet/routes/app_router.dart';
import 'package:litenet/routes/route_name.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

final baseUrl = dotenv.env['BASE_URL'];

@riverpod
Dio dio(Ref ref) {
  final dio = Dio();
  print("BASE URL -> $baseUrl");
  dio.options.baseUrl = baseUrl!;
  dio.options.connectTimeout = const Duration(seconds: 120);
  dio.options.receiveTimeout = const Duration(seconds: 120);
  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers['Accept'] = 'application/json';
  dio.options.validateStatus = (status) {
    return status == 200;
  };

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        TokenManager tokenManager = await ref.watch(
          tokenManagerProvider.future,
        );
        final authToken = await tokenManager.getToken();

        options.headers['Authorization'] = 'Bearer $authToken';

        // Get the User-Agent
        String userAgent = await UserAgentHelper.initUserAgentState();
        options.headers['User-Agent'] = userAgent;

        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final tokenManager = await ref.read(tokenManagerProvider.future);
          final userManager = await ref.read(userManagerProvider.future);

          if (await userManager.hasUser()) {
            await tokenManager.removeToken();
            await userManager.removeUser();

            ref.read(appRouterProvider).pushReplacementNamed(RouteName.loginPage);
          }
        } else {
          return handler.next(error);
        }
        return handler.next(error);
      },
    ),
  );

  if (!kReleaseMode) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }
  return dio;
}
