//
//  JAMViewVinos.m
//  TablasPower
//
//  Created by Juan Antonio Martin Noguera on 22/05/14.
//  Copyright (c) 2014 cloudonmobile. All rights reserved.
//

#import "JAMViewVinos.h"
#import "Vino.h"

#define kCustomPARCell @"CELDA_CUSTOM"
#define kCustomINPARCell @"OTRA_CELL"

@interface JAMViewVinos ()

@end

@implementation JAMViewVinos

#pragma mark - DataSource y Delegate del tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.modelo count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];

    
    int i = indexPath.row;
    Vino *currentVino = [self.modelo objectAtIndex:indexPath.row];

    if ((i%2) == 0 ) {
        JAMCustomCell *cell =  [tableView dequeueReusableCellWithIdentifier: kCustomPARCell forIndexPath:indexPath];
            cell.vineLabel.text  = currentVino.nombreVino;
            cell.yearVine.text = currentVino.cosecha;
//            cell.imageVine.image = currentVino.photo;
        return cell;

    } else {
        OtraCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:kCustomINPARCell forIndexPath:indexPath];
        cell.vineYearLabel.text = [NSString stringWithFormat:@"%@ - %@", currentVino.nombreVino, currentVino.cosecha];
        return cell;
    }
    
    
//    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


#pragma mark - Vistas
- (id)initWithStyle:(UITableViewStyle) style AndModel:(NSArray *)vinos{
    
    if (self = [super init]) {
        
        _modelo = vinos;
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:style];
        
    }
    
    return self;
}

- (void)pinTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    

    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"CELDA_CUSTOM"];
    [self.tableView registerClass:[OtraCustomCell class] forCellReuseIdentifier:@"OTRA_CELL"];
    
    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height);
    
    //separadores de las celdas
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor clearColor];
    
    self.tableView.backgroundColor = [UIColor orangeColor];
    
    
    
    [self.view addSubview:self.tableView];


}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Mis vinos";
    [self pinTableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
