pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

	idLen = length( id )
	aqBnd = data.frame( )
	for( i in 1:idLen ) {
		flnm = paste( directory , sprintf( "%03d.csv" , id[ i ] ) , sep = '/' )
		aq = read.csv( flnm )
	#	gd <- complete.cases( aq )
	#	aqg <- aq[ gd , ][ , ]
	#	aqBnd <- rbind( aqBnd , aqg )
		aqBnd <- rbind( aqBnd , aq )
	#	print( c ( flnm , nrow( aq ) , nrow( aqg ) , nrow( aqBnd ) ) )
	}
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
	if ( ! is.na( match( pollutant , c( 'sulfate' , 'nitrate' ) ) ) ) {
		mean( aqBnd[ , pollutant ] , na.rm = TRUE )
	} else {
		cat( 'error: unrecognized pollutant =' , pollutant )
	}

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
}
