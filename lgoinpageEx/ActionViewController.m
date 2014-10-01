//
//  ActionViewController.m
//  lgoinpageEx
//
//  Created by Cam on 14-9-10.
//  Copyright (c) 2014年 Cam. All rights reserved.
//

#import "ActionViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

#define DBNAME    @"userinfo.sqlite"
#define NAME      @"name"
#define PASSWORD  @"password"
#define TABLENAME @"USERINFO"

@interface ActionViewController ()

//@property(strong,nonatomic) IBOutlet UIImageView *imageView;

//@property (weak, nonatomic) IBOutlet UITextView *display;


@end

@implementation ActionViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documents = [paths objectAtIndex:0];
//    NSString *database_path = [documents stringByAppendingPathComponent:DBNAME];
//    
//    
//    
//    
//    if (sqlite3_open([database_path UTF8String], &db) != SQLITE_OK) {
//        sqlite3_close(db);
//        NSLog(@"数据库打开失败");
//    }
//    
//    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS USERINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, password INTEGER)";
//    [self execSql:sqlCreateTable];
//    
//    
//    NSString *sql1 = [NSString stringWithFormat:
//                      @"INSERT INTO '%@' ('%@', '%@') VALUES ('%@', '%@')",
//                      TABLENAME, NAME, PASSWORD, @"apple", @"123"];
//    
//    NSString *sql2 = [NSString stringWithFormat:
//                      @"INSERT INTO '%@' ('%@', '%@') VALUES ('%@', '%@')",
//                      TABLENAME, NAME, PASSWORD, @"pineapple", @"123"];
//    [self execSql:sql1];
//    [self execSql:sql2];
//    
//    
//    NSString *sqlQuery = @"SELECT * FROM USERINFO";
//    sqlite3_stmt * statement;
//    
//    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
//        while (sqlite3_step(statement) == SQLITE_ROW) {
//            char *name = (char*)sqlite3_column_text(statement, 1);
//            NSString *nsNameStr = [[NSString alloc]initWithUTF8String:name];
//            
//            int password = sqlite3_column_int(statement, 2);
//            
//            
//            NSLog(@"name:%@  password:%d ",nsNameStr,password);
//        }
//    }
//    sqlite3_close(db);

    
    

    // Get the item[s] we're handling from the extension context.
    
    // For example, look for an image and place it into an image view.
    // Replace this with something appropriate for the type[s] your extension supports.
    BOOL imageFound = NO;
    for (NSExtensionItem *item in self.extensionContext.inputItems) {
        for (NSItemProvider *itemProvider in item.attachments) {
            if ([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypeText]) {
                // This is an image. We'll load it, then place it in our image view.
               // __weak UIImageView *imageView = self.imageView;
                [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypeText options:nil completionHandler:^(NSDictionary *item, NSError *error) {
                    if(item) {
                        //self.display.text = item[@"password"];
                    }
                }];
                
                imageFound = YES;
                break;
            }
        }
        
        if (imageFound) {
            // We only handle one image, so stop looking for more.
            break;
        }
    }
}


//
//-(void)execSql:(NSString *)sql
//{
//    char *err;
//    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
//        sqlite3_close(db);
//        NSLog(@"数据库操作数据失败!");
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done {
    // Return any edited content to the host app.
    // This template doesn't do anything, so we just echo the passed in items.
//    NSString *name = @"icamchu";
//    NSString *password = @"2900690";
//    NSDictionary *data = @{@"name":name,@"password":password};
//    NSItemProvider *itemProvider =[[NSItemProvider alloc]initWithItem:data typeIdentifier:@"public.text"];
//    NSExtensionItem *item = [[NSExtensionItem alloc] init];
//    item.attachments = @[itemProvider];
//    [self.extensionContext completeRequestReturningItems:@[item]completionHandler:nil];
    [self.extensionContext completeRequestReturningItems:@[]completionHandler:nil];
   
}


- (IBAction)tapGmail:(id)sender {
    NSString *name = @"icamchu@gmail.com";
    NSString *password = @"2900690";
    NSDictionary *data = @{@"name":name,@"password":password};
    NSItemProvider *itemProvider =[[NSItemProvider alloc]initWithItem:data typeIdentifier:@"public.text"];
    NSExtensionItem *item = [[NSExtensionItem alloc] init];
    item.attachments = @[itemProvider];
    [self.extensionContext completeRequestReturningItems:@[item]completionHandler:nil];
    
}


- (IBAction)tapCentrify:(id)sender {
    NSString *name = @"icamchu@centrify.com";
    NSString *password = @"2900690";
    NSDictionary *data = @{@"name":name,@"password":password};
    NSItemProvider *itemProvider =[[NSItemProvider alloc]initWithItem:data typeIdentifier:@"public.text"];
    NSExtensionItem *item = [[NSExtensionItem alloc] init];
    item.attachments = @[itemProvider];
    [self.extensionContext completeRequestReturningItems:@[item]completionHandler:nil];

    
}

@end
