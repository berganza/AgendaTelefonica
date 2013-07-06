//
//  coreDataViewController.h
//  coreData
//
//  Created by LLBER on 29/08/12.
//  Copyright (c) 2012 LLBER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface coreDataViewController : UIViewController {
    
    UITextField * nombre;
    UITextField * direccion;
    UITextField * telefono;
    UILabel * estado;
    
}

@property (strong, nonatomic) IBOutlet UITextField * nombre;
@property (strong, nonatomic) IBOutlet UITextField * direccion;
@property (strong, nonatomic) IBOutlet UITextField * telefono;
@property (strong, nonatomic) IBOutlet UILabel * estado;

-(IBAction)saveData;
-(IBAction)findContact;








@end











