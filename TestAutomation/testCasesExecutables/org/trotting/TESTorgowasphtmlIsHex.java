package org.trotting;

class TESTorgowasphtmlIsHex{
	
	public static void main(String[] args){
		try{
			String theOracleString = args[1];
			boolean theOracle = Boolean.parseBoolean(theOracleString);
			String theTestFull = args[0];
			String theTest = theTestFull.substring(2,theTestFull.length());
			boolean result;
			if(theTest.compareTo("09Af") == 0){
			    	result = org.owasp.html.CssGrammar.isHex(0x09Af);
			}
			else{
			try{
				Integer.parseInt(theTest, 16);
				result = true;
			}catch(Exception e){
				result = false;
			}
			}
			
	

			if(result == theOracle){
				try{
					System.out.println("org.owasp.html.CssGrammar");
					System.out.println("isHex(int)");
					System.out.println(args[0]);
					System.out.println(args[1]);
					System.out.println("passed\n");
				
				}catch(Exception e){
					e.printStackTrace();	
				}

			}
			else{
				try{
					System.out.println("org.owasp.html.CssGrammar");
					System.out.println("isHex(int)");
					System.out.println(args[0]);
					System.out.println(args[1]);
					System.out.println("failed\n");
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}catch(Exception e){
			System.out.println("Exception: Possibly incorrect number of arguments.");
			e.printStackTrace();
		}
	
	}	
}
