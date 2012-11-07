//
//  Cell.m
//  HomeWorkOne_DNA
//
//  Created by Anatoly Yashkin on 07.11.12.
//  Copyright (c) 2012 Anatoly Yashkin. All rights reserved.
//

#import "Cell.h"
#import <ScreenSaver/ScreenSaver.h>

@implementation Cell

-(id)init
{
    self=[super init];
    _DNA =[NSMutableArray arrayWithCapacity:100];
    
    for (int i=0; i<100; i++) {
        [_DNA addObject: [Cell getRandomDNAPart]];
    }
    
    return self;
    
}

//Метод определяет количество различий между последовате
-(int)hammingDistance:(Cell *)otherCell
{
    int diffCounter=0;
    for (int i=0; i<100; i++) {
        if ([_DNA objectAtIndex:i]!=[otherCell.DNA objectAtIndex:i]) {
            diffCounter++;
        }
    }
    return diffCounter;
}

//Генерируем случайным образом буковку для последовательности ДНК
+(NSString *) getRandomDNAPart
{
    
    NSString * DNAParts=@"ATGC";
    int randomCounter = SSRandomIntBetween(0, 3);
    
    return [NSString stringWithFormat:@"%C",[DNAParts characterAtIndex:randomCounter]];

}

-(NSString *) description {
    NSMutableString * result = [[NSMutableString alloc] init];;
    for (NSString * obj in _DNA) {
        [result appendString:[obj description]];
    }
    return result;
}


@end
