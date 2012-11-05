//
//  Cell.h
//  DNA
//
//  Created by Alexander on 04.11.12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_LENGTH 100
@interface Cell : NSObject
{
  NSMutableArray *DNA;
  NSArray *DNAparts;
}

-(void) printOutDna;
-(NSMutableArray *) getDNA;
-(int)  hammingDistance: (Cell *) toCell;

@end
