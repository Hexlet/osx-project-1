//
//  Cell.h
//  DNA
//
//  Created by Vladimir Tsyganov on 01.11.12.
//  Copyright (c) 2012 Vladimir Tsyganov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    int sizeOfDna;
    NSArray *typeOfGen;
}

    -(id)init;
-(int)hammingDistance: (Cell *) secondCell;
-(NSString *)getRandomGen;
@property NSMutableArray *dna;
@end
