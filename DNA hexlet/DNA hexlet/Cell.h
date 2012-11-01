//
//  Cell.h
//  DNA hexlet
//
//  Created by Eugene on 01.11.12.
//  Copyright (c) 2012 Eugene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray *dna;
}



@property(nonatomic,retain) NSMutableArray *dna;

-(void)print;
-(int)hammingDistance:(Cell*)cell;
@end
