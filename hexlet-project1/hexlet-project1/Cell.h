//
//  Cell.h
//  hexlet-project1
//
//  Created by Alexey Karguine on 01.11.12.
//  Copyright (c) 2012 Alexey Karguine. All rights reserved.
//

#import <Foundation/Foundation.h>


#define DNALength 100

@interface Cell : NSObject

@property NSMutableArray *dna;
@property NSArray *alphabet;

-(int)hammingDistance:(Cell *)c;
-(NSString *) getRandomSymbol;
-(NSMutableString *)getString;

@end
