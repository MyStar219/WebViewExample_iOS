//
//  DetailViewController.m
//  iPhoneWeb
//
//  Created by Prince on 12/29/16.
//  Copyright © 2016 Prince. All rights reserved.
//

#import "DetailViewController.h"
#import "ResultViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgvItem;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblDetail;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;

@end

@implementation DetailViewController

@synthesize dictItem;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void) viewDidAppear:(BOOL)animated {
    
    NSString *strImageURL = [dictItem objectForKey:@"img_url"];
    NSString *strPrice = [dictItem objectForKey:@"price_formatted"];
    NSString *strAddress = [dictItem objectForKey:@"title"];
    NSString *strDetail = [dictItem objectForKey:@"summary"];
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:strImageURL]];
    self.imgvItem.image = [UIImage imageWithData:imageData];
    
    //    [self.lblAddress setText:strAddress];//Or equal to
    self.lblAddress.text=strAddress;
    //    [self.lblPrice setText:strPrice];//Or equal to
    self.lblPrice.text=strPrice;
    //    [self.lblDetail setText:strDetail];// Or equal to
    self.lblDetail.text=strDetail;
    
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

@end
