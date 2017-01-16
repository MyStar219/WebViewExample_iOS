//
//  ViewController.m
//  iPhoneWeb
//
//  Created by Prince on 12/29/16.
//  Copyright © 2016 Prince. All rights reserved.
//

#import "ViewController.h"
#import "ResultViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel *lbLoading;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *idSplash;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButtonClick:(id)sender {
    NSString *string = @"http://api.nestoria.co.uk/api?country=uk&pretty=1&encoding=json&listing_type=buy&action=search_listings&page=1&place_name=london";
    NSURL *url = [NSURL URLWithString:string];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              // 4: Handle response here
                                              if(data != nil) {
                                                  NSError *errorJson=nil;
                                                  NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&errorJson];
                                                  
                                                  NSLog(@"%@", responseDict.description);
                                                  
                                                  
                                                  
                                                  dispatch_sync(dispatch_get_main_queue(), ^{
                                                      // code here
                                                      UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                      ResultViewController *viewCtrlResult = (ResultViewController *)[storyboard instantiateViewControllerWithIdentifier:@"resultViewControllerCtrl"];
                                                      
                                                      NSDictionary *dictOne = [responseDict objectForKey:@"response"];
                                                      viewCtrlResult.arrayResult = [dictOne objectForKey:@"listings"] ;
                                                      [self.navigationController pushViewController:viewCtrlResult animated:YES];
                                                  });
                                                  
                                                  [self.idSplash setHidden:YES];
                                                  
                                              }
                                              
                                          }];
    
    
    
    [downloadTask resume];

    
    self.lbLoading.text=@"Loadding....";
    [self.idSplash setHidden:NO];
    
}
@end
