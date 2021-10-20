
#import "HomeView.h"
#import "ViewController.h"

@interface HomeView (){
}
@end
@implementation HomeView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Game";
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    NSLog(@"Calll");

}

-(IBAction)SelectCategory:(UIButton *)sender{
    NSLog(@"Calll");
    if (sender.tag==1) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *mainview = [story instantiateViewControllerWithIdentifier:@"ViewController"];
        mainview.strType=@"1";
        [self.navigationController pushViewController:mainview animated:YES];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
