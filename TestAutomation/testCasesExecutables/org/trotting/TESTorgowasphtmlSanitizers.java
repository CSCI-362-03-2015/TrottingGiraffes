package org.trotting;

class TESTorgowasphtmlSanitizers{
	
	public static void main(String[] args){
		try{
			String theOracle = args[2];
			String theTest = args[1];
			String staticElement = args[0];

			if(staticElement.compareTo("FORMATTING") == 0){
				String result = org.owasp.html.Sanitizers.FORMATTING.sanitize(theTest);
				if(theOracle.contains("\\n")){
					//System.out.println("Oracle contains: \\n");
					 theOracle = theOracle.replace("\\n","\n");
				}
	

				if((result).compareTo(theOracle) == 0){
					try{

						System.out.println("org.owasp.html.Sanitizers");
						System.out.println("FORMATTING.sanitize(String)");
						System.out.println(args[1]);
						System.out.println(args[2]);
						System.out.println("passed\n");
				
					}catch(Exception e){
						e.printStackTrace();	
					}

				}
				else{
					try{
						System.out.println("org.owasp.html.Sanitizers");
						System.out.println("FORMATTING.sanitize(String)");
						System.out.println(args[1]);
						System.out.println(args[2]);
						System.out.println("failed\n");
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}
			if(staticElement.compareTo("BLOCKS") == 0){
				String result = org.owasp.html.Sanitizers.BLOCKS.sanitize(theTest);
				if(theOracle.contains("\\n")){
					//System.out.println("Oracle contains: \\n");
					 theOracle = theOracle.replace("\\n","\n");
				}
	

				if((result).compareTo(theOracle) == 0){
					try{

						System.out.println("org.owasp.html.Sanitizers");
						System.out.println("BLOCKS.sanitize(String)");
						System.out.println(args[1]);
						System.out.println(args[2]);
						System.out.println("passed\n");
				
					}catch(Exception e){
						e.printStackTrace();	
					}

				}
				else{
					try{
						System.out.println("org.owasp.html.Sanitizers");
						System.out.println("BLOCKS.sanitize(String)");
						System.out.println(args[1]);
						System.out.println(args[2]);
						System.out.println("failed\n");
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}
		}catch(Exception e){
			System.out.println("Exception: Possibly incorrect number of arguments.");
			e.printStackTrace();
		}
	
	}	
}
