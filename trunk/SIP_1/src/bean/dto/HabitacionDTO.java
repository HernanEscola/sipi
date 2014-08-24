package bean.dto;

import java.util.List;

public class HabitacionDTO {
	public int numeroHabitacion;
	public String descripcion;
	public String regimen;
	public int capacidad;
	public boolean activa;
	public List<DisponibilidadDTO> disponibilidad;
	public TarifaDTO tarifa;
}
