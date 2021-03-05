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

int points = 0;
bool flyExists = true;

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
    CGRect circlePoint1 = CGRectMake(self.startPoint.x, self.startPoint.y, 10.0, 10.0);
    CGContextFillEllipseInRect(context, circlePoint1);
    CGRect circlePoint2 = CGRectMake(self.endPoint.x, self.endPoint.y, 10.0, 10.0);
    CGContextFillEllipseInRect(context, circlePoint2);
    CGPoint midStart, midEnd;
    if(self.startPoint.x < self.endPoint.x){
        midStart = self.startPoint;
        midEnd = self.endPoint;
    } else {
        midStart = self.endPoint;
        midEnd = self.startPoint;
    }
    double diffX = (midEnd.x - midStart.x) / 8;
    double diffY = (double)(midEnd.y - midStart.y) / 8;
    int counter = 0;
    for(int i = midStart.x; i < midEnd.x; i+= diffX){
        CGRect midCircle = CGRectMake(i, midStart.y + counter * diffY, 10, 10);
        CGContextFillEllipseInRect(context, midCircle);
        counter++;
    }
    [self slashDone];
}

- (void)slashDone{
    if(!flyExists){
        return;
    }
    int tolerance = 10;
    double slope = (double)abs([Singleton sharedObject].y2 - [Singleton sharedObject].y1) / (double)abs([Singleton sharedObject].x2 - [Singleton sharedObject].x1);
    double directHitY = ((double)[Singleton sharedObject].y1) + slope * ([Singleton sharedObject].flyx - [Singleton sharedObject].x1);
    if(fabs(directHitY - ([Singleton sharedObject].flyy)) < tolerance){
        NSLog(@"Here");
        _catchFly.text = @"Fly Caught!";
        flyExists = false;
    }
}

- (IBAction)nextFlyButtonClicked:(id)sender{
    flyExists = true;
    _catchFly.text = @"Fly Not Caught";
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
