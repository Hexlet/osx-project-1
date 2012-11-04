//
//  Cell.h
//  osx-project-1
//
//  Created by Andrew Kolisnichenko on 11/4/12.
//  Copyright (c) 2012 Andrew Kolisnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property NSMutableArray* dna;

+(NSString*) getRandomDNANucleotide;

-(id)init;
-(int)hammingDistance:(Cell*)cell;
-(void)print;

@end
