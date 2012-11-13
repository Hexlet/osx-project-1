//
//  Cell.h
//  DNA
//
//  Created by Anton Platonov on 7.11.12.
//  Copyright (c) 2012 Anton Platonov. All rights reserved.
//

#import <Foundation/Foundation.h>


#define CELL_DNA_LENGTH 100


@interface Cell : NSObject

@property (readonly) NSMutableArray * DNA;

+(NSString *)randomDNASymbol;

-(int)hammingDistance:(Cell *)otherCell;

@end
