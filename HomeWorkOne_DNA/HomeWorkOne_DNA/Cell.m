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
        [_DNA addObject: [Cell getRandomDNAPart:nil]];
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
//у slebedev подсмотрел фишечку, что удобно будет передавать в этот метод элемент, который будем менять.
+(NSString *) getRandomDNAPart:(id)replasingPart
{
    NSMutableArray *DNAParts = nil;
    int randomCounter=0;
    
    if (!DNAParts) {
        DNAParts = [NSMutableArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
    }
    
    if (replasingPart==nil) {
            randomCounter = SSRandomIntBetween(0, 3);
    }
    else
    {
        [DNAParts removeObject:replasingPart];
        randomCounter = SSRandomIntBetween(0, 2);
    }
    
    return [NSString stringWithFormat:@"%@",[DNAParts objectAtIndex:randomCounter]];


}

-(NSString *) description {
    return [_DNA componentsJoinedByString:@""];
}


@end
