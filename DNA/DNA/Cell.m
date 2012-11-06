//
//  Cell.m
//  DNA
//
//  Created by Ivan Sokolov on 03.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize _DNA;

- (id)init
{
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray alloc]init];
        
        DNAValue = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];//Задаем значения символов ДНК
       
        //Заполняем массив случайными символами
        for (NSInteger i=0; i<100; i++) {
       
            NSString *tmp = [[NSString alloc]initWithFormat:[DNAValue objectAtIndex:arc4random()%4]];
           [_DNA addObject:tmp];        
           }
    }
    return self;
}

-(int) hammingDistance:(Cell *)a
{
    int x=0;
    //Сравниваем 2 символа из 2 ДНК
    for (int i=0; i<[_DNA count]-1; i++) {
        NSString *second = [NSString stringWithFormat:[[a _DNA] objectAtIndex:i]];
        NSString *first = [NSString stringWithFormat:[_DNA objectAtIndex:i]];
        if (first!=second) {
            x++;
        }
    }
    return x;
}

-(void) showDNA:(NSMutableArray *) t{
   //Показываем ДНК
    NSMutableString *str1 = [[NSMutableString alloc] init];
    for (NSString *d in t) {
        [str1 appendString:d];   
    }
    NSLog(@"%@",str1);  
}

@end
