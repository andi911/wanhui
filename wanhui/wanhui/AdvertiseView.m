//
//  AdvertiseView.m
//  NewStar
//
//  Created by liangyu on 15-3-24.
//  Copyright (c) 2015年 andi. All rights reserved.
//

#import "AdvertiseView.h"
@interface AdvertiseView ()<UIScrollViewDelegate>
@property (assign) int page;
@property (strong,nonatomic) NSTimer * timer;
@end

@implementation AdvertiseView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib{
    CGFloat buttonW = [UIScreen mainScreen].bounds.size.width;
    CGFloat buttonH = self.ScrollView.frame.size.height + 6;
    
    for (int i = 0; i<5;i++ ) {
        NSString * imageName = [NSString stringWithFormat:@"image%d.png",i+1];
        UIImageView *advertiseImage = [[UIImageView alloc]initWithFrame:CGRectMake(i*buttonW, 0, buttonW, buttonH)];
        advertiseImage.contentMode = UIViewContentModeScaleAspectFill;
        advertiseImage.image = [UIImage imageNamed:imageName];
        [self.ScrollView addSubview:advertiseImage];
    }
    self.ScrollView.contentSize = CGSizeMake(buttonW * 5, buttonH);
    self.ScrollView.pagingEnabled = YES;
    self.ScrollView.showsHorizontalScrollIndicator = NO;
    self.page = 0;
    self.ScrollView.delegate = self;
    self.pageController.numberOfPages = 5;
    self.pageController.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageController.currentPageIndicatorTintColor = [UIColor greenColor];
    self.pageController.enabled = NO;
    [self addTimer];
}

- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}


- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)nextImage
{
    // 1.增加pageControl的页码
    if (self.pageController.currentPage == 4) {
        self.page = 0;
    } else {
        self.page = (int)(self.pageController.currentPage + 1);
    }
    
    // 2.计算scrollView滚动的位置
    CGFloat offsetX = self.page * self.ScrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.ScrollView setContentOffset:offset animated:YES];
}


#pragma mark scrollView 代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 根据scrollView的滚动位置决定pageControl显示第几页
    CGFloat scrollW = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    self.pageController.currentPage = page;
}

/**
 *  开始拖拽的时候调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 停止定时器(一旦定时器停止了,就不能再使用)
    [self removeTimer];
}

/**
 *  停止拖拽的时候调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    // 开启定时器
    [self addTimer];
}

@end
