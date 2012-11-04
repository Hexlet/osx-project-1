//
//  Cell.h
//  DNA
//
//  Created by Mac User on 11/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray *DNA;    
}
-(id)init;
-(void)print;
-(int)hammingDistance:(Cell*)DNA1;
@end
