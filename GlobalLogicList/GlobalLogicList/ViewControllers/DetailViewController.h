//
//  DetailViewController.h
//  GlobalLogicList
//
//  Created by Nicolás Fernández Alarcón on 11-06-18.
//  Copyright © 2018 Nicolás Fernández Alarcón. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellInfo.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) CellInfo *detailItem;

@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailDescriptionLabel;

@end

