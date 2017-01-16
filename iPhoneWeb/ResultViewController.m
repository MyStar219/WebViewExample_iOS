//
//  ResultViewController.m
//  iPhoneWeb
//
//  Created by Prince on 12/29/16.
//  Copyright © 2016 Prince. All rights reserved.
//

#import "ResultViewController.h"
#import "DetailViewController.h"

@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tblResult;

@end


@implementation ResultViewController
@synthesize arrayResult;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tblResult.delegate = self;
    _tblResult.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
 

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayResult count];
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"itemCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSDictionary *dict = [arrayResult objectAtIndex:indexPath.row];
    
    UIImageView *imgvItem = (UIImageView *)[cell.contentView viewWithTag:1];
    UILabel *lblPrice = (UILabel *)[cell.contentView viewWithTag:2];
    UILabel *lblAddress = (UILabel *)[cell.contentView viewWithTag:3];
    
    NSString *strImageURL = [dict objectForKey:@"img_url"];
    NSString *strPrice = [dict objectForKey:@"price_formatted"];
    NSString *strAddress = [dict objectForKey:@"title"];
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:strImageURL]];
    imgvItem.image = [UIImage imageWithData:imageData];
    
    //    [imgvItem setImage:[UIImage imageWithData:imageData]];
    
    [lblPrice setText:strPrice];
    [lblAddress setText:strAddress];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110.0f;
}





#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *viewCtrlDetail = (DetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"DetailViewCtrl"];
    
    viewCtrlDetail.dictItem = [arrayResult objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:viewCtrlDetail animated:YES];// next View Pushing to Navigation View Controller
    
    
    
}


@end
