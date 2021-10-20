//
//  ViewController.m
//  GameDemo
//
//  Created by Elsner on 19/03/16.
//  Copyright © 2016 Elsner Technologies. All rights reserved.
//

#import "ScoreView.h"

@interface ScoreView (){
}

@end

@implementation ScoreView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Game";
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    // Do any additional setup after loading the view, typically from a nib.
    
    
  
    
    
    
    NSMutableArray *arr2=[[NSMutableArray alloc] init];
    arr2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"score"];
    
    
    if (arr2.count>0) {
        NSNumber * max = [arr2 valueForKeyPath:@"@max.intValue"];
        lblScore.text=[NSString stringWithFormat:@"%@",max];
        NSLog(@"%@", max); // 99
    }
    else{
        lblScore.text=[NSString stringWithFormat:@"%s","0"];

    }
    
    
    
    
}

-(IBAction)backClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:true];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
