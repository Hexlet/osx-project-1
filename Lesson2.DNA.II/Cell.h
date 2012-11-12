//
//  Cell.h
//  Lesson2.DNA.II
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 DS. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSArray * allowedCharsArray;

@interface Cell : NSObject {
    
}
    @property NSMutableArray *DNA;
-(id)init;
-(int) hammingDistance:(Cell*)otherCell;
-(NSString*)asString;
@end
