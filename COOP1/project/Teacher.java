package project;

import java.util.ArrayList;

public class Teacher {

	int getCourseHour() {
		return courseHour;
	}

	void setCourseHour(int courseHour) {
		this.courseHour = courseHour;
	}

	String getName() {
		return name;
	}

	void setName(String name) {
		this.name = name;
	}

	String[][] getTeacherSchedule() {
		return teacherSchedule;
	}

	void setTeacherSchedule(String[][] teacherSchedule) {
		this.teacherSchedule = teacherSchedule;
	}

	ArrayList<String> getCourseLevel() {
		return courseLevel;
	}

	ArrayList<String> getLessonType() {
		return lessonType;
	}

	int getRestHour() {
		return restHour;
	}

	void setRestHour(int restHour) {
		this.restHour = restHour;
	}

	void setCourseHourORG(int courseHourORG) {
		this.courseHourORG = courseHourORG;
	}

	void setCourseLevel(ArrayList<String> courseLevel) {
		this.courseLevel = courseLevel;
	}

	int getCourseHourORG() {
		return courseHourORG;
	}

	private int courseHour;
	private int courseHourORG;
	private String name;
	private int restHour;
	private ArrayList<String> lessonType = new ArrayList<String>();
	private ArrayList<String> courseLevel = new ArrayList<String>();
	private String[][] teacherSchedule = new String[5][6];

}
