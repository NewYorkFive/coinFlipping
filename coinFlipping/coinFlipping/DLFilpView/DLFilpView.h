//
//  DLFilpView.h
//  testCoinFlipping
//
//  Created by NowOrNever on 07/05/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    DLFlipDirectionX = 1123,
    DLFlipDirectionY
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
 */
@property (nonatomic, assign) NSInteger resultNumber;

/**
 翻转一次时间间隔
 */
@property (nonatomic, assign) CGFloat timeInterval;

@property (nonatomic, assign) DLFlipDirection direction;

- (void)flip;
- (void)stop;
//- (void)destroy;

- (instancetype)initWithFirstImageName:(NSString *)firstImageName secondImageName:(NSString *)secondImageName timeInterval:(CGFloat)timeInterval andDirection:(DLFlipDirection)direction;

@end
