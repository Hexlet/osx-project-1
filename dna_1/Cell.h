//
//  cell.h
//  dna_1
//
//  Created by Partisan on 07.03.13.
//  Copyright (c) 2013 partisan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
-(id)init;
-(void)print;
-(id)   getGeneAtIndex:(unsigned int) index;
-(void) setGene:(NSString *)gene AtIndex: (unsigned int) index;
-(id)getDNA;
-(int)hammingDistance:(Cell *) c;

@end

@interface Cell (Mutation)
-(void)mutate:(int) percent; 
@end;
