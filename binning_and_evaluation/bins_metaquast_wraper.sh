#!/bin/sh
bins_directory="$1"
bins=("$bins_directory"/*)
output_directory="$2"
reference_genomes="${@:3}"

#bins_directory="outputs/test-pacbio-clr/metaflye/bins"
#bins=("$bins_directory"/*.fa)
#output_directory="outputs/test-pacbio-clr/metaflye/bins_metaquast_results"
#reference_genomes="../Hi-Fi/data/input_reference_genomes/Bmock/PsyspLV10R5206_2.fasta ../Hi-Fi/data/input_reference_genomes/Bmock/ThispES032_2.fasta ../Hi-Fi/data/input_reference_genomes/Bmock/Micsis_2.fasta ../Hi-Fi/data/input_reference_genomes/Bmock/CohspES047_2.fasta ../Hi-Fi/data/input_reference_genomes/Bmock/MurspES050.fasta ../Hi-Fi/data/input_reference_genomes/Bmock/MarspLV10R5108_2.fasta ../Hi-Fi/data/input_reference_genomes/Bmock/Micaca_2.fasta ../Hi-Fi/data/input_reference_genomes/Bmock/Micsca_2.fasta ../Hi-Fi/data/input_reference_genomes/Bmock/Halomonassp_3.fasta ../Hi-Fi/data/input_reference_genomes/Bmock/MarspLV10MA5101_2.fasta ../Hi-Fi/data/input_reference_genomes/Bmock/ProbacES041_2.fasta ../Hi-Fi/data/input_reference_genomes/Bmock/HalomonasspHL93.fasta"


mkdir -p "$output_directory"

metaquast "${bins[@]}" -r $( echo "$reference_genomes" | tr ' ' , ) -o "$output_directory"
