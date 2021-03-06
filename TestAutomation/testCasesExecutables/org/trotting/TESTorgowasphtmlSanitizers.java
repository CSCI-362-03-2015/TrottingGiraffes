package org.trotting;

class TESTorgowasphtmlSanitizers{
	
	public static void main(String[] args){
		try{
			String theOracle = args[2];
			String theTest = args[1];
			String staticElement = args[0];

			theOracle = theOracle.replaceAll("\"", "\\\\\"");
			theOracle = theOracle.replaceAll("\\\\", "\\\\\\\\");
			theOracle = theOracle.replaceAll("<", "&lt;");
			theOracle = theOracle.replaceAll(">", "&gt;");

			theTest = theTest.replaceAll("\"", "\\\\\"");
			theTest = theTest.replaceAll("\\\\", "\\\\\\\\");
			theTest = theTest.replaceAll("<", "&lt;");
			theTest = theTest.replaceAll(">", "&gt;");


			if(staticElement.compareTo("FORMATTING") == 0){
				String result = org.owasp.html.Sanitizers.FORMATTING.sanitize(args[1]);
			
				if((result).compareTo(args[2]) == 0){
					try{

						result = result.replaceAll("\"", "\\\\\"");
						result = result.replaceAll("\\\\", "\\\\\\\\");
						result = result.replaceAll("<", "&lt;");
						result = result.replaceAll(">", "&gt;");

						System.out.println("org.owasp.html.Sanitizers");
						System.out.println("FORMATTING.sanitize(String)");
						System.out.println(theTest);
						System.out.println(result);
						System.out.println(theOracle);
						System.out.println("passed\n");
				
					}catch(Exception e){
						e.printStackTrace();	
					}

				}
				else{
					try{
						result = result.replaceAll("\"", "\\\\\"");
						result = result.replaceAll("\\\\", "\\\\\\\\");
						result = result.replaceAll("<", "&lt;");
						result = result.replaceAll(">", "&gt;");

						System.out.println("org.owasp.html.Sanitizers");
						System.out.println("FORMATTING.sanitize(String)");
						System.out.println(theTest);
						System.out.println(result);
						System.out.println(theOracle);
						System.out.println("failed\n");
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}
			if(staticElement.compareTo("BLOCKS") == 0){
				String result = org.owasp.html.Sanitizers.BLOCKS.sanitize(args[1]);
		
				if((result).compareTo(args[2]) == 0){
					try{
						result = result.replaceAll("\"", "\\\\\"");
						result = result.replaceAll("\\\\", "\\\\\\\\");
						result = result.replaceAll("<", "&lt;");
						result = result.replaceAll(">", "&gt;");

						System.out.println("org.owasp.html.Sanitizers");
						System.out.println("BLOCKS.sanitize(String)");
						System.out.println(theTest);
						System.out.println(result);
						System.out.println(theOracle);
						System.out.println("passed\n");
				
					}catch(Exception e){
						e.printStackTrace();	
					}

				}
				else{
					try{
						result = result.replaceAll("\"", "\\\\\"");
						result = result.replaceAll("\\\\", "\\\\\\\\");
						result = result.replaceAll("<", "&lt;");
						result = result.replaceAll(">", "&gt;");

						System.out.println("org.owasp.html.Sanitizers");
						System.out.println("BLOCKS.sanitize(String)");
						System.out.println(theTest);
						System.out.println(result);
						System.out.println(theOracle);
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
