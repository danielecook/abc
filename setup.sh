mkdir data
mkdir reference
mkdir blast_results
curl ftp://ftp.ncbi.nlm.nih.gov/genomes/Bacteria/all.fna.tar.gz > reference/all.fa.gz
curl ftp://ftp.ncbi.nih.gov/genomes/Bacteria/summary.txt > bacterial_genomes.txt

# Fix contig (genome) names and construct a blast database
gzcat reference/all.fa.gz | \
awk '$0 ~ ">" { gsub("^[^>]+","",$0); print $0  } $0 !~ ">" { print }' | \
makeblastdb -in - -dbtype=nucl -out=reference/all_bacteria -title=all_bacteria
