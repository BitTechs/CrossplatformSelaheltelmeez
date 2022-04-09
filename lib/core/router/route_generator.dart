import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/src/data/landing/dtos/list_item.dart';
import 'package:selaheltelmeez/src/data/student/arguments/game_object_argument.dart';
import 'package:selaheltelmeez/src/views/landing/landing_screen.dart';
import 'package:selaheltelmeez/src/views/parent/add_child/add_child_screen.dart';
import 'package:selaheltelmeez/src/views/parent/child_screen/child_screen.dart';
import 'package:selaheltelmeez/src/views/parent/classroom/classroom.dart';
import 'package:selaheltelmeez/src/views/parent/detailed_lesson_report/parent_detailed_lesson_report.dart';
import 'package:selaheltelmeez/src/views/parent/detailed_subject_report/parent_detailed_subject_report.dart';
import 'package:selaheltelmeez/src/views/parent/navigation_bar/Parent_navigation_bar_screen.dart';
import 'package:selaheltelmeez/src/views/parent/recent_activity/parent_recent_activity.dart';
import 'package:selaheltelmeez/src/views/parent/register_child/register_child_screen.dart';
import 'package:selaheltelmeez/src/views/parent/search_for_child/search_for_child_screen.dart';
import 'package:selaheltelmeez/src/views/parent/subject_screen/subject_screen.dart';
import 'package:selaheltelmeez/src/views/parent/subject_statistics/subject_statistics_screen.dart';
import 'package:selaheltelmeez/src/views/parent/teacher_screen/teacher_screen.dart';
import 'package:selaheltelmeez/src/views/parent/usage_report/parent_usage_report.dart';
import 'package:selaheltelmeez/src/views/student/achievements/achievements_screen.dart';
import 'package:selaheltelmeez/src/views/student/class_screen/class_screen.dart';
import 'package:selaheltelmeez/src/views/student/detailed_lesson_report/detailed_lesson_report_screen.dart';
import 'package:selaheltelmeez/src/views/student/detailed_subject_report/detailed_subject_report_screen.dart';
import 'package:selaheltelmeez/src/views/student/homework/homework_screen.dart';
import 'package:selaheltelmeez/src/views/student/homework_detailed/homework_detailed_screen.dart';
import 'package:selaheltelmeez/src/views/student/lesson_clips/lesson_screen.dart';
import 'package:selaheltelmeez/src/views/student/quiz/quiz_screen.dart';
import 'package:selaheltelmeez/src/views/student/recent_activity/recent_activity_screen.dart';
import 'package:selaheltelmeez/src/views/student/student_navigation_bar/student%20_navigation_bar_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/change_email_or_mobile/change_email_or_mobile_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/forget_password/forget_password_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/forget_password/reset_password_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/forget_password/validate_forget_password_otp_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/login/login_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/register/register_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/update_profile/update_profile_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/validate_otp/validate_otp_screen.dart';
import 'package:selaheltelmeez/src/views/student/classes/class_search_screen.dart';
import 'package:selaheltelmeez/src/views/student/units/unit_screen.dart';
import 'package:selaheltelmeez/src/views/student/usage_report/usage_report_screen.dart';
import 'package:selaheltelmeez/src/views/teacher/add_new_class/TeacherAddClass.dart';
import 'package:selaheltelmeez/src/views/teacher/add_new_exam/teacher_add_exam.dart';
import 'package:selaheltelmeez/src/views/teacher/add_new_homework/teacher_add_homework.dart';
import 'package:selaheltelmeez/src/views/teacher/add_subject/TeacherAddSubject.dart';
import 'package:selaheltelmeez/src/views/teacher/class_screen/teacher_class_screen.dart';
import 'package:selaheltelmeez/src/views/teacher/classes/teacher_classes_screen.dart';
import 'package:selaheltelmeez/src/views/teacher/edit_class/teacher_edit_class.dart';
import 'package:selaheltelmeez/src/views/teacher/exam_result/teacher_exam_result.dart';
import 'package:selaheltelmeez/src/views/teacher/exam_screen/teacher_exam_screen.dart';
import 'package:selaheltelmeez/src/views/teacher/exams/teacher_exams_screen.dart';
import 'package:selaheltelmeez/src/views/teacher/exams_details/teacher_exams_details.dart';
import 'package:selaheltelmeez/src/views/teacher/homework_screen/teacher_homework_screen.dart';
import 'package:selaheltelmeez/src/views/teacher/homeworks/teacher_homeworks.dart';
import 'package:selaheltelmeez/src/views/teacher/joined_students/teacher_joined_students.dart';
import 'package:selaheltelmeez/src/views/teacher/navigation_bar/Teacher_navigation_bar_screen.dart';
import 'package:selaheltelmeez/src/views/teacher/student_progress/teacher_student_progress.dart';
import 'package:selaheltelmeez/src/views/teacher/student_screen/teacher_student_screen.dart';
import 'package:selaheltelmeez/src/views/teacher/subject_screen/teacher_subject_screen.dart';
import 'package:selaheltelmeez/src/views/teacher/subject_timeline/teacher_subject_timeline.dart';
import 'package:selaheltelmeez/src/views/teacher/subjects_screen/teacher_subjects_screen.dart';
import 'package:selaheltelmeez/widgets/web_view/game_object_web_interactive.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class RouteGenerator {

  static PageTransitionType pageTransitionType = PageTransitionType.rightToLeft;
  static Alignment pageAlignment = Alignment.bottomCenter;
  static  Duration pushDuration = const Duration(milliseconds: 300);
  static Duration popDuration = const Duration(milliseconds: 300);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.index:
        return PageTransition(child: const LandingScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.login:
        return PageTransition(child: const LoginScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.register:
        return PageTransition(child:  RegisterScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.updateProfile:
        return PageTransition(child:  UpdateProfileScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.validateOTP:
        return PageTransition(child:  ValidateOTPScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.changeEmailOrMobile:
        return PageTransition(child: const ChangeEmailOrMobileScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.forgetPassword:
        return PageTransition(child: const ForgetPasswordScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.validateForgetPassword:
        return PageTransition(child:  ValidateForgetPasswordOTPScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.resetPassword:
        String identityId = (args as String);
        return PageTransition(child:  ResetPasswordScreen(identityUserId: identityId),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.studentHomeLayout:
        return PageTransition(child: const StudentNavBarScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.studentSubject:
        List<dynamic> dynamicArgs = (args as List<dynamic>);
        return PageTransition(child: UnitScreen(curriculumId: dynamicArgs[0],curriculumName: dynamicArgs[1], backgroundImage: dynamicArgs[2], iconImage: dynamicArgs[3],),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.studentLesson:
        List<dynamic> dynamicArgs = (args as List<dynamic>);
        return PageTransition(child: LessonScreen(title: dynamicArgs[0], subtitle: dynamicArgs[1], image: dynamicArgs[2], lessonId: dynamicArgs[3], subjectId: dynamicArgs[4]),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.classSearch:
        return PageTransition(child: ClassSearchScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.usageReport:
        return PageTransition(child: const UsageReportScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.recentActivity:
        return PageTransition(child: const RecentActivityScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.detailedSubjectReport:
        return PageTransition(child: const DetailedSubjectReportScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.detailedLessonReport:
        return PageTransition(child: const DetailedLessonReportScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.studentAchievements:
        return PageTransition(child: const AchievementsScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.quizScreen:
        return PageTransition(child: const QuizScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.homeworkDetailedScreen:
        return PageTransition(child: const HomeworkDetailedScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.classScreen:
        return PageTransition(child: const ClassScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.homeworkScreen:
        return PageTransition(child: const HomeworkScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);

     //Parent Screens
      case RouteNames.parentHome:
        return PageTransition(child: const ParentNavBarScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.addChild:
        return PageTransition(child: const AddChildScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.searchForChild:
        return PageTransition(child: const SearchForChildScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.registerChild:
        return PageTransition(child: const RegisterChildScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.childScreen:
        return PageTransition(child: const ChildScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.parentSubject:
        return PageTransition(child: const ParentSubjectScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.subjectStatistics:
        return PageTransition(child: const SubjectStatisticsScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherScreen:
        return PageTransition(child: const TeacherScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.classroom:
        return PageTransition(child: const ClassRoom(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.parentUsageReport:
        return PageTransition(child: const ParentUsageReport(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.parentRecentActivity:
        return PageTransition(child: const ParentRecentActivity(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.parentDetailedSubjectReport:
        return PageTransition(child: const ParentDetailedSubjectReport(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.parentDetailedLessonReport:
        return PageTransition(child: const ParentDetailedLessonReport(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.gameObjectInteractiveViewer:
        GameObjectArgument gameObjectArgument = (args as GameObjectArgument);
        return PageTransition(child: GameObjectWebViewer(gameObjectArgument: gameObjectArgument,),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);

    //Teacher Screens
      case RouteNames.teacherHome:
        return PageTransition(child: const TeacherNavBarScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherSubjects:
        return PageTransition(child: const TeacherSubjectsScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherAddSubject:
        return PageTransition(child: const TeacherAddSubject(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherSubjectScreen:
        return PageTransition(child: const TeacherSubjectScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherSubjectTimeline:
        return PageTransition(child: const TeacherSubjectTimeline(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherClassesScreen:
        return PageTransition(child: const TeacherClassesScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherAddClass:
        return PageTransition(child: const TeacherAddClass(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherClassScreen:
        return PageTransition(child: const TeacherClassScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherEditClass:
        return PageTransition(child: const TeacherEditClass(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherJoinedStudents:
        return PageTransition(child: const TeacherJoinedStudents(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherStudentScreen:
        return PageTransition(child: const TeacherStudentScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherStudentProgress:
        return PageTransition(child: const TeacherStudentProgress(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherExamsDetails:
        return PageTransition(child: const TeacherExamsDetails(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherExamsScreen:
        return PageTransition(child: const TeacherExamsScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherAddExam:
        return PageTransition(child: const TeacherAddExam(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherExamScreen:
        return PageTransition(child: const TeacherExamScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherExamResult:
        return PageTransition(child: const TeacherExamResult(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherHomeworks:
        return PageTransition(child: const TeacherHomeworks(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherAddHomework:
        return PageTransition(child: const TeacherAddHomework(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.teacherHomeworkScreen:
        return PageTransition(child: const TeacherHomeworkScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);


    // Validation of correct data type
      case RouteNames.webViewer:
        ListItem listItem = (args as ListItem);
          return PageTransition(child:  WebViewer(url: listItem.url!,title: listItem.name!,),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.youTubeViewer:
      // Validation of correct data type
        ListItem listItem = (args as ListItem);
        return PageTransition(child: YouTubeViewer(videoCode: listItem.url!),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      default:
        return PageTransition(child: const LandingScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
    // If there is no such named route in the switch statement, e.g. /third
    }
  }
}