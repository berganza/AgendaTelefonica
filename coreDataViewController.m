//
//  coreDataViewController.m
//  coreData
//
//  Created by LLBER on 29/08/12.
//  Copyright (c) 2012 LLBER. All rights reserved.
//

#import "coreDataViewController.h"
#import "AppDelegate.h"

@interface coreDataViewController ()

@end

@implementation coreDataViewController

@synthesize nombre, direccion, telefono, estado;



-(void) saveData {
    
    AppDelegate *appDelegate =[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contactos" inManagedObjectContext:context];
    [newContact setValue:nombre.text forKey:@"nombre"];
    [newContact setValue:direccion.text forKey:@"direccion"];
    [newContact setValue:telefono.text forKey:@"telefono"];
    nombre.text = @"";
    direccion.text = @"";
    telefono.text = @"";
    NSError *error;
    [context save:&error];
    estado.text = @"Guardar Contactos";
    
    
}

-(void) findContact {
    
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Contactos" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(nombre = %@)", nombre.text];
    [request setPredicate:pred];
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if ([objects count] == 0) {
        estado.text = @"Sin coincidencias";
    } else {
        matches = [objects objectAtIndex:0];
        direccion.text = [matches valueForKey:@"direccion"];
        telefono.text = [matches valueForKey:@"telefono"];
        estado.text = [NSString stringWithFormat:
                       @"%d coincidencias", [objects count]];
    
    }
    
    
}






- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.nombre = nil;
    self.direccion = nil;
    self.telefono = nil;
    self.estado = nil;
    
    
    
    
}
 
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

