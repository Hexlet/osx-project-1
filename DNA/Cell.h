//
//  Cell.h
//  DNI
//
//  Created by Qik on 11/4/12.
//  Copyright (c) 2012 Qik. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject
@property (readonly) NSArray *nucleotids;
@property NSMutableArray *dna;
-(void)print;
-(NSString *)getRandomNucleotid;
-(int) hammingDistance: (Cell*) cell;
-(Cell*) copy;
@end
