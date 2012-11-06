//
//  Cell.h
//  Assignment_DNA_Test
//
//  Created by Pasha Ortish on 10/31/12.
//  Copyright (c) 2012 Pasha Ortish. All rights reserved.
//
// point number 1,2 - creating Class "Cell".

#import <Foundation/Foundation.h>

@interface Cell : NSObject

// point number 3 - creating requared variables.

@property NSString *symbols;

@property NSMutableArray *DNA1;
@property NSMutableArray *DNA2;

@property int theDNAchainLength;
@property int theMutationFactor;
@property int harmingDistanceCount;

-(int)hammingDistance:(Cell*)c ;

@end
