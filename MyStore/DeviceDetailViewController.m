//
//  DeviceDetailViewController.m
//  MyStore
//
//  Created by Mohini Sindhu  on 07/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "DeviceDetailViewController.h"



@interface DeviceDetailViewController ()

@end

@implementation DeviceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSManagedObjectContext *) managedObjectContext{
	
	
	NSManagedObjectContext *context=nil;
	AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	
	context = [delegate managedObjectContext];
	
	return context;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)saveButton:(id)sender {
	NSManagedObjectContext *context = [self managedObjectContext];
	
	// Create a new managed object
	NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
	[newDevice setValue:self.nameTextField.text forKey:@"name"];
	[newDevice setValue:self.versionTextField.text forKey:@"version"];
	[newDevice setValue:self.companyTextField.text forKey:@"company"];
	
	NSError *error = nil;
	// Save the object to persistent store
	if (![context save:&error]) {
		NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
	}
	
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelButton:(id)sender {
}
@end
