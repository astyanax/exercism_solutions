component {

     function square( input ) {
   		if( input <= 0 || input > 64 ) {
			return -1
		}
        return 2 ^ (input - 1)
     }

      function total( input ) {
          return 2 ^ 64 - 1
      }
}

