//
//  FaceDraw.m
//  Animation Game
//
//  Created by Brendan Klayman on 3/1/21.
//

#import "FaceDraw.h"

@implementation FaceDraw

@synthesize myPoint = _myPoint; //https://agilewarrior.wordpress.com/2012/09/04/how-to-draw-circles-where-ever-someone-taps-your-screen-iphone-ipad-ios/

//NSMutableArray* paths;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetRGBFillColor(context, 0, 1, 0, 1);
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1);
    CGRect circlePoint = (CGRectMake(self.myPoint.x, self.myPoint.y, 10.0, 10.0));
    
    CGContextFillEllipseInRect(context, circlePoint);
}

- (void) setMyPoint:(CGPoint)myPoint{
    _myPoint = myPoint;
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for(UITouch *t in touches){
        self.myPoint = [t locationInView:self];
    }
}


@end
