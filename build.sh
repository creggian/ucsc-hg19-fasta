#!/bin/bash -ex
# Run bash with -e exit on first error, -x add +command stream to sterr.
# Remove -x for cleaner usage message

# Check command line and provide usage and version information
if [ $# -ne 1 ]; then 
	echo "usage v1: build.sh output"
	echo "Makes temp files so should be run in a freshly created directory."
	exit -1;
fi

# Label parameters
OUTPUT=$1	# OUTPUT: location of the final FASTA file. Relative or absolute path.

# Store the directory from which the script is run
CURRENT_WDIR=`pwd`

# Create a temporary directory to download UCSC data
mkdir temp_download_ucsc_hg19_fasta
cd temp_download_ucsc_hg19_fasta

wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr1.fa.gz' -O chr1.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr2.fa.gz' -O chr2.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr3.fa.gz' -O chr3.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr4.fa.gz' -O chr4.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr5.fa.gz' -O chr5.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr6.fa.gz' -O chr6.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr7.fa.gz' -O chr7.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr8.fa.gz' -O chr8.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr9.fa.gz' -O chr9.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr10.fa.gz' -O chr10.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr11.fa.gz' -O chr11.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr12.fa.gz' -O chr12.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr13.fa.gz' -O chr13.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr14.fa.gz' -O chr14.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr15.fa.gz' -O chr15.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr16.fa.gz' -O chr16.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr17.fa.gz' -O chr17.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr18.fa.gz' -O chr18.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr19.fa.gz' -O chr19.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr20.fa.gz' -O chr20.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr21.fa.gz' -O chr21.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr22.fa.gz' -O chr22.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chrX.fa.gz' -O chrX.fa.gz
wget --timestamping 'ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chrY.fa.gz' -O chrY.fa.gz

gunzip chr*.fa.gz
cat chr1.fa chr2.fa chr3.fa chr4.fa chr5.fa \
	chr6.fa chr7.fa chr8.fa chr9.fa chr10.fa \
	chr11.fa chr12.fa chr13.fa chr14.fa chr15.fa \
	chr16.fa chr17.fa chr18.fa chr19.fa chr20.fa \
	chr21.fa chr22.fa chrX.fa chrY.fa > ucsc.hg19.fasta

# Move the final FASTA to the desired location
cd ${CURRENT_WDIR}
mv temp_download_ucsc_hg19_fasta/ucsc.hg19.fasta ${OUTPUT}

# Clean up temporary directory
rm -r temp_download_ucsc_hg19_fasta
