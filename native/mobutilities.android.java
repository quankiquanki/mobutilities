import android.content.Intent;

class externalfunctions {
	
	static void launchStore(String type, String id) {
		String marketQuery = "";
		if(type.equals("publisher")) {
			marketQuery = "market://search?q=pub:"+id;
		} else if(type.equals("app")) {
			marketQuery = "market://details?id="+id;
		}
		android.net.Uri uriUrl = android.net.Uri.parse(marketQuery);
		android.content.Intent marketActivity = new android.content.Intent(android.content.Intent.ACTION_VIEW, uriUrl);
		BBAndroidGame.AndroidGame().GetActivity().startActivity(marketActivity);
	}
	
	static void launchShare(String subject, String message, String link) {
		try {
			Intent i = new Intent(Intent.ACTION_SEND);  
		  	i.setType("text/plain");
		  	i.putExtra(Intent.EXTRA_SUBJECT, subject);
		  	
		  	String text = message + "\n" + link;
		  	i.putExtra(Intent.EXTRA_TEXT, text);
		  	
		  	BBAndroidGame.AndroidGame().GetActivity().startActivity(Intent.createChooser(i, "Share Via"));
		} catch(Exception e) {}   	
	}
	
}
