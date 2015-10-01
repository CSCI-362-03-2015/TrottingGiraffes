package org.trotting;

class TrottingEncodingTest{
	
	public static void main(String[] args){
		String result = org.owasp.html.Encoding.decodeHtml("&#x000a;");
		if(result.equals("\n")){
			try{
			java.io.PrintWriter writer = new java.io.PrintWriter("ResultTrottingEncodingTest.txt", "UTF-8");
			writer.println("TrottingEncodingTest passed");
			writer.close();
			}catch(Exception e){
				
			}
			System.out.println("Test passed");
		}
		
	}
}