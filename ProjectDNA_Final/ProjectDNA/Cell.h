//
//  Cell.h
//  ProjectDNA
//
//  Created by Anton Samoylov on 02.11.12.
//  Copyright (c) 2012 Anton Samoylov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
    int DNACapacity;
    int CharsCapacity;
}

-(int) hammingDistance:(Cell *)hrefCell;
+(NSString *)getRandomElement:(NSString *)element;
-(void) printArray;
@end
