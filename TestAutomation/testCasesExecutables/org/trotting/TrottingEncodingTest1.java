package org.trotting;

class TrottingEncodingTest1{
	
	public static void main(String[] args){
		try{
			String theOracle = args[1];
			String theTest = args[0];

			String result = org.owasp.html.Encoding.decodeHtml(theTest);
			if(theOracle.contains("\\n")){
				//System.out.println("Oracle contains: \\n");
				 theOracle = theOracle.replace("\\n","\n");
			}
	

			if((result).equals(theOracle)){
				try{
					java.io.PrintWriter writer = new java.io.PrintWriter("../reports/ResultTrottingEncodingTest.txt", "UTF-8");
					writer.println("TrottingTest passed.");
					writer.println("org.owasp.html.Encoding.decodeHtml(" + args[0] + ");");
					writer.println("Oracle: " + theOracle);
					writer.println("Result: " + result);
					writer.close();
				}catch(Exception e){
					e.printStackTrace();	
				}

				System.out.println("Test passed.");
			}
			else{
				try{
					java.io.PrintWriter writer = new java.io.PrintWriter("ResultTrottingEncodingTestDecodeHtml.txt","UTF-8");
					writer.println("TrottingTest failed.");
					writer.println("org.owasp.html.Encoding.decodeHtml(" + args[0] + ");");
					writer.println("Oracle: " + args[1]);
					writer.println("Result: " + result);
					writer.close();
					
				}catch(Exception e){
					e.printStackTrace();
				}
				System.out.println("Test failed.");
			}
		}catch(Exception e){
			System.out.println("Exception: Possibly incorrect number of arguments.");
			e.printStackTrace();
		}
	
	}	
}
