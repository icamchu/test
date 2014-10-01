//
//  ViewController.m
//  loginpage
//
//  Created by Cam on 14-9-10.
//  Copyright (c) 2014年 Cam. All rights reserved.
//
#import <MobileCoreServices/MobileCoreServices.h>
#import "ViewController.h"
#import "HomeViewController.h"


//#define DBNAME    @"personinfo.sqlite"
//#define NAME      @"name"
//#define AGE       @"age"
//#define ADDRESS   @"address"
//#define TABLENAME @"PERSONINFO"

#define DBNAME    @"userinfo.sqlite"
#define NAME      @"name"
#define PASSWORD  @"password"
#define TABLENAME @"USERINFO"



@interface ViewController (){
    IBOutlet UIButton *tap;
}
//
//@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
//@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
//@property (weak, nonatomic) IBOutlet UILabel *username;
//@property (weak, nonatomic) IBOutlet UILabel *password;



@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.centrify  setImage:[UIImage imageNamed:@"40.png"] forState:UIControlStateNormal];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
   
//    _username.backgroundColor = [UIColor clearColor];
//    _password.backgroundColor = [UIColor clearColor];
    
    
    self.login.backgroundColor = [UIColor redColor];
}





- (IBAction)tap:(id)sender {
    // Create a UIActivityViewController with our image
    
    
//    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"Title" message:@"123" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [alter show];
    
    
//    NSString *name = @"abc";
//    NSString *password = @"123";
//    NSDictionary *item = @{@"name":name,@"password":password};
//    
//    
//    //@"org.appextension.find-login-action"
//    NSItemProvider *itemProvider = [[NSItemProvider alloc] initWithItem:item typeIdentifier:@"public.text"];
//    NSExtensionItem *extensionItem = [[NSExtensionItem alloc] init];
//    extensionItem.attachments = @[ itemProvider ];
//    
//    
//    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[ extensionItem ]  applicationActivities:nil ];
//    activityViewController.completionWithItemsHandler = ^(NSString *activityType, BOOL completed, NSArray*returnedItems, NSError *error){
//        if([returnedItems count] > 0){
//            NSExtensionItem* extensionItem = [returnedItems firstObject];
//            NSItemProvider* imageItemProvider = [[extensionItem attachments] firstObject];
//            if([imageItemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypeText]){
//                [imageItemProvider loadItemForTypeIdentifier:(NSString *)kUTTypeText options:nil completionHandler:^(NSDictionary *item, NSError *error) {
//                    if(item && !error){
//                        _nameTF.text  = item[@"name"];
//                        _pwdTF.text = item[@"password"];
//                    
//                        NSLog(item[@"name"]);
//                        
//                    }
//                }];
//            }
//        }
//    };
////    [YO sendYOToIndividualUser:@"ICAMCHU"];
//    [self presentViewController:activityViewController animated:YES completion:nil];
    
    HomeViewController *vc  = [[HomeViewController alloc] init];
    
    [self presentModalViewController:vc animated:YES];
    
    
}

- (IBAction)centrify:(id)sender {
    
    NSString *name = @"icamchu";
    NSString *password = @"290690";
    NSDictionary *item = @{@"name":name,@"password":password};
    
    
    //@"org.appextension.find-login-action"
    NSItemProvider *itemProvider = [[NSItemProvider alloc] initWithItem:item typeIdentifier:@"public.text"];
    NSExtensionItem *extensionItem = [[NSExtensionItem alloc] init];
    extensionItem.attachments = @[ itemProvider ];
    
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[ extensionItem ]  applicationActivities:nil ];
    activityViewController.completionWithItemsHandler = ^(NSString *activityType, BOOL completed, NSArray*returnedItems, NSError *error){
        if([returnedItems count] > 0){
            NSExtensionItem* extensionItem = [returnedItems firstObject];
            NSItemProvider* imageItemProvider = [[extensionItem attachments] firstObject];
            if([imageItemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypeText]){
                [imageItemProvider loadItemForTypeIdentifier:(NSString *)kUTTypeText options:nil completionHandler:^(NSDictionary *item, NSError *error) {
                    if(item && !error){
                        _nameTF.text  = item[@"name"];
                        _pwdTF.text = item[@"password"];
                        
                        NSLog(item[@"name"]);
                        
                    }
                }];
            }
        }
    };
    //    [YO sendYOToIndividualUser:@"ICAMCHU"];
    [self presentViewController:activityViewController animated:YES completion:nil];
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
