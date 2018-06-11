//
//  DetailViewController.m
//  GlobalLogicList
//
//  Created by Nicolás Fernández Alarcón on 11-06-18.
//  Copyright © 2018 Nicolás Fernández Alarcón. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
	// Update the user interface for the detail item.
	if (self.detailItem) {
		[self.detailImage setImageWithURL:[NSURL URLWithString:self.detailItem.image]];
	    self.detailDescriptionLabel.text = [self.detailItem descriptionInfo];
		self.detailTitleLabel.text = [self.detailItem title];
	}
}


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(CellInfo *)newDetailItem {
	if (_detailItem != newDetailItem) {
	    _detailItem = newDetailItem;
	    
	    // Update the view.
	    [self configureView];
	}
}


@end
