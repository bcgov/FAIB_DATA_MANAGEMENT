% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/createOracleFDWpg.R
\name{createOracleFDWpg}
\alias{createOracleFDWpg}
\title{Create Oracle Foreign Data Wrapper Table in Postgres}
\usage{
createOracleFDWpg(intable, oraConnList, pgConnList, outServerName, outSchema)
}
\arguments{
\item{intable}{oracle table to import (e.g. WHSE_BASEMAPPING.FWA_ASSESSMENT_WATERSHEDS_POLY )}

\item{oraConnList}{named list of  oracle connection parameters (see get_ora_conn_list() function for more details)}

\item{pgConnList}{named list of  postgres connection parameters (see get_pg_conn_list() function for more details)}

\item{outServerName}{name of FDW Server that will be created}

\item{outSchema}{name of schema where foreign table will be outputted to}
}
\value{
string of output foreign table (schema.intable)
}
\description{
Create Oracle Foreign Data Wrapper Table in Postgres
}
\examples{
coming soon
}
