//
//  Cell.h
//  dna
//
//  Created by User on 31.10.12.
//  Copyright (c) 2012 d. All rights reserved.
//

#import <Foundation/Foundation.h>

// категория для расширения класса NSMutableArray
@interface NSMutableArray (Shuffling)

-(void)shuffle;

@end


@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int)hammingDistance:(Cell *)tCell;
-(id)init;

@end


