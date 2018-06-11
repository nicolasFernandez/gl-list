//
//  ServicesManager.h
//  GlobalLogicList
//
//  Created by Nicolás Fernández Alarcón on 11-06-18.
//  Copyright © 2018 Nicolás Fernández Alarcón. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServicesManager : NSObject

+ (instancetype) sharedInstance;

- (void)getInfo:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure;

@end
