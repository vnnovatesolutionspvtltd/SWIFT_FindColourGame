//
//  ViewController.m
//  GameDemo
//
//  Created by Elsner on 19/03/16.
//  Copyright © 2016 Elsner Technologies. All rights reserved.
//

#import "ViewController.h"
#import "ScoreView.h"


@interface ViewController (){
    NSMutableArray *arrCategory;
    NSMutableArray *arrAnimal;
    NSMutableArray *arrAnimal1;
    NSMutableArray *arrFruite;
    NSMutableArray *arrFruite1;
    NSMutableArray *arrbtn;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Game";
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    arrCategory=[[NSMutableArray alloc]initWithObjects:@"0",@"1", nil];
    
    
    if([self.strType isEqualToString:@"1"]){
        
        arrAnimal=[[NSMutableArray alloc]initWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png",@"11.png",@"12.png",@"13.png",@"14.png",@"15.png", nil];
        
//       arrAnimal1=[[NSMutableArray alloc]initWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"10.png",@"11.png",@"12.png",@"13.png",@"14.png",@"15.png", nil];
        
        
        arrFruite=[[NSMutableArray alloc]initWithObjects:@"16.png",@"17.png",@"18.png",@"19.png",@"20.png",@"21.png",@"22.png",@"23.png",@"24.png",@"25.png",@"26.png",@"27.png",@"28.png",@"29.png",@"30.png", nil];
        
//        arrFruite1=[[NSMutableArray alloc]initWithObjects:@"11.png",@"22.png",@"33.png",@"44.png",@"55.png",@"66.png",@"77.png",@"88.png",@"99.png",@"00.png",@"111.png",@"222.png",@"333.png",@"444.png",@"555.png", nil];
   
        
    }

    Count=0;
    CountWrong=0;
    CountRight=0;
//    btnReset.hidden=true;
    [self ChangeQuestion];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)ChangeQuestion
{
    arrbtn=[[NSMutableArray alloc]initWithObjects:btn1,btn2,btn3, nil];
    NSUInteger randomIndex = arc4random() % [arrCategory count];
    if(randomIndex==1){
        NSUInteger randomAnimal1 = arc4random() % [arrAnimal count];
        NSUInteger randomFruit1= arc4random() % [arrFruite count];
        
        for(int i = 0; i < 3; i++)
        {
            NSUInteger randombtn= arc4random() % [arrbtn count];
            UIButton *btn = [arrbtn objectAtIndex:randombtn];
            [arrbtn removeObjectAtIndex:randombtn];
            CGRect btnRect = btn.frame;
           
            [btn setFrame:btnRect];
            
            if (i==0) {
                [btn setBackgroundImage:[UIImage imageNamed:[arrAnimal objectAtIndex:randomAnimal1]] forState:UIControlStateNormal];
                 btn.tag=111;
                NSLog(@"%@",[arrAnimal objectAtIndex:randomAnimal1]);
                
            }
            else if (i==1){
                [btn setBackgroundImage:[UIImage imageNamed:[arrAnimal objectAtIndex:randomAnimal1]] forState:UIControlStateNormal];
                 btn.tag=222;
                NSLog(@"%@",[arrAnimal objectAtIndex:randomAnimal1]);

            }
            else {
                [btn setBackgroundImage:[UIImage imageNamed:[arrFruite objectAtIndex:randomFruit1]] forState:UIControlStateNormal];
                btn.tag=333;
                NSLog(@"%@",[arrFruite objectAtIndex:randomFruit1]);

                
            }
            
            [btn addTarget:self action:@selector(navigatePics:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    else{
        NSUInteger randomFruit1= arc4random() % [arrFruite count];
        NSUInteger randomAnimal1 = arc4random() % [arrAnimal count];
        
        for(int i = 0; i < 3; i++)
        {
            
            NSUInteger randombtn= arc4random() % [arrbtn count];
            UIButton *btn = [arrbtn objectAtIndex:randombtn];
            [arrbtn removeObjectAtIndex:randombtn];
            CGRect btnRect = btn.frame;
            [btn setFrame:btnRect];
            
            if (i==0) {
                [btn setBackgroundImage:[UIImage imageNamed:[arrFruite objectAtIndex:randomFruit1]] forState:UIControlStateNormal];
                 btn.tag=111;
                NSLog(@"%@",[arrFruite objectAtIndex:randomFruit1]);

                
            }
            else if (i==1){
                [btn setBackgroundImage:[UIImage imageNamed:[arrFruite objectAtIndex:randomFruit1]] forState:UIControlStateNormal];
                 btn.tag=222;
                NSLog(@"%@",[arrFruite objectAtIndex:randomFruit1]);

            }
            else {
                [btn setBackgroundImage:[UIImage imageNamed:[arrAnimal objectAtIndex:randomAnimal1]] forState:UIControlStateNormal];
                btn.tag=333;
                NSLog(@"%@",[arrAnimal objectAtIndex:randomAnimal1]);

            }
            
            [btn addTarget:self action:@selector(navigatePics:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}
-(void)navigatePics:(UIButton *)sender
{
    Count=Count+1;
    if (Count<=20) {
        if (sender.tag==333) {
            CountRight=CountRight+1;
            lblRightAns.text=[NSString stringWithFormat:@"True:%ld",(long)CountRight];
            lblTotal.text=[NSString stringWithFormat:@"Total:%ld",CountRight*10];
            [self ChangeQuestion];
        }
        else{
            CountWrong=CountWrong+1;
            lblWrongAns.text=[NSString stringWithFormat:@"False:%ld",(long)CountWrong];
            [self ChangeQuestion];
        }
    }
    else{
        NSLog(@"game over");
//        btnReset.hidden=false;
        NSString *str=[NSString stringWithFormat:@"Congratulations...Your score is :%ld",CountRight*10];
    
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Hit The Color"
                                                                       message:str
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  NSMutableArray *arr1=[[NSMutableArray alloc] init];
                                                                  NSMutableArray *arr2=[[NSMutableArray alloc] init];
                                                                  arr1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"score"];
                                                                  for (int i=0; i<arr1.count; i++) {
                                                                      [arr2 addObject:[arr1 objectAtIndex:i]];
                                                                  }
                                                                  
                                                                  if (arr2.count>0) {
                                                                      [arr2 addObject:[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%ld",CountRight*10]]];
                                                                      
                                                                      [[NSUserDefaults standardUserDefaults] setObject:arr2 forKey:@"score"];
                                                                      [[NSUserDefaults standardUserDefaults] synchronize];
                                                                      
                                                                  }
                                                                  else{
                                                                      NSMutableArray *arr=[[NSMutableArray alloc] init];
                                                                      [arr addObject:[NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%ld",CountRight*10]]];
                                                                      
                                                                      [[NSUserDefaults standardUserDefaults] setObject:arr forKey:@"score"];
                                                                      [[NSUserDefaults standardUserDefaults] synchronize];
                                                                  }
                                                                  
                                                                  [self reset:nil];
                                                                  
                                                              }];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
-(IBAction)reset:(UIButton *)sender{
    Count=0;
    CountWrong=0;
    CountRight=0;
    lblRightAns.text=[NSString stringWithFormat:@"Right:%ld",(long)CountRight];
    lblTotal.text=[NSString stringWithFormat:@"Total:%ld",CountRight*10];
    lblWrongAns.text=[NSString stringWithFormat:@"Wrong:%ld",(long)CountWrong];
}
-(IBAction)History:(UIButton *)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ScoreView *newView = [storyboard instantiateViewControllerWithIdentifier:@"ScoreView"];
    [self.navigationController pushViewController:newView animated:YES];
    
}
-(IBAction)backClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:true];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
