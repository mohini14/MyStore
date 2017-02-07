//
//  DeviceDetailViewController.h
//  MyStore
//
//  Created by Mohini Sindhu  on 07/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *versionTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
- (IBAction)cancelButton:(id)sender;

- (IBAction)saveButton:(id)sender;
@end
