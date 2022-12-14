#' Rasterize spatial data using SF.  Accepts postgis, gdb and geopackage
#'
#' @param inlyr input data layer e.g. 'veg_comp_poly'
#' @param field field to be rasterized
#' @param outTifpath path of out TIF defualt D:/Projects/provDataProject
#' @param outTifname  name of out TIF
#' @param inSrc path pf gdb or geopackage
#' @param pgConnList Named list with the following pg connection parameters Driver,host,user,dbname,password,port,schema
#' @param vecExtent vector with extents in the following order  <xmin>,<ymax>,<ymin>,<xmax> default c(273287.5,1870587.5,367787.5,1735787.5)
#' @param nodata  no data value of out tif defualt is 0
#' @return output tif name
#' @export
#'
#' @examples coming soon
#'
#'

rasterizeSF <- function(
                        inlyr,
                        field,
                        outTifpath = 'D:\\Projects\\provDataProject',
                        outTifname,
                        inSrc = NULL,
                        pgConnList = NULL,
                        vecExtent = c(273287.5,1870587.5,367787.5,1735787.5),
                        nodata = 0,
                        where=NULL,
                        datatype='Int32L'){

  if(is.null(inSrc) && is.null(pgConnList)){stop("Must have one inSrc or pgConnList populated")}
  if(!is.null(inSrc) && !is.null(pgConnList)){stop("Must have only one inSrc or pgConnList populated")}
  if(!is.null(inSrc)){ src <- inSrc}
  if(!is.null(pgConnList)){
    dbname <- pgConnList["dbname"][[1]]
    user <- pgConnList["user"][[1]]
    src <- glue::glue("PG:dbname={single_quote(dbname)} user={single_quote(user)}")
  }
  dest <- file.path(outTifpath,outTifname)
  if(!is.null(where)){where <- where}else{
    where <- ''}
  print(where)
  #Rasterize input Vector
  sf::gdal_utils("rasterize",src,dest,options = c('-tr','100',' 100',
                     '-te',vecExtent[1],vecExtent[3],vecExtent[2],vecExtent[4],
                     '-ot', datatype,
                     '-l', inlyr,
                     '-a', field,
                     '-a_srs','EPSG:3005',
                     '-a_nodata', nodata,
                     '-co','COMPRESS=LZW',
                     '-where', where),
                 '-overwrite')
  return(dest)
}
