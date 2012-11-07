//
//  Cell.h
//  DNA
//
//  Created by Ivan Sokolov on 03.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray *_DNA;
    NSMutableArray *DNAValue;//Значение символов ДНК
}

-(int) hammingDistance:(Cell *)a;


@property NSMutableArray *_DNA;
@end
