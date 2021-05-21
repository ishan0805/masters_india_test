class ApiPaths {
  // Base URL
  static final baseUrl = 'https://devapi.teamwithsomeone.com';
  static final baseUrlNonSSL = 'http://devapi.teamwithsomeone.com';

  // Auth
  static final signUp = '/user/v1/signup';
  static final googleSignUp = '/user/v1/Oauth/signup';

  static final login = '/user/v1/login';
  static final googleLogin = '/user/v1/Oauth/login';

  static final sendCode = '/user/v1/otp/send/email';
  static final verifyCode = '/user/v1/enter/otp';
  static final resetPassword = '/user/v1/reset/password';

  static final updateProfile = '/user/v1/complete/profile';
  static final getBanners = '/banner/list';

  // Workout Categories
  static final getWorkoutTypes = '/categories';
  static final getWorkoutType = '/detail/id';

  // Body Parts
  static final getBodyParts = '/body-parts/get/by/category';

  // Workouts
  static final getWorkouts = '/workouts/by/bodypartAndcategory';
  static final getWorkout = '/workouts/get';

  // Training
  static final getTrainerProfile = '/trainer';
  static final buyTrainingProgram = '/payment';

  // Feed
  static final getArticles = '/feed';

  // Account

  // Fitness profile questions
  static final getFitnessProfileQuestions = '/fitness-questionnaire';
  static final submitAnswer = '/fitness-questionnaire/submit-answer';
  static final getFitnessUserQuestions =
      '/fitness-questionnaire/userSubmittedQuestionnairee';
  static final getSubscriptions = '/user-subscription/my';

  // Profile
  static final getBasicProfile = '/user/profile';
  static final changePassword = '/user/change-passowrd';
  static final submitFeedback = '/user/feed-back';

  //CLIENT PROGRESS REPORT
  static final getBodyMeasurements = '/user-measurement-chart';
  static final getWeightMeasurementsGraph = '/user-measurement-graph';
  static final getRunningMeasurements = '/user-distance-graph';
  static final getSkinFoldMeasurements = '/user-fold-measurement';
  static final getRM = '/user-one-repetition-maximum-measurement';
  static final getGraphInfo = '/graph-information';

  // SUBMIT MEASUREMENT
  static final submitClientMeasurement = '/user-measurement';

  // SUBMIT PICTURES
  static final submitClientPicture = '/user-check-in-gallery';

  //WORKOUTS
  static final getScheduldedWorkouts = '/workout-review';
  static final putWorkoutStatus = '/update-workout-status';

  //CLIENTDIET
  static final getClientDiet = '/diet-review';
  static final putDietStatus = '/update-diet-status';
  //TRANSFORMATION
  static final getTransformation = '/trainer/trasformation';
}
