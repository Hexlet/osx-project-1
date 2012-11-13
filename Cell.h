//
//  Cell.h
//  DNK
//
//  Created by evgen on 11/9/12.
//  Copyright (c) 2012 evgen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *_DNA;
}

@property NSMutableArray *DNA;

-(id)init;
//get random object type NSString for the array
+(NSString*)getRandomCharacter;

-(int) hammingDistance: (Cell*) number;

@end
