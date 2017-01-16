//
//  ResultViewController.h
//  iPhoneWeb
//
//  Created by Prince on 12/29/16.
//  Copyright © 2016 Prince. All rights reserved.
//

#import "ViewController.h"

@interface ResultViewController : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *arrayResult;

@end
