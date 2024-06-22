
import 'package:app1/main.dart';
import 'package:flutter/material.dart';

class Language extends ChangeNotifier {
  String _lang = language;
  getLang() {
    return _lang;
  }
  setLang(String lang) {
    _lang = lang;
    notifyListeners();
  }


//profileUser  Widget:
  String switchLang() {
    if (getLang() == 'Arabic') {
      return "اللغة";
    }
    return 'language';
  }
  String editProfile() {
    if (getLang() == 'Arabic') {
      return "تعديل الملف الشخصي";
    }
    return 'Edit profile';
  }
  String Logout() {
    if (getLang() == 'Arabic') {
      return "تسجيل خروج";
    }
    return 'Logout';
  }

  String shared() {
    if (getLang() == 'Arabic') {
      return "عندما قمت بمشاركة المنتج";
    }
    return 'When you shared product';
  }
  String appear() {
    if (getLang() == 'Arabic') {
      return "سوف تظهر في ملفك الخاص بك.";
    }
    return 'they \'ll appear on your profile.';
  }
  String first() {
    if (getLang() == 'Arabic') {
      return "شارك منتجك الأول الآن!";
    }
    return 'Share your first product now!';
  }

  //Search:
  String Search() {
    if (getLang() == 'Arabic') {
      return " البحث ";
    }
    return 'Search';
  }
  String SearchVaildation() {
    if (getLang() == 'Arabic') {
      return " الرجاء إدخال الاسم الكامل للبحث ";
    }
    return 'Please enter a complete name';
  }
  String SearchForNothings() {
    if (getLang() == 'Arabic') {
      return " لايوجد شيئ للعرض  ";
    }
    return 'Nothing to show';
  }


  //Login:
  String WelcomeBack() {
    if (getLang() == 'Arabic') {
      return "  ! اهلا بك مجددا  ";
    }
    return 'Welcome back !';
  }
  String explore() {
    if (getLang() == 'Arabic') {
      return " تسجيل الدخول لمتابعة التصفح  ";
    }
    return 'let\'s login for explore continues';
  }
  String email() {
    if (getLang() == 'Arabic') {
      return " البريد الإلكتروني ";
    }
    return 'Email';
  }
  String Noemail() {
    if (getLang() == 'Arabic') {
      return " لا يمكن أن يكون البريد الإلكتروني فارغًا ";
    }
    return 'email can not be empty';
  }
  String password() {
    if (getLang() == 'Arabic') {
      return "كلمة المرور ";
    }
    return 'Password';
  }
  String Nopassword() {
    if (getLang() == 'Arabic') {
      return "لا يمكن أن تكون كلمة المرور فارغة ";
    }
    return 'password can not be empty ';
  }
  String Login() {
    if (getLang() == 'Arabic') {
      return " تسجيل الدخول";
    }
    return 'Login';
  }
  String Forget() {
    if (getLang() == 'Arabic') {
      return " نسيت معلومات دخولك؟";
    }
    return 'Forgot your login details?';
  }
  String help() {
    if (getLang() == 'Arabic') {
      return " احصل على المساعدة لتسجيل الدخول.";
    }
    return 'Get help logging in.';
  }
  String NoAccount() {
    if (getLang() == 'Arabic') {
      return " ليس لديك حساب؟";
    }
    return 'don\'t have an account?';
  }
  String Signup() {
    if (getLang() == 'Arabic') {
      return " اشتراك";
    }
    return 'signup';
  }


  //SignUp:
  String Started() {
    if (getLang() == 'Arabic') {
      return "  هيا بنا نبدأ ";
    }
    return 'Let\'s Get Started';
  }
  String CreateAccount() {
    if (getLang() == 'Arabic') {
      return " إنشاء حساب للحصول على جميع الميزات ";
    }
    return 'Create an account to get all features';
  }
  String FullName() {
    if (getLang() == 'Arabic') {
      return " أدخل اسمك الكامل ";
    }
    return 'Enter your full  name';
  }
  String NotEmpty() {
    if (getLang() == 'Arabic') {
      return "لايمكن ان يكون فارغا";
    }
    return ' can not be empty';
  }
  String PhoneNumber() {
    if (getLang() == 'Arabic') {
      return " رقم الهاتف ";
    }
    return 'Phone number';
  }
  String Next() {
    if (getLang() == 'Arabic') {
      return "  التالي ";
    }
    return 'Next';
  }

//ForgetPassword:
  String EnterEmail() {
    if (getLang() == 'Arabic') {
      return "أدخل بريدك الإلكتروني. ";
    }
    return 'Enter your email.';
  }
  String FindEmail() {
    if (getLang() == 'Arabic') {
      return " جد حسابك ";
    }
    return  'Find your account';
  }


