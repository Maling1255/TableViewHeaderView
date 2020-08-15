//
//  MGTableViewController.m
//  Tableview
//
//  Created by maling on 2020/6/17.
//  Copyright © 2020 maling . All rights reserved.
//

#import "MGTableViewController.h"
#import "MGTablviewHeaderView.h"

#define MGScreenWidth [UIScreen mainScreen].bounds.size.width
#define MGScreenHeight [UIScreen mainScreen].bounds.size.height

@interface MGTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) MGTablviewHeaderView *headerView;

@property (nonatomic, strong) UITableView *displayTableView;


@end

@implementation MGTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.displayTableView];
    
    _headerView = [[[NSBundle mainBundle] loadNibNamed:@"MGTablviewHeaderView" owner:nil options:nil] firstObject];
    
    
    self.displayTableView.tableHeaderView = _headerView;
    
   __block BOOL isSpread = NO;
    
    __weak typeof(self)WeakSelf = self;
    _headerView.tapBlock = ^{
      
        isSpread = !isSpread;
        
        if (isSpread) {

            [UIView animateWithDuration:0.25 animations:^{
                CGRect frame = WeakSelf.headerView.frame;
                frame.size.height = 300;
                WeakSelf.headerView.frame = frame;
                
                [WeakSelf.displayTableView beginUpdates];
                 [WeakSelf.displayTableView setTableHeaderView:WeakSelf.headerView];
                 [WeakSelf.displayTableView endUpdates];
                
            } completion:^(BOOL finished) {
//                [WeakSelf.displayTableView setTableHeaderView:WeakSelf.headerView];
            }];
            
            
        } else {

            [UIView animateWithDuration:0.25 animations:^{
                CGRect frame = WeakSelf.headerView.frame;
                frame.size.height = 100;
                WeakSelf.headerView.frame = frame;
                
                [WeakSelf.displayTableView beginUpdates];
                [WeakSelf.displayTableView setTableHeaderView:WeakSelf.headerView];
                [WeakSelf.displayTableView endUpdates];

            } completion:^(BOOL finished) {
//                [WeakSelf.displayTableView setTableHeaderView:WeakSelf.headerView];
            }];
            
            
            
        }
        
    };
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell_id"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-%ld", indexPath.section, indexPath.row];
    
    return cell;
    
}


- (UITableView *)displayTableView {
    if (!_displayTableView) {
        _displayTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MGScreenWidth, MGScreenHeight) style:UITableViewStyleGrouped];
        _displayTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _displayTableView.dataSource = self;
        _displayTableView.delegate = self;
        
    }
    return _displayTableView;
}


@end
