//
//  JAMViewVinos.h
//  TablasPower
//
//  Created by Juan Antonio Martin Noguera on 22/05/14.
//  Copyright (c) 2014 cloudonmobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vino.h"
#import "JAMCustomCell.h"
#import "OtraCustomCell.h"

@interface JAMViewVinos : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic)NSArray *modelo;
@property (strong, nonatomic)UITableView *tableView;

- (id)initWithStyle:(UITableViewStyle) style AndModel:(NSArray *)vinos;


@end
