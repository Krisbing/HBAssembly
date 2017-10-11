//
//  HBRoundView.m
//  xxxtestttt
//
//  Created by 贺兵 on 2017/9/30.
//  Copyright © 2017年 贺兵. All rights reserved.
//

#import "HBRoundView.h"
@interface HBRoundView()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UILabel *firstLab;

@property (nonatomic, strong) UILabel *secondLab;

@property (nonatomic, assign) NSInteger messageIndex;


@end
@implementation HBRoundView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        [self _setupSubViews];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.firstLab.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.secondLab.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
}
- (void)_setupSubViews
{
    UILabel *firstLab = [UILabel new];
    firstLab.textColor = [UIColor redColor];
    firstLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:firstLab];
    self.firstLab = firstLab;
    
    UILabel *secondLab = [UILabel new];
    secondLab.textColor = [UIColor greenColor];
    secondLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:secondLab];
    self.secondLab = secondLab;
    
}
- (void)setMessageArray:(NSArray<NSString *> *)messageArray
{
    _messageArray = messageArray;
    
    if (_messageArray.count > 2) {
        self.messageIndex = 0;
        self.firstLab.text = _messageArray[self.messageIndex];
        self.messageIndex++;
        self.secondLab.text = _messageArray[self.messageIndex];
    }
}
- (void)_roundAnimation
{
    if (!self.timer) {
        self.timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(_seupAnimation) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }

}
- (void)_seupAnimation
{
    [UIView animateWithDuration:1 animations:^{
        CGFloat secondY = self.secondLab.frame.origin.y == 0 ? -self.frame.size.height : 0;
        self.secondLab.frame = CGRectMake(0, secondY, self.secondLab.frame.size.width, self.secondLab.frame.size.height);
        CGFloat firstLabY = self.firstLab.frame.origin.y == 0 ? -self.frame.size.height : 0;
        self.firstLab.frame = CGRectMake(0, firstLabY, self.firstLab.frame.size.width, self.firstLab.frame.size.height);
    } completion:^(BOOL finished) {
        CGFloat firstLabY = self.firstLab.frame.origin.y == 0 ? 0 : self.frame.size.height;
        self.firstLab.frame = CGRectMake(0, firstLabY, self.firstLab.frame.size.width, self.firstLab.frame.size.height);
        if (firstLabY > 0) {
            self.messageIndex++;
            self.messageIndex = self.messageIndex > self.messageArray.count - 1 ? 0 : self.messageIndex;
            self.firstLab.text = self.messageArray[self.messageIndex];
        }
        CGFloat secondY = self.secondLab.frame.origin.y == 0 ? 0 : self.frame.size.height;
        self.secondLab.frame = CGRectMake(0, secondY, self.secondLab.frame.size.width, self.secondLab.frame.size.height);
        if (secondY > 0) {
            self.messageIndex++;
            self.messageIndex = self.messageIndex > self.messageArray.count - 1 ? 0 : self.messageIndex;
            self.secondLab.text = self.messageArray[self.messageIndex];
        }
        
    }];
    
}
@end
