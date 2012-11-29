//
//  Cell.h
//  DNA
//
//  Created by Сергей Греков on 06.11.12.
//  Copyright (c) 2012 Сергей Греков. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_LEN 100

@interface Cell : NSObject
{
        NSArray *dict;
};

@property NSMutableArray *DNA;

-(int)hammingDistance:(Cell *) foreignCell;
-(void)print:(NSArray *) arr;

@end
