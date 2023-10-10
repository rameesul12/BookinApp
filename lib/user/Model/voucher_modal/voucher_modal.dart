// ignore_for_file: non_constant_identifier_names

class VoucherDetails{

String couponCode;
String couponDescrtion;
String? couponExpire;
int?  discountAmount;
int? discountPercentage;
int? minimumAmount;
int? percentageMinimumAmount;
int? uptoAmount;
String selectedOption;

VoucherDetails({required this.couponCode,
required this.couponDescrtion,
required this.selectedOption,
required this.couponExpire,
this.discountAmount,
this.discountPercentage,
this.minimumAmount,
this.percentageMinimumAmount
,this.uptoAmount,});



}