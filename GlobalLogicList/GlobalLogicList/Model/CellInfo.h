//
//  CellInfo.h
//  GlobalLogicList
//
//  Created by Nicolás Fernández Alarcón on 11-06-18.
//  Copyright © 2018 Nicolás Fernández Alarcón. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface CellInfo : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *descriptionInfo;
@property (nonatomic, copy, readonly) NSString *image;

@end
