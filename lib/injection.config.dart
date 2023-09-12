// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sibaba/applications/admin/bloc/add_kelurahan/add_kelurahan_cubit.dart'
    as _i26;
import 'package:sibaba/applications/admin/bloc/add_ustadz/add_ustadz_cubit.dart'
    as _i27;
import 'package:sibaba/applications/admin/bloc/gallery/gallery_cubit.dart'
    as _i29;
import 'package:sibaba/applications/admin/bloc/kapanewon/kapanewon_cubit.dart'
    as _i31;
import 'package:sibaba/applications/admin/bloc/kelurahan/kelurahan_cubit.dart'
    as _i32;
import 'package:sibaba/applications/admin/bloc/santri/santri_cubit.dart'
    as _i35;
import 'package:sibaba/applications/admin/bloc/user/user_cubit.dart' as _i23;
import 'package:sibaba/applications/admin/bloc/ustadz/ustadz_cubit.dart'
    as _i37;
import 'package:sibaba/applications/admin/implementations/admin_user_impl.dart'
    as _i4;
import 'package:sibaba/applications/admin/implementations/admin_ustadz_impl.dart'
    as _i25;
import 'package:sibaba/applications/admin/implementations/gallery_repo_impl.dart'
    as _i6;
import 'package:sibaba/applications/admin/implementations/kapanewon_repo_impl.dart'
    as _i8;
import 'package:sibaba/applications/admin/implementations/kelurahan_repo_impl.dart'
    as _i10;
import 'package:sibaba/applications/admin/implementations/santri_impl.dart'
    as _i19;
import 'package:sibaba/applications/admin/repositories/admin_user_repo.dart'
    as _i3;
import 'package:sibaba/applications/admin/repositories/gallery_repo.dart'
    as _i5;
import 'package:sibaba/applications/admin/repositories/kapanewon_repo.dart'
    as _i7;
import 'package:sibaba/applications/admin/repositories/kelurahan_repo.dart'
    as _i9;
import 'package:sibaba/applications/admin/repositories/santri_repo.dart'
    as _i18;
import 'package:sibaba/applications/admin/repositories/ustadz_repo.dart'
    as _i24;
import 'package:sibaba/applications/info_lokasi/bloc/cubit/info_lokasi_cubit.dart'
    as _i30;
import 'package:sibaba/applications/info_lokasi/implementations/location_repo_impl.dart'
    as _i14;
import 'package:sibaba/applications/info_lokasi/repository/location_repo.dart'
    as _i13;
import 'package:sibaba/applications/kontak_kami/bloc/cubit/kontak_kami_cubit.dart'
    as _i33;
import 'package:sibaba/applications/kontak_kami/bloc/cubit/update_kontak_cubit.dart'
    as _i22;
import 'package:sibaba/applications/kontak_kami/implementations/kontak_kami_repo_impl.dart'
    as _i12;
import 'package:sibaba/applications/kontak_kami/repository/kontak_kami_repo.dart'
    as _i11;
import 'package:sibaba/applications/login/bloc/login/login_cubit.dart' as _i34;
import 'package:sibaba/applications/login/bloc/register/register_cubit.dart'
    as _i17;
import 'package:sibaba/applications/login/implementations/login_repo_impl.dart'
    as _i16;
import 'package:sibaba/applications/login/repositories/login_repo.dart' as _i15;
import 'package:sibaba/applications/tentang_kami/bloc/cubit/edit_tentang_kami_cubit.dart'
    as _i28;
import 'package:sibaba/applications/tentang_kami/bloc/cubit/tentang_kami_cubit.dart'
    as _i36;
import 'package:sibaba/applications/tentang_kami/implementations/tentang_kami_repo_impl.dart'
    as _i21;
import 'package:sibaba/applications/tentang_kami/repository/tentang_kami_repo.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AdminUserRepo>(() => _i4.AdminUserImpl());
    gh.factory<_i5.GalleryRepo>(() => _i6.GalleryRepoImpl());
    gh.factory<_i7.KapanewonRepo>(() => _i8.KapanewonRepoImpl());
    gh.factory<_i9.KelurahanRepo>(() => _i10.KelurahanRepoImpl());
    gh.factory<_i11.KontakKamiRepo>(() => _i12.KontakKamiRepoImpl());
    gh.factory<_i13.LocationRepo>(() => _i14.LocationRepoImpl());
    gh.factory<_i15.LoginRepo>(() => _i16.LoginRepoImpl());
    gh.factory<_i17.RegisterCubit>(
        () => _i17.RegisterCubit(gh<_i15.LoginRepo>()));
    gh.factory<_i18.SantriRepo>(() => _i19.SantriImpl());
    gh.factory<_i20.TentangKamirepo>(() => _i21.TentangKamiRepoImpl());
    gh.factory<_i22.UpdateKontakCubit>(
        () => _i22.UpdateKontakCubit(gh<_i11.KontakKamiRepo>()));
    gh.factory<_i23.UserCubit>(() => _i23.UserCubit(gh<_i3.AdminUserRepo>()));
    gh.factory<_i24.UstadzRepo>(() => _i25.AdminUstadzImpl());
    gh.factory<_i26.AddKelurahanCubit>(
        () => _i26.AddKelurahanCubit(gh<_i9.KelurahanRepo>()));
    gh.factory<_i27.AddUstadzCubit>(
        () => _i27.AddUstadzCubit(gh<_i24.UstadzRepo>()));
    gh.factory<_i28.EditTentangKamiCubit>(
        () => _i28.EditTentangKamiCubit(gh<_i20.TentangKamirepo>()));
    gh.factory<_i29.GalleryCubit>(
        () => _i29.GalleryCubit(gh<_i5.GalleryRepo>()));
    gh.factory<_i30.InfoLokasiCubit>(
        () => _i30.InfoLokasiCubit(gh<_i13.LocationRepo>()));
    gh.factory<_i31.KapanewonCubit>(
        () => _i31.KapanewonCubit(gh<_i7.KapanewonRepo>()));
    gh.factory<_i32.KelurahanCubit>(
        () => _i32.KelurahanCubit(gh<_i9.KelurahanRepo>()));
    gh.factory<_i33.KontakKamiCubit>(
        () => _i33.KontakKamiCubit(gh<_i11.KontakKamiRepo>()));
    gh.factory<_i34.LoginCubit>(() => _i34.LoginCubit(gh<_i15.LoginRepo>()));
    gh.factory<_i35.SantriCubit>(() => _i35.SantriCubit(gh<_i18.SantriRepo>()));
    gh.factory<_i36.TentangKamiCubit>(
        () => _i36.TentangKamiCubit(gh<_i20.TentangKamirepo>()));
    gh.factory<_i37.UstadzCubit>(() => _i37.UstadzCubit(gh<_i24.UstadzRepo>()));
    return this;
  }
}
