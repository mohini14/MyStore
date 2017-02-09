//
//  DeviceDetailViewController.m
//  MyStore
//
//  Created by Mohini Sindhu  on 07/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "DeviceDetailViewController.h"
#import "DataManager.h"


@interface DeviceDetailViewController ()

@end

@implementation DeviceDetailViewController

@synthesize device;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSManagedObjectContext *) managedObjectContext{
	return [DataManager.getInstance managedObjectContext];
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
	
	if (self.device) {
		// Update existing device
		[self.device setValue:self.nameTextField.text forKey:@"name"];
		[self.device setValue:self.versionTextField.text forKey:@"version"];
		[self.device setValue:self.companyTextField.text forKey:@"company"];
		
	} else {
		// Create a new device
		NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
		[newDevice setValue:self.nameTextField.text forKey:@"name"];
		[newDevice setValue:self.versionTextField.text forKey:@"version"];
		[newDevice setValue:self.companyTextField.text forKey:@"company"];
	}
	
	NSError *error = nil;
	// Save the object to persistent store
	if (![context save:&error]) {
		NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
	}
	
	[self dismissViewControllerAnimated:YES completion:nil];
}


//- (IBAction)saveButton:(id)sender {
//	NSManagedObjectContext *context = [self managedObjectContext];
//	
//	// Create a new managed object
//	NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
//	[newDevice setValue:self.nameTextField.text forKey:@"name"];
//	[newDevice setValue:self.versionTextField.text forKey:@"version"];
//	[newDevice setValue:self.companyTextField.text forKey:@"company"];
//	
//	NSError *error = nil;
//	// Save the object to persistent store
//	if (![context save:&error]) {
//		NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
//	}
//	
//	[self dismissViewControllerAnimated:YES completion:nil];
//}
- (IBAction)cancelButton:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
