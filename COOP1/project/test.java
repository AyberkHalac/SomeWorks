package test;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@SuppressWarnings("unused")
public class test {

	public static void main(String[] args) throws IOException {
		test t = new test();
		long startTime = System.currentTimeMillis();
		Teacher seymadogru = new Teacher();
		seymadogru.setName("seymadogru");
		seymadogru.setCourseHour(10);
		seymadogru.setCourseHourORG(10);
		seymadogru.getLessonType().add("MC");
		seymadogru.getCourseLevel().add("B");
		seymadogru.getTeacherSchedule()[1][0] = "OFFDAY";
		seymadogru.getTeacherSchedule()[1][1] = "OFFDAY";
		seymadogru.getTeacherSchedule()[1][2] = "OFFDAY";
		seymadogru.getTeacherSchedule()[2][3] = "OFFDAY";
		seymadogru.getTeacherSchedule()[2][4] = "OFFDAY";
		seymadogru.getTeacherSchedule()[2][5] = "OFFDAY";
		//
		//
		//
		Teacher berkanozkan = new Teacher();
		berkanozkan.setName("berkanozkan");
		berkanozkan.setCourseHour(10);
		berkanozkan.setCourseHourORG(10);
		berkanozkan.getLessonType().add("LS");
		berkanozkan.getCourseLevel().add("B");
		berkanozkan.getTeacherSchedule()[0][0] = "OFFDAY";
		berkanozkan.getTeacherSchedule()[0][1] = "OFFDAY";
		berkanozkan.getTeacherSchedule()[0][2] = "OFFDAY";
		berkanozkan.getTeacherSchedule()[0][3] = "OFFDAY";
		berkanozkan.getTeacherSchedule()[0][4] = "OFFDAY";
		berkanozkan.getTeacherSchedule()[0][5] = "OFFDAY";
		//
		//
		//
		Teacher ozgegundogdu = new Teacher();
		ozgegundogdu.setName("ozgegundogdu");
		ozgegundogdu.setCourseHour(20);
		ozgegundogdu.setCourseHourORG(20);
		ozgegundogdu.getLessonType().add("MC");
		ozgegundogdu.getLessonType().add("RW");
		ozgegundogdu.getCourseLevel().add("B");
		ozgegundogdu.getTeacherSchedule()[3][3] = "OFFDAY";
		ozgegundogdu.getTeacherSchedule()[3][4] = "OFFDAY";
		ozgegundogdu.getTeacherSchedule()[3][5] = "OFFDAY";
		//
		//
		//
		Teacher isilekim = new Teacher();
		isilekim.setName("isilekim");
		isilekim.setCourseHour(10);
		isilekim.setCourseHourORG(10);
		isilekim.getLessonType().add("RW");
		isilekim.getCourseLevel().add("B");
		isilekim.getTeacherSchedule()[2][3] = "OFFDAY";
		isilekim.getTeacherSchedule()[2][4] = "OFFDAY";
		isilekim.getTeacherSchedule()[2][5] = "OFFDAY";

		//
		//
		//

		teacherList.add(isilekim);
		teacherList.add(ozgegundogdu);
		teacherList.add(berkanozkan);
		teacherList.add(seymadogru);

		// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		teacherList2.addAll(teacherList);
		qoqo();

		int counter = 0;
		do {
			if (A_Term2.control == false || AR_Term2.control == false
					|| B.control == false || BR.control == false
					|| C.control == false || CR.control == false) {

				for (Teacher teacher : teacherList) {
					for (int j = 0; j < 6; j++) {
						for (int k = 0; k < 5; k++) {
							if (teacher.getTeacherSchedule()[k][j] != null
									|| !(teacher.getTeacherSchedule()[k][j] == "OFFDAY")) {
								teacher.getTeacherSchedule()[k][j] = null;
							}
						}
					}

					teacher.setCourseHour(teacher.getCourseHourORG());
					teacher.setRestHour(0);
				}
				teacherList2.clear();
				teacherList2.addAll(teacherList);

				Classes.A_Term2_CLASS.clear();
				Classes.AR_Term2_CLASS.clear();
				Classes.B_CLASS.clear();
				Classes.BR_CLASS.clear();
				Classes.C_CLASS.clear();
				Classes.CR_CLASS.clear();
				A_Term2.control = true;
				AR_Term2.control = true;
				B.control = true;
				BR.control = true;
				C.control = true;
				CR.control = true;
				qoqo();

			}
			if (Classes.B_CLASS.size() != 0 && A_Term2.control
					&& AR_Term2.control) {
				System.out.println("1");
				B.addMCB(teacherList2);
				System.out.println("2");
				if (B.control)
					B.addRWB(teacherList2);
				System.out.println("3");
				if (B.control)
					B.addLSB(teacherList2);
				System.out.println("4");

			}

			if (counter == 40)
				break;
			else {
				counter++;

			}
		} while (A_Term2.control == false || AR_Term2.control == false
				|| B.control == false || BR.control == false
				|| C.control == false || CR.control == false);

	
		//
		// for (Teacher teacher : teacherList) {
		// System.out.println(teacher.getName());
		// for (int j = 0; j < 6; j++) {
		// for (int k = 0; k < 5; k++) {
		// System.out.printf("%20s",
		// teacher.teacherSchedule[k][j]);
		// }
		// System.out.println();
		// }
		// System.out.println("----------------------------------");
		// }
	
	}

	private static void qoqo() {

		// Classes.A_CLASS.add(new Classes.A());
		// Classes.A_CLASS.add(new Classes.A());

		// Classes.AR_Term2_CLASS.add(new Classes.AR_Term2());
		// Classes.AR_Term2_CLASS.add(new Classes.AR_Term2());
		//
		Classes.B_CLASS.add(new Classes.B());
		Classes.B_CLASS.add(new Classes.B());
		//
		// Classes.BR_CLASS.add(new Classes.BR());
		//
		// Classes.C_CLASS.add(new Classes.C());
		//
		// Classes.CR_CLASS.add(new Classes.CR());

	}

	static int a = 0;
	protected static ArrayList<Teacher> teacherList = new ArrayList<Teacher>();
	protected static ArrayList<Teacher> teacherList2 = new ArrayList<Teacher>();
}
