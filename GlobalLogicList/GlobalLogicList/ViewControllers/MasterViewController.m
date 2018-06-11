//
//  MasterViewController.m
//  GlobalLogicList
//
//  Created by Nicolás Fernández Alarcón on 11-06-18.
//  Copyright © 2018 Nicolás Fernández Alarcón. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "InfoTableViewCell.h"
#import "CellInfo.h"
#import "UIImageView+AFNetworking.h"
#import "ServicesManager.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[[ServicesManager sharedInstance] getInfo:^(NSArray *response){
		self.objects = [NSMutableArray arrayWithArray:response];
		[self.tableView reloadData];
	} failure:^(NSError *error){
		//TODO: show alert view
	}];

	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}


- (void)viewWillAppear:(BOOL)animated {
	self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
	[super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
	    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		NSError *error;
		CellInfo *cellInfo = [MTLJSONAdapter modelOfClass:CellInfo.class fromJSONDictionary:self.objects[indexPath.row] error:&error];
	    DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
	    [controller setDetailItem:cellInfo];
	    controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
	    controller.navigationItem.leftItemsSupplementBackButton = YES;
	}
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	
	NSError *error;
	CellInfo *cellInfo = [MTLJSONAdapter modelOfClass:CellInfo.class fromJSONDictionary:self.objects[indexPath.row] error:&error];
	cell.cellTitleLabel.text = cellInfo.title;
	cell.cellDescriptionLabel.text = cellInfo.descriptionInfo;
	[cell.cellImage setImageWithURL:[NSURL URLWithString:cellInfo.image]];
	
	return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return NO;
}


@end
