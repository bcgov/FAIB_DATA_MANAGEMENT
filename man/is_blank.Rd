% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_blank.R
\name{is_blank}
\alias{is_blank}
\title{Find values that are blank}
\usage{
is_blank(x, false.triggers = FALSE)
}
\arguments{
\item{x}{A sql string}

\item{connList}{Named list with the following parameters Driver,host,user,dbname,password,port,schema}
}
\value{
Boolean True or False
}
\description{
Find values that are blank
}
\examples{
is_blank('')
}
