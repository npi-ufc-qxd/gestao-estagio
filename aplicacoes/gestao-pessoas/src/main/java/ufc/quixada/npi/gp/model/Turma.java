package ufc.quixada.npi.gp.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import ufc.quixada.npi.gp.model.enums.StatusTurma;

@Entity
public class Turma {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String nome;
	
	@Column(nullable = false)
	@NotEmpty(message = "Informe o ano.")
	private String ano;

	@Column(nullable = false)
	@NotEmpty(message = "Informe o semestre.")
	private String semestre;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@NotNull(message = "Informe a data de inicio.")
	private Date inicio;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@NotNull(message = "Informe a data de termino.")
	private Date termino;

	@OneToMany(cascade = {CascadeType.REFRESH, CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name= "turma_id")
	List<Horario> horarios;

	@OneToOne//(fetch = FetchType.LAZY)
	private Pessoa supervisor;
	
	@Enumerated(EnumType.STRING)
	private StatusTurma statusTurma;

	public StatusTurma getStatusTurma() {
		return statusTurma;
	}

	public void setStatusTurma(StatusTurma statusTurma) {
		this.statusTurma = statusTurma;
	}

	public List<Horario> getHorarios() {
		return horarios;
	}

	public void setHorarios(List<Horario> horarios) {
		this.horarios = horarios;
	}

	@OneToMany(cascade = {CascadeType.REFRESH, CascadeType.MERGE, CascadeType.PERSIST})//, fetch = FetchType.LAZY)
	@JoinColumn(name= "turma_id")
	private List<Frequencia> frequencias;

	//fetch = FetchType.LAZY,
	@OneToMany(cascade = {CascadeType.REFRESH, CascadeType.MERGE, CascadeType.PERSIST})	@JoinColumn(name= "turma_id")
	private List<Estagiario> estagiarios;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Pessoa getSupervisor() {
		return supervisor;
	}

	public void setSupervisor(Pessoa supervisor) {
		this.supervisor = supervisor;
	}

	public List<Estagiario> getEstagiarios() {
		return estagiarios;
	}

	public void setEstagiarios(List<Estagiario> estagiarios) {
		this.estagiarios = estagiarios;
	}

	/**
	 * @return the frequencias
	 */
	public List<Frequencia> getFrequencias() {
		return frequencias;
	}

	/**
	 * @param frequencias the frequencias to set
	 */
	public void setFrequencias(List<Frequencia> frequencias) {
		this.frequencias = frequencias;
	}

	public String getAno() {
		return ano;
	}

	public void setAno(String ano) {
		this.ano = ano;
	}

	public String getSemestre() {
		return semestre;
	}

	public void setSemestre(String semestre) {
		this.semestre = semestre;
	}

	public Date getInicio() {
		return inicio;
	}

	public void setInicio(Date inicio) {
		this.inicio = inicio;
	}

	public Date getTermino() {
		return termino;
	}

	public void setTermino(Date termino) {
		this.termino = termino;
	}
}
