//
//  Cell.m
//  Cell
//
//  Created by Игорь Алюшев on 30.10.12.
//  Copyright (c) 2012 Игорь Алюшев. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize dna;

-(id)init{
    self=[super init];
    if(self){
        //инициализируем шаблон
        templ=[NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
        
        dna=[NSMutableArray arrayWithCapacity:100];
        
        for(int cc=0;cc<100;cc++)
            [dna setObject:[self getRandomChar] atIndexedSubscript:cc];
        return self;
    }
    return nil;
}

-(int)hammingDistance:(Cell *)theCell{
    int counter=0;
    for(int cc=0;cc<100;cc++)
        if([self isEqualItem:[theCell.dna objectAtIndex:cc] atIndex:cc]==NO)counter++;

    return counter;
    
}

-(NSString*)getRandomChar{
    /* возвращаем случайный символ для DNA */
    return templ[arc4random() % 4];
}

-(BOOL)isEqualItem:(id )theItem atIndex:(int)theIndex{
    NSString *str1=(NSString*)[dna objectAtIndex:theIndex]; //получим символ с массива
    if([str1 isEqualToString:(NSString*)theItem])return YES; //сравним их
    return NO;
}

@end




