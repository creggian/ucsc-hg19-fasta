# Build ucsc.hg19.fasta

The script downloads sequences of chromosomes 1-22, X and Y from UCSC [1] and combines them in order.

[1] ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes

## How to run

```
cd ucsc-hg19-fasta
./build.sh ucsc.hg19.fasta
```

Once the final FASTA file is produced, all intermediate files and directory are removed. Because the scripts creates temporary files, please run it in a freshly created directory (or ucsc-hg19-fasta).
