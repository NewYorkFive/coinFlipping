//
//  DLFilpView.m
//  testCoinFlipping
//
//  Created by NowOrNever on 07/05/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "DLFilpView.h"

@interface DLFilpView ()

/**
 遮罩层
 */
@property (nonatomic, strong) UIButton *maskButton;

/**
 显示的imageView
 */
@property (nonatomic, strong) UIImageView *imageView;

/**
 正面
 */
@property (nonatomic, strong) UIImage *firstImage;

/**
 背面
 */
@property (nonatomic, strong) UIImage *secondImage;

/**
 定时器
 */
@property (nonatomic, strong) NSTimer *timer;

/**
 是否正在抛硬币动画
 */
@property (nonatomic, assign) BOOL isFlip;

@end


@implementation DLFilpView


#pragma mark:初始化
- (instancetype)initWithFirstImageName:(NSString *)firstImageName secondImageName:(NSString *)secondImageName timeInterval:(CGFloat)timeInterval andDirection:(DLFlipDirection)direction{
    if (self = [super init]) {
        _firstImageName = firstImageName;
        _secondImageName = secondImageName;
        _timeInterval = timeInterval;
        _direction = direction;
        
        _firstImage = [UIImage imageNamed:firstImageName];
        _secondImage = [UIImage imageNamed:secondImageName];
        [self setupUI];
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
//    self.backgroundColor = [UIColor darkGrayColor];
    _isFlip = false;
    
    self.imageView.image = self.firstImage;
    [self addSubview:self.imageView];
    
    UIButton *btn = [[UIButton alloc]init];
    [self addSubview:btn];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    self.maskButton = btn;

}

//保证子控件大小和本身view一致
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
    self.maskButton.frame = self.bounds;
}


#pragma mark: 保证图片一致性
- (void)setFirstImageName:(NSString *)firstImageName{
    if ([_firstImageName isEqualToString:firstImageName]) {
        return;
    }
    _firstImageName = firstImageName;
    self.firstImage = [UIImage imageNamed:firstImageName];
    self.imageView.image = self.firstImage;
}


- (void)setSecondImageName:(NSString *)secondImageName{
    if ([_secondImageName isEqualToString:secondImageName]) {
        return;
    }
    _secondImageName = secondImageName;
    self.secondImage = [UIImage imageNamed:secondImageName];
}



#pragma mark:抛硬币动画和停止
- (void)btnAction{
    if (!self.isFlip) {
        [self flip];
    }else{
        [self stop];
    }
}

/**
 动画
 */
- (void)flip{
    _isFlip = true;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(viewFlip) userInfo:nil repeats:true];
    self.resultNumber = arc4random_uniform(123456);
}

- (void)viewFlip{
    
    UIViewAnimationOptions option = UIViewAnimationOptionTransitionFlipFromTop;
    if (self.direction == DLFlipDirectionY) {
        option = UIViewAnimationOptionTransitionFlipFromLeft;
    }
    
    [UIView transitionWithView:self.imageView duration:self.timeInterval options:option animations:^{
        UIImage *image = (self.imageView.image != self.firstImage) ? self.firstImage : self.secondImage;
        [self.imageView setImage:image];
    } completion:^(BOOL finished) {
    }];
}

/**
 停止
 */
- (void)stop{
    [self.timer setFireDate:[NSDate distantFuture]];
    [self.timer invalidate];
    self.timer = nil;
    [self.imageView setImage:self.resultNumber % 2 ? self.firstImage : self.secondImage];
    _isFlip = false;
}



/**
 lazy load

 @return <#return value description#>
 */
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.userInteractionEnabled = true;
//        _imageView.backgroundColor = [UIColor greenColor];
    }
    return _imageView;
}


/**
 保证内存不泄露
 */
- (void)removeFromSuperview{
    [self stop];
    [super removeFromSuperview];
}


/**
 检查内存管理
 */
- (void)dealloc{
    NSLog(@"%@",self.timer);
}

@end
