import sys
import seaborn as sb
import pandas as pd


path_to_tsv = str(sys.argv[1])
plot_prefix = sys.argv[2]
############### FUNCTIONS ###############

############### MAIN ###############
# Import data
table = pd.read_csv(path_to_tsv, delim_whitespace=True)
#print(table.columns)

# Build GC/abundance plot

print("Building the GC / abundance plot...")
scatterplot = sb.scatterplot(x=table["gccontent"],y=table["meandepth"],size=table["endpos"])
scatterplot.set_xlabel("GC content")
scatterplot.set_ylabel("Mean depth")
scatterplot.legend(title="Contig size")
scatterplot.get_figure().savefig(plot_prefix+"_GC_abundance_scatterplot.png")
scatterplot.get_figure().clf()

# Build contigs size boxplot
print("Building the contigs size violinplot...")
violinplot = sb.violinplot(y=table["endpos"],inner="point",cut=0)
violinplot.set(yscale="log")
violinplot.set_ylabel("Contig size")
violinplot.get_figure().savefig(plot_prefix+"_contig_size_violinplot.png") 



# Build Mapped reads, unmapped_rterds, contigs, L50, N50, contigs and length plot depending on filter size
# Non functional, to do later ? (or to scrap)
"""
table = table.sort_values("endpos")
print(table)
i = 0 # Index of the current read
j = 0 # Index of the N50 read

cumulative_length = 0
cumulative_half_length = 0 # used to calculate N50 and L50

while(i < len(table)) :
    cumulative_length += table.iloc(i)["endpos"]
    while(cumulative_half_length < 0.5 * cumulative_length) :
        cumulative_half_length += table.iloc(j)["endpos"]
        j+=1
    i+=1

    print(i/j)
"""

print("Done")


