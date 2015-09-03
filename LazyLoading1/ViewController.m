//
//  ViewController.m
//  LazyLoading1
//
//  Created by ok on 9/4/15.
//  Copyright (c) 2015 Choudhary. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *tableData;
}
@end

@implementation ViewController

#pragma mark - ViewLifeCycle
- (void)viewDidLoad {
    
    tableData = [[NSMutableArray alloc]init];
    
    //Adding Static Url to the Array
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    [tableData addObject:@"https://upload.wikimedia.org/wikipedia/commons/e/ed/Alcedo_atthis2.jpg"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - TableView_DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    //Got the ImageView From Cell ContentView
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:420];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    //Got the Indicator From Cell ContentView
    UIActivityIndicatorView *spinner = (UIActivityIndicatorView *)[cell viewWithTag:421];
    
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
        //Download Image
        NSData *image = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[tableData objectAtIndex:indexPath.row]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            //Show Downloaded Image
            imageView.image = [UIImage imageWithData:image];
             [spinner removeFromSuperview];
             [cell setNeedsLayout];
 
        });
    });
  
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
