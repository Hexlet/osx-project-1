//
//  Cell.h
//  Project1DNA
//
//  Created by Администратор on 11/8/12.
//  Copyright (c) 2012 ky391. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray *aDNA;
    NSMutableArray *aDNAelements;
    NSUInteger iDNAlength;
}

-(NSString *) getDNAatIndex: (NSUInteger) index;

-(int) hammingDistance: (Cell *)otherCell;

-(void) print;

@end
