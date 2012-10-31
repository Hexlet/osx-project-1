//
//  Cell.h
//  osx-project-1
//
//  Created by Sergey Chebotarev on 30.10.12.
//  Copyright (c) 2012 Sergey Chebotarev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray* DNA;
@property (readonly) int lengthDNA;

+(NSString*)getRandomElement;

-(int)hammingDistance:(Cell*)otherCell;

@end


@interface Cell (Mutator)

-(void)mutate:(int)persent;

@end
