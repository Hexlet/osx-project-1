//
//  Cell.m
//  Cell
//
//  Created by Игорь Алюшев on 30.10.12.
//  Copyright (c) 2012 Игорь Алюшев. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize dna=_dna;

-(id)init{
    self=[super init];
    if(self){
        //инициализируем шаблон
        templ=[NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
        
        _dna=[NSMutableArray arrayWithCapacity:elements];
        
        for(int cc=0;cc<elements;cc++)
            [_dna setObject:[self getRandomChar] atIndexedSubscript:cc];
      
    }
    return self;
}

-(int)hammingDistance:(Cell *)theCell{
    int counter=0;
    for(int cc=0;cc<elements;cc++)
        if(! [theCell.dna[cc] isEqual: self.dna[cc]])counter++;
    return counter;
    
}

-(NSString*)getRandomChar{
    /* возвращаем случайный символ для DNA */
    return templ[arc4random() % 4];
}

@end




