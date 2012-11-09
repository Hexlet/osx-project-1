//
//  Cell.h
//  osx-project-1
//
//  Created by m g on 11/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DNA_DIMENTION 100

@interface Cell : NSObject
{
    enum DNALetters
    {
        letterA = 0,
        letterC,
        letterT,
        letterG,
        letterLast, // always on end
    };
    
    NSMutableArray* DNA;
}

-(id)init;
-(void)initDNA;

-(enum DNALetters)getLetterByIndex:(int) index;
-(int)hummingDistance: (Cell*) anotherDNA;

-(void)print;
@end
