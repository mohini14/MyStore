//
// Created by Anas MD on 2/9/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CoreData/CoreData.h>

@interface ManagedObjectContext : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;

+(ManagedObjectContext *)getInstance;

@end