  //Ckeck code:
  String EnterCode() {
    if (getLang() == 'Arabic') {
      return "ادخل رمزك ";
    }
    return 'Enter your code';
  }


  //reset Password:
  String NoPassword() {
    if (getLang() == 'Arabic') {
      return "لا يمكن أن تكون كلمة المرور فارغة ";
    }
    return 'password can not be empty';
  }
  String ReWritePassword() {
    if (getLang() == 'Arabic') {
      return "أعد كتابة كلمة المرور الخاصة بك ";
    }
    return 'Re_write your password';
  }

  //LogOut:
  String Sure() {
    if (getLang() == 'Arabic') {
      return "هل أنت متأكد؟ ";
    }
    return 'Are you sure?';
  }

//AddProducts:
  String Choose() {
    if (getLang() == 'Arabic') {
      return "إختر خيارا ";
    }
    return 'Choose option';
  }
  String Camera() {
    if (getLang() == 'Arabic') {
      return "الكاميرا ";
    }
    return 'Camera';
  }
  String Gallary() {
    if (getLang() == 'Arabic') {
      return "المعرض ";
    }
    return 'Gallary';
  }
  String Productname() {
    if (getLang() == 'Arabic') {
      return "اسم المنتج ";
    }
    return 'Product name';
  }
  String NoName() {
    if (getLang() == 'Arabic') {
      return "لا يمكن أن يكون الاسم فارغًا";
    }
    return 'name can not be empty';
  }
  String ProductPrice() {
    if (getLang() == 'Arabic') {
      return "سعر المنتج ";
    }
    return 'Product price';
  }
  String NoPrice() {
    if (getLang() == 'Arabic') {
      return "لا يمكن أن يكون السعر فارغًا";
    }
    return 'price can not be empty';
  }
  String Count() {
    if (getLang() == 'Arabic') {
      return "عدد";
    }
    return 'Count';
  }
  String NoCount() {
    if (getLang() == 'Arabic') {
      return "لا يمكن أن يكون العدد فارغًا";
    }
    return 'count can not be empty';
  }
  String Description() {
    if (getLang() == 'Arabic') {
      return "وصف ";
    }
    return 'Description';
  }
  String NoDescription() {
    if (getLang() == 'Arabic') {
      return "لا يمكن أن يكون الوصف فارغًا";
    }
    return 'description can not be empty';
  }


//details:
  String RatingAndReviews(){
    if (getLang() == 'Arabic') {
      return "التقييم والمراجعات ";
    }
    return 'Rating And Reviews';
  }
  String Edit(){
    if (getLang() == 'Arabic') {
      return "تعديل  ";
    }
    return 'Edit';
  }
  String Delete(){
    if (getLang() == 'Arabic') {
      return "حذف ";
    }
    return 'Delete';
  }
  String EditProduts(){
    if (getLang() == 'Arabic') {
      return "تعديل معلومات المنتج الخاص بك";
    }
    return 'Edit your Product information';
  }
  String seeMore(){
    if (getLang() == 'Arabic') {
      return "شاهد المزيد";
    }
    return 'seeMore';
  }



//DisplayProducts:
  String Addratingreview(){
    if (getLang() == 'Arabic') {
      return "أضف التقييم والمراجعة الآن !!";
    }
    return 'Add rating & review now !!';
  }
  String Cart(){
    if (getLang() == 'Arabic') {
      return "أضف إلى السلة";
    }
    return 'Add To Cart';
  }



