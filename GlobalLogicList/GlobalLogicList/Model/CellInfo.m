//
//  CellInfo.m
//  GlobalLogicList
//
//  Created by Nicolás Fernández Alarcón on 11-06-18.
//  Copyright © 2018 Nicolás Fernández Alarcón. All rights reserved.
//

#import "CellInfo.h"

@implementation CellInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			 @"title": @"title",
			 @"descriptionInfo": @"description",
			 @"image": @"image"
			 };
}

+ (NSValueTransformer *)imageJSONTransformer {
	return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
