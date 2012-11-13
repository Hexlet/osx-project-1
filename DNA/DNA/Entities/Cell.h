//
//  Cell.h
//  DNA
//
//  Created by Evgeny Plenkin on 08.11.12.
//  Copyright (c) 2012 EvgenyPlenkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>

@interface Cell : NSObject {
    NSMutableArray *checkDNA;
    NSArray *letterArray;
}

@property NSMutableArray *DNA;

-(int)hammingDistance:(Cell *)cell;
-(void)initCheckDNA;

@end
