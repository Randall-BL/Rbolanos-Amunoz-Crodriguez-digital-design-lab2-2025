transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1/alu.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1/adder.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1/multiplier.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1/substractor.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1/top.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1/bin_to_7seg.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1/operation_selector.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1/partial_multiplier.sv}

vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1 {C:/Users/YITAN/OneDrive/Escritorio/PruebaTaller2/Rbolanos-Amunoz-Crodriguez-digital-design-lab2-2025/Pregunta1/alu_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
