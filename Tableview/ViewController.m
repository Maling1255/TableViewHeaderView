//
//  ViewController.m
//  Tableview
//
//  Created by maling on 2020/6/17.
//  Copyright © 2020 maling . All rights reserved.
//

#import "ViewController.h"
#import "MGTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)clickBtn:(id)sender {
    
    MGTableViewController *VC = [[MGTableViewController alloc] init];
    
    [self.navigationController pushViewController:VC animated:YES];
    
}

@end
