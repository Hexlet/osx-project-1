//
//  Cell.h
//  hexlet-project1
//
//  Created by Alexey Karguine on 01.11.12.
//  Copyright (c) 2012 Alexey Karguine. All rights reserved.
//

#import <Foundation/Foundation.h>


#define DNALength 100

@interface Cell : NSObject
{
    NSMutableArray *dna;
    NSMutableArray *alphabet;
}

-(int)hammingDistance:(Cell *)c;

-(void)printDNA;
@end
