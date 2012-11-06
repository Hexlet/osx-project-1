//
//  Cell.m
//  iDNA
//
//  Created by Darwin on 01.11.12.
//  Copyright (c) 2012 Ivo Dimitrov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init {
    if((self = [super init])) {
        _DNA = [Cell getRandomDNA];
    }
    return self;
}

-(int)hammingDistance:(Cell *)otherDNA {
    int matchNumber = 0;
    for (int i=0; i<100; i++) {
        if (![self.DNA[i] isEqualToString: otherDNA.DNA[i]]) {
            matchNumber++;
        }
    }   
    
    return matchNumber;
}

//Возможно надо бы размер задать какойто константой, но еще не сделал все задание =) - если успею, то оформлю.
+(NSMutableArray *)getRandomDNA {
    NSMutableArray *randomDNA = [[NSMutableArray alloc]init];
    NSUInteger i;
    for (i=0; i<100; i++) {
        NSString *randDNA = [Cell getRandomDNASymbols];
        [randomDNA addObject:randDNA];
        //NSLog(@"+ %@", randDNA);
    }
    return randomDNA;
}

+(NSString *)getRandomDNASymbols {    
    static NSArray* symbols;
    if (!symbols) {
        symbols = @[@"A", @"T", @"G", @"C"];
    }
    return symbols[arc4random() % [symbols count]];
}

@end
