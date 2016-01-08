#import <dlfcn.h>
#import <CoreFoundation/CoreFoundation.h>

#define isiOS8 (kCFCoreFoundationVersionNumber >= 1129.15 && kCFCoreFoundationVersionNumber < 1217.11)
#define isiOS7 (kCFCoreFoundationVersionNumber > 793.00 && kCFCoreFoundationVersionNumber < 1129.15)
#define isiOS9Up (kCFCoreFoundationVersionNumber >= 1217.11)


%ctor
{
	if (isiOS9Up)
		dlopen("/Library/Application Support/FlashColor/FlashColoriOS9.dylib", RTLD_LAZY);
	else if (isiOS8)
		dlopen("/Library/Application Support/FlashColor/FlashColoriOS9.dylib", RTLD_LAZY);
	else if (isiOS7)
		dlopen("/Library/Application Support/FlashColor/FlashColoriOS7.dylib", RTLD_LAZY);
}