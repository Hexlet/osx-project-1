//
//  Cell.h
//  DNA
//
//  Created by Roman on 31.10.12.
//  Copyright (c) 2012 BlackGray. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject
{
    NSMutableArray * dna;
    NSArray * variety;
}

-(id)init;
-(int)hammingDistance:(Cell*)otherDna;
-(NSMutableArray*)getDna;
@end
