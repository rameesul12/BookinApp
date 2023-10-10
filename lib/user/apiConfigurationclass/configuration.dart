class ApiConfiguration {

static  String baseUrl='https://bookmyscreen.onrender.com/';

//=========================
//user Side
 static  String signup='signUp';
 static String getOtp='getOtp';
 static String login='signIn';
 static String resendOtp='resendOtp';
 static String forgetPass="get-verify";
 static String sendOtpEmail="forgotOtp";
 static String resertPassword="reset-password";
  static const baseUrlFilim="https://api.themoviedb.org/3";
  static const apiKey="a16115323f4b6863e6772960d6d13c22";
 static const movieApiKey='09d3fc1dfeba6863e19f1e7c677025d0';
 static const upcomingMovies='/movie/upcoming';
 static const getSearch='get-search/';
 static const theatreLocation='get-theatreShows';
 static const getTheatres='get-dates';
 static const getSeats='get-seats';
 static String payment='get-payment';
 static String getCurrentUser='getcurrentuser';
 static const userEdit='edit-profile';
 static String cancelingorder='cancel-order';
 



//=======================
//owner Side
//=======================

static String ownerSignUp='owner/ownerOtp';
static String ownerLogin='owner/login';
static String ownerOtpSignUp='owner/signUp';
static String getCurrentOwner='owner/getCurrentOwner';
static String postScreen='owner/add-screen';
static String getScreen="owner/get-screen";
static String deleteScreen='owner/delete-screen';
static String editScreen="owner/edit-screen";
static String getBooking="owner/get-bookings";
static String addShow="owner/add-show";
static String getMovies='admin/getMovies';
static String getShow="owner/get-shows";
static String showDeleting='owner/delete-show';
static String showEdit='owner/edit-show';

 // static const baseUrlFilim="https://api.themoviedb.org/3";
  // static const apiKey="a16115323f4b6863e6772960d6d13c22";
}