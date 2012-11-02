//
//  Cell.h
//  DNA
//
//  Created by Anton on 01.11.12.
//  Copyright (c) 2012 Anton Matrenin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(NSString *) GetRandomDNASymbol;
-(int) HammingDistance: (Cell *) otherDNA;

@end
