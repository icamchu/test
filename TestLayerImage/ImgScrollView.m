//
//  ImgScrollView.m
//  TestLayerImage
//
//  Created by lcc on 14-8-1.
//  Copyright (c) 2014年 lcc. All rights reserved.
//

#import "ImgScrollView.h"

@interface ImgScrollView()<UIScrollViewDelegate>
{
    UIImageView *imgView;
    
    //记录自己的位置
    CGRect scaleOriginRect;
    
    //图片的大小
    CGSize imgSize;
    
    //缩放前大小
    CGRect initRect;
}

@end

@implementation ImgScrollView

- (void)dealloc
{
    _i_delegate = nil;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.bouncesZoom = YES;
        self.backgroundColor = [UIColor clearColor];
        self.delegate = self;
        self.minimumZoomScale = 1.0;
        
        imgView = [[UIImageView alloc] init];
        imgView.clipsToBounds = YES;
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:imgView];

    }
    return self;
}

- (void) setContentWithFrame:(CGRect) rect
{
    imgView.frame = rect;
    initRect = rect;
}

- (void) setAnimationRect
{
    imgView.frame = scaleOriginRect;
}

- (void) rechangeInitRdct
{
    self.zoomScale = 1.0;
    imgView.frame = initRect;
}

- (void) setImage:(UIImage *) image
{
    if (image)
    {
        imgView.image = image;
        imgSize = image.size;
        
        //判断首先缩放的值
        float scaleX = self.frame.size.width/imgSize.width;
        float scaleY = self.frame.size.height/imgSize.height;
        
        //倍数小的，先到边缘
        
        if (scaleX > scaleY)
        {
            //Y方向先到边缘
            float imgViewWidth = imgSize.width*scaleY;
            self.maximumZoomScale = self.frame.size.width/imgViewWidth;
            
            scaleOriginRect = (CGRect){self.frame.size.width/2-imgViewWidth/2,0,imgViewWidth,self.frame.size.height};
        }
        else
        {
            //X先到边缘
            float imgViewHeight = imgSize.height*scaleX;
            self.maximumZoomScale = self.frame.size.height/imgViewHeight;
            
            scaleOriginRect = (CGRect){0,self.frame.size.height/2-imgViewHeight/2,self.frame.size.width,imgViewHeight};
        }
    }
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button addTarget:self
//               action:@selector(yo)
//     forControlEvents:UIControlEventTouchUpInside];
//    [button setTitle:@"Yo to Your Friends" forState:UIControlStateNormal];
//     button.frame = CGRectMake(160.0, 500.0, 160.0, 40.0);
    
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(yo)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Yo to Subsrcibers" forState:UIControlStateNormal];
    button.frame = CGRectMake(60.0, 500.0, 200.0, 40.0);
    button.titleLabel.font =  [UIFont fontWithName:@"Helvetica-Bold" size:20];
    //[UIFont systemFontOfSize:20];
    
    [button setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    button.layer.borderWidth=3.0f;
    button.layer.cornerRadius = 4.5;
    button.layer.borderColor=[[UIColor whiteColor] CGColor];
    [self addSubview:button];
    
    
}
-(void) yo
{
    [YO sendYOToIndividualUser:@"CAMCHU125"];
    
//    //產生一個Alerts對話框並設定顯示內容與按鈕
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Furncae Digital"
//                                                    message:@"請選擇聯絡方式"
//                                                   delegate:self
//                                          cancelButtonTitle:@"還是算了"
//                                          otherButtonTitles:@"電話", @"E-Mail", nil];
//    
//    //也可以使用這種方式增加事件按鈕
//    [alert addButtonWithTitle:@"MSN"];
//    
//    //將Alerts顯示於畫面上
//    [alert show];
   
    
}

#pragma mark -
#pragma mark - scroll delegate
- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imgView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    
    CGSize boundsSize = scrollView.bounds.size;
    CGRect imgFrame = imgView.frame;
    CGSize contentSize = scrollView.contentSize;
    
    CGPoint centerPoint = CGPointMake(contentSize.width/2, contentSize.height/2);
    
    // center horizontally
    if (imgFrame.size.width <= boundsSize.width)
    {
        centerPoint.x = boundsSize.width/2;
    }
    
    // center vertically
    if (imgFrame.size.height <= boundsSize.height)
    {
        centerPoint.y = boundsSize.height/2;
    }
    
    imgView.center = centerPoint;
}

#pragma mark -
#pragma mark - touch
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.i_delegate respondsToSelector:@selector(tapImageViewTappedWithObject:)])
    {
        [self.i_delegate tapImageViewTappedWithObject:self];
    }
}

@end
