//
//  ServicesManager.m
//  GlobalLogicList
//
//  Created by Nicolás Fernández Alarcón on 11-06-18.
//  Copyright © 2018 Nicolás Fernández Alarcón. All rights reserved.
//

#import "ServicesManager.h"
#import <AFNetworking.h>

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

- (void)getInfo:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure {
	NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
	AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
	
	NSURL *URL = [NSURL URLWithString:@"http://private-f0eea-mobilegllatam.apiary-mock.com/list"];
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];
	
	NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
		if (error) {
			NSLog(@"Error: %@", error);
			failure(error);
		} else {
			NSLog(@"%@ %@", response, responseObject);
			success(responseObject);
		}
	}];
	[dataTask resume];
}

@end
