//
//  ServicesManager.m
//  GlobalLogicList
//
//  Created by Nicolás Fernández Alarcón on 11-06-18.
//  Copyright © 2018 Nicolás Fernández Alarcón. All rights reserved.
//

#import "ServicesManager.h"

@implementation ServicesManager

static ServicesManager *sharedInstance;

+ (instancetype)sharedInstance {
	
	@synchronized(self)
	{
		if (!sharedInstance) {
			sharedInstance = [[self alloc] init];
		}

		return sharedInstance;
	}
}

@end
