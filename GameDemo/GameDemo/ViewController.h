//
//  ViewController.h
//  GameDemo
//
//  Created by Elsner on 19/03/16.
//  Copyright © 2016 Elsner Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIButton *btn1;
    IBOutlet UIButton *btn2;
    IBOutlet UIButton *btn3;
    IBOutlet UILabel *lblWrongAns;
    IBOutlet UILabel *lblRightAns;
    IBOutlet UILabel *lblTotal;
    
    IBOutlet UIButton *btnReset;
    IBOutlet UIButton *btnhistory;
    IBOutlet UIButton *btnBack;
    
    NSInteger Count;
    NSInteger CountRight;
    NSInteger CountWrong;
    
}
@property(strong)NSString *strType;
-(IBAction)reset:(UIButton *)sender;
@end

