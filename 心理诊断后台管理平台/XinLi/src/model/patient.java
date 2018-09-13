package model;

public class patient {
   int patient_id;
   String  patient_sex;
   String patient_name;
   String patient_home;
   String patient_believe;
   String patient_phone;
   String patient_born;
   String patient_age;
   String patient_education;
   String patient_bornAddress;
   String patient_address;
  
   
public patient() {
	
}
public patient(String patient_sex, String patient_name, String patient_home, String patient_believe,
		String patient_phone, String patient_born, String patient_age, String patient_education,
		String patient_bornAddress, String patient_address) {
	this.patient_sex = patient_sex;
	this.patient_name = patient_name;
	this.patient_home = patient_home;
	this.patient_believe = patient_believe;
	this.patient_phone = patient_phone;
	this.patient_born = patient_born;
	this.patient_age = patient_age;
	this.patient_education = patient_education;
	this.patient_bornAddress = patient_bornAddress;
	this.patient_address = patient_address;
}
public patient(int patient_id,String patient_sex, String patient_name, String patient_home, String patient_believe,
		String patient_phone,String patient_age, String patient_education) {
	this.patient_id=patient_id;
	this.patient_sex = patient_sex;
	this.patient_name = patient_name;
	this.patient_home = patient_home;
	this.patient_believe = patient_believe;
	this.patient_phone = patient_phone;
	this.patient_age = patient_age;
	this.patient_education = patient_education;
}
public String getPatient_bornAddress() {
	return patient_bornAddress;
}
public void setPatient_bornAddress(String patient_bornAddress) {
	this.patient_bornAddress = patient_bornAddress;
}
public String getPatient_address() {
	return patient_address;
}
public void setPatient_address(String patient_address) {
	this.patient_address = patient_address;
}
public String getPatient_education() {
	return patient_education;
}
public void setPatient_education(String patient_education) {
	this.patient_education = patient_education;
}
public String getPatient_name() {
	return patient_name;
}
public void setPatient_name(String patient_name) {
	this.patient_name = patient_name;
}
public int getPatient_id() {
	return patient_id;
}
public void setPatient_id(int patient_id) {
	this.patient_id = patient_id;
}
public String getPatient_sex() {
	return patient_sex;
}
public void setPatient_sex(String patient_sex) {
	this.patient_sex = patient_sex;
}
public String getPatient_home() {
	return patient_home;
}
public void setPatient_home(String patient_home) {
	this.patient_home = patient_home;
}
public String getPatient_believe() {
	return patient_believe;
}
public void setPatient_believe(String patient_believe) {
	this.patient_believe = patient_believe;
}
public String getPatient_phone() {
	return patient_phone;
}
public void setPatient_phone(String patient_phone) {
	this.patient_phone = patient_phone;
}
public String getPatient_born() {
	return patient_born;
}
public void setPatient_born(String patient_born) {
	this.patient_born = patient_born;
}
public String getPatient_age() {
	return patient_age;
}
public void setPatient_age(String patient_age) {
	this.patient_age = patient_age;
}
   
   
}
