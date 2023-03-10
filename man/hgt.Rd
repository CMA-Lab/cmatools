% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FeA.R
\name{hgt}
\alias{hgt}
\title{Hypergeometric Test}
\usage{
hgt(k, n, K, N = 20000)
}
\arguments{
\item{k}{Number of hits in the experimental set.  --OR--> Intersection}

\item{n}{Size of the experimental set.            --OR--> Set A}

\item{K}{Number of possible hits in the universe. --OR--> Set B}

\item{N}{Size of the universe.                    --OR--> Background}
}
\value{
A 1-by-5 data frame containing enrichment statistics. Many
single-row data frames can be easily stacked using \code{rbind()}.
}
\description{
A wrapper for the Hypergeometric test function. Beside
\emph{p}-values, \code{hgt()} also computes and returns other enrichment
statistics like the expected value and fold enrichment.
}
\details{
The default value for the size of the universe (or background) set
is \code{N=2e4}, very close to the current estimate of the number of
human protein-coding genes, as annotated in \code{org.Hs.eg.db} (see
example below).
}
\examples{
# Annotation packages
library(AnnotationDbi)
library(org.Hs.eg.db) # Human

# Make a genome-wide data frame that associates the gene-type to each Entrez
# ID, then count only the "protein-coding" entries
x <- select(org.Hs.eg.db,
            keys = keys(org.Hs.eg.db),
            columns = c("ENTREZID", "GENETYPE"),
            keytype = "ENTREZID")
N <- sum(x$GENETYPE == "protein-coding") # 20,598 - EGSOURCEDATE: 2022-Sep12

# Matrix MetalloPeptidases (MMPs) in a DEG list
k <- sum(na.omit(DEGs_expr$Category) == "Metallopeptidase")

# Number of DEGs
n <- dim(DEGs_expr)[1]

# Total number of MMPs in Humans
K <- 24 # source https://en.wikipedia.org/wiki/Matrix_metalloproteinase

# Hypergeometric Test with the `N=2e4` conventional background
hgt(k, n, K)

# Hypergeometric Test with the actual background for human
hgt(k, n, K, N)
}
\author{
FeA.R
}
