// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:fit_volt/feature/auth/sign_up/data/firebase/fire_base_sign_up.dart'
    as _i1003;
import 'package:fit_volt/feature/auth/sign_up/data/repo/data_source_imp/sign_up_data_source_imp.dart'
    as _i640;
import 'package:fit_volt/feature/auth/sign_up/data/repo/repo_imp/sign_up_repo_imp.dart'
    as _i913;
import 'package:fit_volt/feature/auth/sign_up/domain/repo/data_sourec/sign_up_data_source.dart'
    as _i770;
import 'package:fit_volt/feature/auth/sign_up/domain/repo/repo/sign_up_repo.dart'
    as _i426;
import 'package:fit_volt/feature/auth/sign_up/domain/use_case/sign_up_use_case.dart'
    as _i824;
import 'package:fit_volt/feature/auth/sign_up/presentation/view_model/cubit_create_account/sign_up_cubit.dart'
    as _i222;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1003.FireBaseSignUp>(() => _i1003.FireBaseSignUp());
    gh.factory<_i770.SignUpDataSource>(
      () => _i640.SignUpDataSourceImp(gh<_i1003.FireBaseSignUp>()),
    );
    gh.factory<_i426.SignUpRepo>(
      () => _i913.SignUpRepoImp(gh<_i770.SignUpDataSource>()),
    );
    gh.factory<_i824.SignUpUseCase>(
      () => _i824.SignUpUseCase(gh<_i426.SignUpRepo>()),
    );
    gh.factory<_i222.SignUpCubit>(
      () => _i222.SignUpCubit(gh<_i824.SignUpUseCase>()),
    );
    return this;
  }
}
