//
//  Cell.h
//  DNAProcessor
//
//  Created by Sergey Nebolsin on 10.11.12.
//  Copyright (c) 2012 Sergey Nebolsin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_DEFAULT_LENGTH 100

@interface Cell : NSObject

@property NSMutableArray *dna;

+(Cell *) cell;
+(Cell *) cellWithLength:(int) length;
+(NSString *) randomNucleicBase;

-(id) initWithLength:(int) length;
-(int) hammingDistance:(Cell *) anotherCell;
-(void) print;

@end