  //Cart:
  String AddQuantity(){
    if (getLang() == 'Arabic') {
      return "أضف الكمية التي تريدها";
    }
    return 'Add quantity you want';
  }
  String Quantity(){
    if (getLang() == 'Arabic') {
      return " الكمية ";
    }
    return 'Quantity';
  }
  String NoQuantity(){
    if (getLang() == 'Arabic') {
      return "لا يمكن أن تكون الكمية فارغة";
    }
    return 'quantity can not be empty';
  }
  String Done(){
    if (getLang() == 'Arabic') {
      return "تم";
    }
    return 'Done';
  }
  String Order(){
    if (getLang() == 'Arabic') {
      return "اطلب الان";
    }
    return 'Order Now !!';
  }


  //AddRating:
  String AddyourRateReview(){
    if (getLang() == 'Arabic') {
      return "أضف تقييمك ومراجعتك!";
    }
    return 'Add your Rate & Review !';
  }
  String yourreview(){
    if (getLang() == 'Arabic') {
      return "مراجعتك";
    }
    return 'your review';
  }
  String entername(){
    if (getLang() == 'Arabic') {
      return "الرجاء إدخال اسم المنتج";
    }
    return 'Please enter the product name';
  }

  String enterprice(){
    if (getLang() == 'Arabic') {
      return "الرجاء إدخال سعر المنتج";
    }
    return 'Please enter the product price';
  }

  String enterCount(){
    if (getLang() == 'Arabic') {
      return "الرجاء إدخال كمية المنتج";
    }
    return 'Please enter the product Count';
  }

  String enterDescription(){
    if (getLang() == 'Arabic') {
      return "الرجاء إدخال وصف المنتج";
    }
    return 'Please enter the product Description';
  }
  String DeteteCart(){
    if (getLang() == 'Arabic') {
      return "حذف من سلة التسوق؟";
    }
    return 'Delete from cart?';
  }

  String UpdateQuantity(){
    if (getLang() == 'Arabic') {
      return "تحديث الكمية";
    }
    return 'Update quantity';
  }

  String Editinfo (){
    if (getLang() == 'Arabic') {
      return "تعديل المعلومات الخاصة بك";
    }
      return 'Edit your information';
  }

  String name (){
    if (getLang() == 'Arabic') {
      return "اسم";
    }
    return 'Name';
  }
  String Number (){
    if (getLang() == 'Arabic') {
      return "رقم";
    }
    return 'Number';
  }
  String enterNumber (){
    if (getLang() == 'Arabic') {
      return "الرقم";
    }
    return 'Please enter the  Number';
  }
  String entereditName (){
    if (getLang() == 'Arabic') {
      return "الاسم";
    }
    return 'Please enter the  name';
  }

  String noProducts (){
    if (getLang() == 'Arabic') {
      return "ليس لديك أي منتجات حتى الآن";
    }
    return 'not have any Products yet';
  }


  //Messages:
  String addToFav(){
    if (getLang() == 'Arabic') {
      return "تمت إضافة المنتج إلى المفضلة";
    }
    return 'Product added to favorites';
  }

  String removeFromFav(){
    if (getLang() == 'Arabic') {
      return "تمت إزالة المنتج من المفضلة";
    }
    return 'Product removed from favorites';
  }

  String checkRequest(){
    if (getLang() == 'Arabic') {
      return "تم تأكيد الطلب ، تحقق من بريدك الإلكتروني";
    }
    return 'The request has been confirmed, check your email';
  }

  String confirmOrder(){
    if (getLang() == 'Arabic') {
      return "هل تريد تأكيد الطلب؟";
    }
    return 'Do you want to confirm the order?';
  }

  String Confirmation(){
    if (getLang() == 'Arabic') {
      return "تأكيد";
    }
    return 'Confirmation';
  }

  String addsuccessfullyToCart(){
    if (getLang() == 'Arabic') {
      return "تمت عملية الإضافة بنجاح";
    }
    return 'The addition operation was completed successfully';
  }
  String update(){
    if (getLang() == 'Arabic') {
      return "تحديث";
    }
    return 'update';
  }
}
