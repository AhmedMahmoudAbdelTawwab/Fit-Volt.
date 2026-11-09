// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:fit_volt/feature/auth/sign_up/data/firebase/fire_base_sign_in.dart'
    as _i281;
import 'package:fit_volt/feature/auth/sign_up/data/repo/data_source_imp/sign_in_data_source_imp.dart'
    as _i317;
import 'package:fit_volt/feature/auth/sign_up/data/repo/repo_imp/sign_in_repo_imp.dart'
    as _i777;
import 'package:fit_volt/feature/auth/sign_up/domain/repo/data_sourec/sign_in_data_source.dart'
    as _i774;
import 'package:fit_volt/feature/auth/sign_up/domain/repo/repo/sign_in_repo.dart'
    as _i290;
import 'package:fit_volt/feature/auth/sign_up/domain/use_case/sign_up_use_case.dart'
    as _i824;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i281.FireBaseSignIn>(() => _i281.FireBaseSignIn());
    gh.factory<_i774.SignInDataSource>(
      () => _i317.SignInDataSourceImp(gh<_i281.FireBaseSignIn>()),
    );
    gh.factory<_i290.SignInRepo>(
      () => _i777.SignInRepoImp(gh<_i774.SignInDataSource>()),
    );
    gh.factory<_i824.SignUpUseCase>(
      () => _i824.SignUpUseCase(gh<_i290.SignInRepo>()),
    );
    return this;
  }
}
