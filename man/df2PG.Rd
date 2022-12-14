% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/df2PG.R
\name{df2PG}
\alias{df2PG}
\title{Write a PG Table from Dataframe}
\usage{
df2PG(pgTblName, inDF, connList, overwrite = T, append = F)
}
\arguments{
\item{pgTblName}{Name of output PG Table}

\item{inDF}{input dataframe}

\item{connList}{Named list with the following parameters Driver,host,user,dbname,password,port,schema}

\item{overwrite}{overwrite output T or F}

\item{append}{append output T or F}
}
\value{
no return
}
\description{
Write a PG Table from Dataframe
}
\examples{
df2PG('pgTableName',myDF,'postgres','myDB','mypassword',5432,'prod','T','F')
}
