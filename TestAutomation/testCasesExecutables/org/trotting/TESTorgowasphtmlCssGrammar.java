package org.trotting;

class TESTorgowasphtmlCssGrammar{
	
	public static void main(String[] args){
		try{
			String theOracle = args[1];
			String theTest = args[0];

			String result = org.owasp.html.CssGrammar.cssContent(theTest);
			if(theOracle.contains("\\n")){
				//System.out.println("Oracle contains: \\n");
				 theOracle = theOracle.replace("\\n","\n");
			}
	

			if((result).compareTo(theOracle) == 0){
				try{

					System.out.println("org.owasp.html.CssGrammar");
					System.out.println("cssContent(String)");
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
					System.out.println("cssContent(String)");
					System.out.println(args[1]);
					System.out.println(args[0]);
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
