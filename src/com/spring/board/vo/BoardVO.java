package com.spring.board.vo;

public class BoardVO {
	private String kno;
	private String ksubject;
	private String kname;
	private String kimg;
	private String kpw;
	private String kmemo;
	private String kdeleteyn;
	private String kinsertdate;
	private String kupdatedate;
	
	public String getKno() {
		return kno;
	}
	public void setKno(String kno) {
		this.kno = kno;
	}
	public String getKsubject() {
		return ksubject;
	}
	public void setKsubject(String ksubject) {
		this.ksubject = ksubject;
	}
	public String getKname() {
		return kname;
	}
	public void setKname(String kname) {
		this.kname = kname;
	}
	public String getKimg() {
		return kimg;
	}
	public void setKimg(String kimg) {
		this.kimg = kimg;
	}
	public String getKpw() {
		return kpw;
	}
	public void setKpw(String kpw) {
		this.kpw = kpw;
	}
	public String getKmemo() {
		return kmemo;
	}
	public void setKmemo(String kmemo) {
		this.kmemo = kmemo;
	}
	public String getKdeleteyn() {
		return kdeleteyn;
	}
	public void setKdeleteyn(String kdeleteyn) {
		this.kdeleteyn = kdeleteyn;
	}
	public String getKinsertdate() {
		return kinsertdate;
	}
	public void setKinsertdate(String kinsertdate) {
		this.kinsertdate = kinsertdate;
	}
	public String getKupdatedate() {
		return kupdatedate;
	}
	public void setKupdatedate(String kupdatedate) {
		this.kupdatedate = kupdatedate;
	}
	@Override
	public String toString() {
		return "BoardVO [kno=" + kno + ", ksubject=" + ksubject + ", kname=" + kname + ", kimg=" + kimg + ", kpw=" + kpw
				+ ", kmemo=" + kmemo + ", kdeleteyn=" + kdeleteyn + ", kinsertdate=" + kinsertdate + ", kupdatedate="
				+ kupdatedate + "]";
	}
	
	
	
	
	
}
