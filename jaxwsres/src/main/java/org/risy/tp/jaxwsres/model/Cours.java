package org.risy.tp.jaxwsres.model;


import java.io.Serializable;

import javax.xml.bind.annotation.*;
@XmlRootElement
public class Cours implements Serializable{
	private static final long serialVersionUID = 1L;
	private Long code;
	private String Nom_cours;
	private Integer Total_ins;
	private String temps;
	
	public Cours() {
		super();
	}
	public Cours(Long code, String nom_cours, Integer total_ins, String temps) {
		super();
		this.code = code;
		Nom_cours = nom_cours;
		this.Total_ins = total_ins;
		this.temps = temps;
	}
	public Long getCode() {
		return code;
	}
	public void setCode (Long code) {
		this.code = code;
	}
	public String getNom_cours() {
		return Nom_cours;
	}
	public void setNom_cours(String nom_cours) {
		Nom_cours = nom_cours;
	}
	public Integer getTotal_ins() {
		return Total_ins;
	}
	public void setTotal_ins(Integer total_ins) {
		Total_ins = total_ins;
	}
	 public String getTemps() {
	        return temps;
	    }

	    public void setTemps(String temps) {
	        this.temps = temps;
	    }
	    @Override
	    public String toString() {
	        return "Cours [code=" + code + ", nom=" + Nom_cours + ",Total Inscription" +Total_ins+"]";
	    }
	
	
	
}
