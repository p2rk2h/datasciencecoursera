complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

	idLen = length( id )
	aqCmp = data.frame( id = NA , nobs = NA )
	for( i in 1:idLen ) {
		flnm = paste( directory , sprintf( "%03d.csv" , id[ i ] ) , sep = '/' )
		aq = read.csv( flnm )
		gd <- complete.cases( aq )
		aqg <- aq[ gd , ][ , ]
		cmp <- c( id[ i ] , nrow( aqg ) )
		if ( i == 1 ) {
			aqCmp[ 1 , ]  = cmp
		} else {
			aqCmp <- rbind( aqCmp , cmp )
		}
	#	print( cmp )
	}
	aqCmp

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
}
