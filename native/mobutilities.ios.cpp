// App Rate Links for iOS6 and iOS7&8
static NSString *const iOS7AppStoreURLFormat = @"itms-apps://itunes.apple.com/app/id%d";
static NSString *const iOSAppStoreURLFormat = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d";
static NSString *const AppStorePublisherFormat = @"itms-apps://itunes.apple.com/artist%@";

class externalfunctions
{
	public:
	
	static void launchStore(String type, String id)
	{
		if(type == "publisher") {
			NSString *idString = id.ToNSString();	
			[[UIApplication sharedApplication] openURL: [NSURL URLWithString: [NSString stringWithFormat: AppStorePublisherFormat, idString]]];
				
		} else if(type == "app") {
			NSString *idString = id.ToNSString();
			int appID = [idString intValue];

			[[UIApplication sharedApplication] openURL: [NSURL URLWithString:[NSString stringWithFormat:([[UIDevice currentDevice].systemVersion floatValue] >= 7.0f)? iOS7AppStoreURLFormat: iOSAppStoreURLFormat, appID]]];
		}
	}
	
	static void launchShare(subject:String, message:String, link:String)
	{
		NSString *textToShare = [NSString stringWithFormat:@"%@", message.ToNSString()];     
        NSURL *myWebsite = [NSURL URLWithString:link.ToNSString()];
        // UIImage *image = [UIImage imageNamed:@"152"];

        //NSArray *objectsToShare = @[textToShare, myWebsite, image];
		NSArray *objectsToShare = @[textToShare, myWebsite];
        
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
		[activityViewController setValue:[NSString stringWithFormat:@"%@", subject.ToNSString()] forKey:@"subject"];
		
        [BBIosGame::IosGame()->GetUIAppDelegate()->viewController presentViewController:activityVC animated:YES completion:nil];
	}
};