//
//  Cell.h
//  DNK
//
//  Created by flom on 30.10.12.
//  Copyright (c) 2012 flom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna;

-(id)init;
-(void)print;
-(NSMutableString*)makeString;
-(int)hammingDistace:(Cell*)cell;

@end
