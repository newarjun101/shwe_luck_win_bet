import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/auth/profile_model.dart';
import 'package:shwe_luck_win_bet/app/core/data/repo/auth_repo.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_result.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';

class ProfileScreenController extends GetxController {

 late AuthRepo _authRepo;
 late ProfileModel mModel;
 RxBool  haveLoading = false.obs;
  ProfileScreenController() {
    _authRepo = Get.put(AuthRepo());
    getProfile();
  }

  getProfile() async{
    haveLoading.value = true;
    ApiResult<ProfileModel> _mProfileResult = await _authRepo.getProfile();

    if(_mProfileResult.status==Status.eCOMPLETED) {
      mModel = _mProfileResult.mData;
      haveLoading.value = false;
      print(mModel.phone);
    } else {

    }

  }
}