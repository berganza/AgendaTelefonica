//
//  AppDelegate.h
//  coreData
//
//  Created by LLBER on 29/08/12.
//  Copyright (c) 2012 LLBER. All rights reserved.
//

#import <UIKit/UIKit.h>

@class coreDataViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    coreDataViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) IBOutlet coreDataViewController *viewController;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
