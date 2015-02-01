corr <- function( directory , threshold = 0 ) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
	crs <- sapply( list.files( directory ) , function( flnm ) {
		data <- read.csv( file.path( directory , flnm ) )
		nob <- sum( complete.cases( data ) )
		if ( threshold < nob ) {
			return( cor( data$nitrate , data$sulfate , use = 'complete.obs' ) )
		} } )	# get all correlations + NULLs
	return( unlist( crs[ ! sapply( crs , is.null ) ] ) )	# return result after removing NULLs and converting from 'list' to 'numeric'
}
