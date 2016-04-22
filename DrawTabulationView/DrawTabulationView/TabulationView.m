
//
//  TabulationView.m
//  DrawTabulationView
//
//  Created by  江苏 on 16/4/22.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "TabulationView.h"

@implementation TabulationView

//点击一下重新生成
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    NSArray* arr=[self getRandomArray];
    
    CGFloat x=0;
    
    CGFloat y=0;
    
    CGFloat height=0;
    
    CGFloat width=0;
    
    for (int i=0; i<arr.count; i++) {
        
        CGFloat k=[arr[i] doubleValue]/100.0;
        
        height=rect.size.height*k;
        width=rect.size.width/(arr.count*2-1);
        
        x=x+width*2*i;
        y=rect.size.height-height;
        
        UIBezierPath* path=[UIBezierPath bezierPathWithRect:CGRectMake(x, y, width, height)];
        
        [[self gatRandomColor] set];
        
        [path fill];
        
        [path stroke];
        
    }
}

//生成饼状图
-(void)setPieView:(CGRect)rect{
    
    NSArray* arr=[self getRandomArray];
    
    CGPoint center=CGPointMake(rect.size.width/2, rect.size.height/2);
    
    CGFloat radius=rect.size.width/2;
    
    CGFloat startA=0;
    
    CGFloat endA=0;
    
    for (int i=0; i<arr.count; i++) {
        
        CGFloat k=[arr[i] doubleValue]/100.0;
        
        startA=endA;
        endA=startA+k*M_PI*2;
        
        UIBezierPath* path=[UIBezierPath bezierPathWithArcCenter:center radius:radius-10 startAngle:startA endAngle:endA clockwise:YES];
        
        [path addLineToPoint:center];
        
        
        [[self gatRandomColor] set];
        
        [path fill];
        
        [path stroke];
        
    }
}

//生成随机数组
-(NSArray*)getRandomArray{
    NSMutableArray* arrM=[NSMutableArray array];
    
    int total=100;
    int current=0;

    for (int i=0; i<arc4random_uniform(10)+1; i++) {
        current=arc4random_uniform(total)+1;
        [arrM addObject:@(current)];
        
        if (total==current) {
            break;
        }
        total-=current;
    }
    
    if (total) {
        [arrM addObject:@(total)];
    }
    
    return arrM;
}
//生成随机色
-(UIColor*)gatRandomColor{
    
    CGFloat r=arc4random_uniform(256)/255.0;
    CGFloat g=arc4random_uniform(256)/255.0;
    CGFloat b=arc4random_uniform(256)/255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    
}
@end
