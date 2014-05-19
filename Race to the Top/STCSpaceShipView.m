//
//  STCSpaceShipView.m
//  Race to the Top

#import "STCSpaceShipView.h"

@implementation STCSpaceShipView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2.0;
    //Making it dynamic, 1/6th of width, and 1/3rd of height
    [bezierPath moveToPoint:CGPointMake(1/6.0 * self.bounds.size.width, 1/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint:CGPointMake(1/6.0 *self.bounds.size.width, 2/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint:CGPointMake(5/6.0 *self.bounds.size.width, 2/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint:CGPointMake(2/3.0 *self.bounds.size.width, 1/2.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint:CGPointMake(1/3.0 *self.bounds.size.width, 1/2.0 * self.bounds.size.height)];
    [bezierPath closePath];
    //Need to call the stroke method in order to see the line.
    [bezierPath stroke];
    
    UIBezierPath *cockPitWindowPath = [UIBezierPath bezierPathWithRect:CGRectMake(2/3.0 *self.bounds.size.width, 1/2.0 *self.bounds.size.height, 1/6.0 * self.bounds.size.width, 1/12.0 * self.bounds.size.height)];
    [[UIColor blueColor] setFill];
    [cockPitWindowPath fill];
}


@end
