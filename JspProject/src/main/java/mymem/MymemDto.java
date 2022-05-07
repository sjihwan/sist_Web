package mymem;

import java.sql.Timestamp;

public class MymemDto {

	private String num;
	private String id;
	private String pass;
	private String name;
	private String hp;
	private String email;
	private Timestamp gaip;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getGaip() {
		return gaip;
	}
	public void setGaip(Timestamp gaip) {
		this.gaip = gaip;
	}

}
