Strict

Import mojo
Import mobutilities

Function Main:Int()
	New Demo()
	Return 0
End

Class Demo Extends App

	Field xTouch:Int
	Field yTouch:Int
	
	Const PUBLISHER:String = "publisher"
	Const APP:String = "app"

	Method OnCreate:Int()
		Return 0
	End
	
	Method OnUpdate:Int()
		If(TouchHit(0) > 0)
			Self.xTouch = TouchX()
			Self.yTouch = TouchY()
			
			' Launches the More Apps function
			If(Self.yTouch < DeviceHeight()/3)
				#If(TARGET = "android")
					LaunchStore(PUBLISHER, "Shockblast") ' Android Publisher Name
				#Else If(TARGET = "ios")
					LaunchStore(PUBLISHER, "/quang-nguyen/id881913705") ' iOS Developer ID
				#End
				
			' Launches the Details page for an app (can be used for rating)
			Else If(Self.yTouch < (DeviceHeight()/3)*2)
				#If(TARGET = "android")
					LaunchStore(APP, "com.shockblastapps.thecolorgame") ' Android Packagename
				#Else If(TARGET = "ios")
					LaunchStore(APP, "925986193") ' iOS App ID		
				#End
			
			' Launches the Android/iOS Sharing function
			Else
				#If(TARGET = "android")
					LaunchShare("The Color Game", "Let's play this game on Android", "https://itunes.apple.com/app/color-game-pick-different/id925986193")
				#Else If(TARGET = "ios")
					LaunchShare("The Color Game", "Let's play this game on iOS", "https://itunes.apple.com/app/color-game-pick-different/id925986193")
				#End
			End		
		End
		
		Return 0
	End
	
	Method OnRender:Int()
		DrawText("More Apps", DeviceWidth()/2, DeviceHeight()/6, 0.5, 0.5)
		DrawText("Rate this App", DeviceWidth()/2, (DeviceHeight()/6)*3, 0.5, 0.5)		
		DrawText("Share App/Link", DeviceWidth()/2, (DeviceHeight()/6)*5, 0.5, 0.5)
		
		DrawLine(0, DeviceHeight()/3, DeviceWidth(), DeviceHeight()/3)
		DrawLine(0, (DeviceHeight()/3)*2, DeviceWidth(), (DeviceHeight()/3)*2)	
		
		Return 0
	End
	
End



