//
//  HBroundLabel.m
//  xxxtestttt
//
//  Created by 贺兵 on 2017/9/30.
//  Copyright © 2017年 贺兵. All rights reserved.
//

#import "HBroundLabel.h"
@interface HBroundLabel()<CAAnimationDelegate>

@end
@implementation HBroundLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        
    }
    return self;
}
- (void)startAnimation
{
    [self _setupAnimations];
}
- (void)_setupAnimations
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.repeatCount = 1;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = 0.5f;
    animation.delegate = self;
    animation.fromValue = @(self.frame.origin.y);
    animation.toValue = @(self.frame.origin.y - self.frame.size.height);
    animation.beginTime = CACurrentMediaTime() + 2; // 5秒后执行
    // 动画先加速后减速
    animation.timingFunction =
    [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation:animation forKey:@"begainAnimation"];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"eeee");
}
@end
