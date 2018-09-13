package model;
//网站信息
public class web {
	int web_id;
	String web_type;//模块
	String  web_title;
	String  write_time;//上传时间
	String web_picture;//上传图片的地址
	String web_character;//文字介绍
	
	public web(int web_id, String web_title, String write_time, String web_picture, String web_character) {
		this.web_id = web_id;
		this.web_title = web_title;
		this.write_time = write_time;
		this.web_picture = web_picture;
		this.web_character = web_character;
	}
	public int getWeb_id() {
		return web_id;
	}
	public void setWeb_id(int web_id) {
		this.web_id = web_id;
	}
	public String getWeb_type() {
		return web_type;
	}
	public void setWeb_type(String web_type) {
		this.web_type = web_type;
	}
	public String getWeb_title() {
		return web_title;
	}
	public void setWeb_title(String web_title) {
		this.web_title = web_title;
	}
	public String getWrite_time() {
		return write_time;
	}
	public void setWrite_time(String write_time) {
		this.write_time = write_time;
	}
	public String getWeb_picture() {
		return web_picture;
	}
	public void setWeb_picture(String web_picture) {
		this.web_picture = web_picture;
	}
	public String getWeb_character() {
		return web_character;
	}
	public void setWeb_character(String web_character) {
		this.web_character = web_character;
	}
	public web(String web_type, String web_title, String write_time, String web_picture, String web_character) {

		this.web_type = web_type;
		this.web_title = web_title;
		this.write_time = write_time;
		this.web_picture = web_picture;
		this.web_character = web_character;
	}
	public web() {
		
	}
	
	
	

}
