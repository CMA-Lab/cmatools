% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FeA.R
\name{help_as_text}
\alias{help_as_text}
\title{Help Pages as Text}
\usage{
help_as_text(meth_or_pkg, pkg = NULL)
}
\arguments{
\item{meth_or_pkg}{The \emph{quoted} name of the method or package of interest.}

\item{pkg}{Name of the package to look into for documentation.}
}
\value{
A character vector containing the rows from the help page.
}
\description{
A function that extracts the text from the help pages of a R
package or function. Adapted from MrFlick's \code{help_text()}
function, originally posted on stackoverflow (13 Jul 2018; see
References section).
}
\examples{
# Print `seq()` help to console
help_as_text("seq") |> cat(sep = "\n")

# Get author's name:
hh <- help_as_text("lms")
gsub("\\\\s{2,}", "", hh[grep("^Author", hh) + 2])
}
\references{
\url{https://stackoverflow.com/questions/51330090/how-to-get-text-data-from-help-pages-in-r}
}
\author{
MrFlick, FeA.R
}
