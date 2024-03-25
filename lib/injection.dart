

import 'package:example_sign_up/presantation/pages/sign_up/repositories/impl/sign_up_repository_impl.dart';
import 'package:example_sign_up/presantation/pages/sign_up/repositories/sign_up_repository.dart';

import 'package:get_it/get_it.dart';

import 'core/handlers/http_service.dart';

T inject<T extends Object>() {
  return GetIt.I.get<T>();
}


final GetIt getIt = GetIt.instance;


void setUpDependencies() {
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  // getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  // getIt.registerLazySingleton<SignInRepository>(() => SignInRepositoryImpl());
  getIt.registerLazySingleton<SignUpRepository>(() => SignUpRepositoryImpl());
  // getIt.registerLazySingleton<OTPRepository>(() => OTPRepositoryImpl());
  // getIt.registerLazySingleton<ForgotPasswordRepository>(() => ForgotPasswordRepositoryImpl());
  // getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());
  // getIt.registerLazySingleton<CreateShopRepository>(() => CreateShopRepositoryImpl());
  // getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  // getIt.registerLazySingleton<ShopInfoRepository>(() => ShopInfoRepositoryImpl());
  // getIt.registerLazySingleton<ClientContactRepository>(() => ClientContactRepositoryImpl());
  // getIt.registerLazySingleton<ClientProfileRepository>(() => ClientProfileRepositoryImpl());
  // getIt.registerLazySingleton<StatisticInfoRepository>(() => StatisticInfoRepositoryImpl());
  // getIt.registerLazySingleton<ApplicationRepository>(() => ApplicationRepositoryImpl());
  // getIt.registerLazySingleton<TransactionChartRepository>(() => TransactionChartRepositoryImpl());
  // getIt.registerLazySingleton<SellerProfileRepository>(() => SellerProfileRepositoryImpl());
}

// ...

// Obyekt yaratilganidan so'ng ishlatish
// final  signInRepository = getIt.get<SignInRepository>();
// final  appRouter = getIt.get<AppRouter>();
final  signUpRepository = getIt.get<SignUpRepository>();
// final  otpRepository = getIt.get<OTPRepository>();
// final  forgotPasswordRepository = getIt.get<ForgotPasswordRepository>();
// final  profileRepository = getIt.get<ProfileRepository>();
// final  createShopRepository = getIt.get<CreateShopRepository>();
// final  homeRepository = getIt.get<HomeRepository>();
// final  shopInfoRepository = getIt.get<ShopInfoRepository>();
// final  addClientContactRepository = getIt.get<ClientContactRepository>();
// final  clientContactRepository = getIt.get<ClientContactRepository>();
// final  clientProfileRepository = getIt.get<ClientProfileRepository>();
// final  statisticInfoRepository = getIt.get<StatisticInfoRepository>();
// final  applicationRepository = getIt.get<ApplicationRepository>();
// final  transactionChartRepository = getIt.get<TransactionChartRepository>();
// final  sellerProfileRepository = getIt.get<SellerProfileRepository>();






