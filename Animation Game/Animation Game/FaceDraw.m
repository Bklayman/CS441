//
//  FaceDraw.m
//  Animation Game
//
//  Created by Brendan Klayman on 3/1/21.
//

#import "FaceDraw.h"
#import "Singleton.h"

@implementation FaceDraw


@synthesize endPoint = _endPoint;
@synthesize startPoint = _startPoint; //https://agilewarrior.wordpress.com/2012/09/04/how-to-draw-circles-where-ever-someone-taps-your-screen-iphone-ipad-ios/

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [Singleton sharedObject].x1 = self.startPoint.x;
    [Singleton sharedObject].x2 = self.endPoint.x;
    [Singleton sharedObject].y1 = self.startPoint.y;
    [Singleton sharedObject].y2 = self.endPoint.y;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetRGBFillColor(context, 0, 1, 0, 1);
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1);
    CGRect circlePoint1 = (CGRectMake(self.startPoint.x, self.startPoint.y, 10.0, 10.0));
    CGContextFillEllipseInRect(context, circlePoint1);
    CGRect circlePoint2 = (CGRectMake(self.endPoint.x, self.endPoint.y, 10.0, 10.0));
    CGContextFillEllipseInRect(context, circlePoint2);
    ViewController *test = [[ViewController alloc] init];
    [test slashDone];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for(UITouch *t in touches){
        self.startPoint = [t locationInView:self];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for(UITouch *t in touches){
        //self.myPoint = [t locationInView:self];
        self.endPoint = [t locationInView:self];
    }
    _startPoint = self.startPoint;
    _endPoint = self.endPoint;
    [self setNeedsDisplay];
}


@end
