/**
 * com.collinprice.rooted
 *
 * Created by Your Name
 * Copyright (c) 2015 Your Company. All rights reserved.
 */

#import "ComCollinpriceRootedModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

// http://stackoverflow.com/a/26712383/29299
BOOL isJailbroken()
{
#if !(TARGET_IPHONE_SIMULATOR)

	if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"] ||
			[[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"] ||
			[[NSFileManager defaultManager] fileExistsAtPath:@"/bin/bash"] ||
			[[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/sshd"] ||
			[[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt"] ||
			[[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"] ||
			[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]])  {
		return YES;
	}

	FILE *f = NULL ;
	if ((f = fopen("/bin/bash", "r")) ||
			(f = fopen("/Applications/Cydia.app", "r")) ||
			(f = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r")) ||
			(f = fopen("/usr/sbin/sshd", "r")) ||
			(f = fopen("/etc/apt", "r")))  {
		fclose(f);
		return YES;
	}
	fclose(f);

	NSError *error;
	NSString *stringToBeWritten = @"This is a test.";
	[stringToBeWritten writeToFile:@"/private/jailbreak.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
	[[NSFileManager defaultManager] removeItemAtPath:@"/private/jailbreak.txt" error:nil];
	if(error == nil)
	{
		return YES;
	}

#endif

	return NO;
}

@implementation ComCollinpriceRootedModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"8fc8c542-563d-43f5-a9f9-70d0aa7ef14e";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.collinprice.rooted";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded", self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma Public APIs

-(id)isRooted:(id)args
{
	NSLog(@"[INFO] %@ isRooted", self);
	return [NSNumber numberWithBool:isJailbroken()];
}

@end
