#If TARGET="android"
	Import "native/mobutilities.android.java"
#Else If TARGET="ios"
	Import "native/mobutilities.ios.cpp"
#End

' If not iOS or Android, create empty functions
#If(TARGET <> "ios" And TARGET <> "android")
	Function LaunchStore:Void(type:String, id:String)
	End
	Function LaunchShare:Void(subject:String, message:String, link:String)
	End
#End

Extern

#If(TARGET = "android")
	Function LaunchStore:Void(type:String, id:String) = "externalfunctions.launchStore"
	Function ShareButton:Void(subject:String, message:String, link:String) = "externalfunctions.launchShare"
#Else If(TARGET = "ios")
	Function LaunchStore:Void(type:String, id:String) = "externalfunctions::launchStore"	
	Function ShareButton:Void(subject:String, message:String, link:String) = "externalfunctions::launchShare"		
#End