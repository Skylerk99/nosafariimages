
NSDictionary *pref = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.skylerk99.nosafariimages.plist"];

%hook WebPreferences
-(BOOL) loadsImagesAutomatically {
				if([[pref objectForKey:@"load"] boolValue])
		{
		return NO;
		}
		else
		{
		return %orig;
		}
}

- (unsigned long)_maximumImageSize {
		if( [[pref objectForKey:@"loadSize"] boolValue] )
		{
		return [[pref objectForKey:@"number"] integerValue];
		}
		else
		{
			return %orig;
	}

}
%end	

