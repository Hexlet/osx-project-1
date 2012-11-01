//
//  Cell.h
//  DNA_project
//
//  Created by swante on 10/31/12.
//  Copyright (c) 2012 swante. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_LENGTH 100 // Число символов в DNA

@interface Cell : NSObject

@property NSMutableArray * dna;  // Массив символов DNA
@property NSArray        * dict; // Словарь символов

-(id)init;
-(int)hammingDistance:(Cell *)c;

@end

@interface Cell (mutator)

-(void)mutate:(int)xPercents;

@end
