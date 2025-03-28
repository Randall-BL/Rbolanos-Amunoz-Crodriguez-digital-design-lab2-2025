transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2/alu.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2/adder.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2/multiplier.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2/substractor.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2/partial_multiplier.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2/frequency_measurement.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta2/register.sv}

