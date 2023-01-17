# metagenomic_benchmark
## Description
The aim of this repository is to compare long-reads metagenomic assemblers.

## Files
 - SraAccListFull.txt : contains the SRA accession numbers for the fasq files you wish to download, analyse and assemble
 - SraAccList.txt : Same as SraAccListFull, but contains only one accession number, for testing purposes
 - pipeline.sh : coordinates the other scripts
 - env_init.sh : sets up the correct genouest environnement
 - shotgun_sequences_downloader : downloads the fasq files whose accession number is in SraAccList.txt
 - quality_checker.sh : checks the reads quality using fastQC
 - metaflye_assembler : assemble reads using the flye --meta tool
 - metadata_fetcher : a tool that gets the sequencer used from an accession number
 - metaquast_caller.sh : calls metaquast, a tool to analyse the quality of the assembly



## Usage
Clone the repository in a genouest environnement, then modify the SraAccList.txt file to your liking and run pipeline.sh (if this is the first time you're running it, you need to follow the instruction in the comments of pipeline.sh before running it)