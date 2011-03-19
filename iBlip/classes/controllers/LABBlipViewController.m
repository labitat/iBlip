//
//  LABBlipViewController.m
//  iBlip
//
//  Created by Kasper Kronborg on 19/03/11.
//  Copyright 2011 Xstream Media Solutions. All rights reserved.
//

#import "LABBlipViewController.h"
#import "LABService.h"


@implementation LABBlipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)dealloc
{
    [blip release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    LABService *service = [[LABService alloc] init];
    [service fetchBlip:^(NSString *dataString) {
        NSLog(@"Data: %@", dataString);
        [blip setText:dataString];
    }];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [blip release];
    blip = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
