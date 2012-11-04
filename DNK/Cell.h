//
//  Cell.h
//  DNK
//
//  Created by Michael Blinchevsky on 11/4/12.
//  Copyright (c) 2012 aia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
   
  NSMutableArray* arr;
    NSString* name;
}
-(id)init;
-(id)initWithName: (NSString*)ofname;
-(const NSMutableArray*)getArr;
-(NSMutableString*) arrToStr;
-(int)hammingDistance: (Cell*)fromCell;
-(void) print;

-(NSString*)getDNAchar;
@end

@interface Cell (mutator)
-(void)mutate:(int)celldamage;
@end

