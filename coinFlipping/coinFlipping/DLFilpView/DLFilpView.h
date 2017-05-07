//
//  DLFilpView.h
//  testCoinFlipping
//
//  Created by NowOrNever on 07/05/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    DLFlipDirectionX = 1123,//前后
    DLFlipDirectionY    //左右
} DLFlipDirection;

@interface DLFilpView : UIView

/**
 正面图片
 */
@property (nonatomic, copy) NSString *firstImageName;

/**
 反面图片
 */
@property (nonatomic, copy) NSString *secondImageName;

/**
 结果 
 结果正反面取决于 resultNumber % 2
 */
@property (nonatomic, assign) NSInteger resultNumber;

/**
 翻转一次时间间隔
 */
@property (nonatomic, assign) CGFloat timeInterval;

/**
 direction
 */
@property (nonatomic, assign) DLFlipDirection direction;


/**
 翻转动画
 */
- (void)flip;


/**
 停止动画
 */
- (void)stop;


/**
 创建一个DLFlipView

 @param firstImageName 正面图案名称
 @param secondImageName 背面图案名称
 @param timeInterval 转360度消耗的时间
 @param direction 旋转方向
 @return 返回一个功能齐备的flipVIew
 */
- (instancetype)initWithFirstImageName:(NSString *)firstImageName secondImageName:(NSString *)secondImageName timeInterval:(CGFloat)timeInterval andDirection:(DLFlipDirection)direction;

@end
