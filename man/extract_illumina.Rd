\name{extract_illumina}
\alias{extract_illumina}
\title{Extract metadata from a collection of Illumina generated FASTQ files}
\usage{
extract_illumina(paths)
}
\arguments{
\item{paths}{character vector of filenames.}
}
\description{
Wrapper for extracting metadata from Illumina generated FASTQ files.
}
\details{
Below is Information from the Illumina CASAVA_v1.8.0 user guide relevant to your data.

File Naming

Illumina FASTQ files use the following naming scheme:

<sample name>_<barcode sequence>_L<lane (0-padded to 3 digits)>_R<read number>_<set number (0-padded to 3 digits)>.fastq.gz

For example, the following is a valid FASTQ file name:

 NA10831_ATCACG_L002_R1_001.fastq.gz

In the case of non-multiplexed runs or lanes, <barcode sequence> will be replaced with "NoIndex".

Set Size

The FASTQ files are divided in files with the file size set by the --fastq-cluster-count command line option of configureBclToFastq.pl.The different files are distinguished by the 0-padded 3-digit set number. Default is 4 million reads per file. CASAVA/Eland is limited to aligning 10-12 million reads per instance.
}
