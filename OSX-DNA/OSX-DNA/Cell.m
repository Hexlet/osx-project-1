//
//  Cell.m
//  OSX-DNA
//
//  Created by Pavlo Svirin on 11/3/12.
//  Copyright (c) 2012 Pavlo Svirin. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>

@implementation Cell
-(id)init{
    self = [super init];
    _length = 100;
    DNA = [[NSMutableArray alloc] initWithCapacity:_length];
    int i;
    for (i = 0; i < _length; i++)
    {
        int num = arc4random() %4;
        const char* cString = "";
        switch( num ){
            case 0 : cString = "A"; break;
            case 1 : cString = "T"; break;
            case 2 : cString = "C"; break;
            case 3 : cString = "G"; break;
        }
        
        NSString *str = [[NSString alloc] initWithCString:cString encoding:NSASCIIStringEncoding];
        [DNA addObject: str];
    }
    return self;
}
                         
-(int) hammingDistance: (Cell*) c{
    int difference = 0;
    int i;
    for (i = 0; i < _length; i++)
        if( self->DNA[i] != c->DNA[i] )
            difference++;
    return difference;
}

-(void) print{
    for (int i = 0; i < _length; i++){
        printf("%s", [DNA[i] cStringUsingEncoding:NSASCIIStringEncoding] );
    }
    printf("\n");
}

@end

@implementation Cell (mutator)

-(void) mutate:(int)percentage{
    if( percentage > _length )
        return;
    NSMutableArray* pos_array = [[NSMutableArray alloc] initWithCapacity: percentage];
    for( int i =0; i<percentage; i++){
        int value=-1;
        while( YES ){
            value = arc4random() % _length;
            NSNumber* num = [NSNumber numberWithInt: value];
            bool numExists = NO;
            unsigned long cnt = [pos_array count];
            for( int j=0; j<cnt; j++ ){
                if( pos_array[j] == num ){
                    numExists = YES;
                    break;
                }
            }
            if( !numExists ){
                [pos_array addObject: num];
                break;
            }
        }
        
        // change value
        DNA[value] = [self mutateItem:DNA[value]];
        
    }
    
    return;
}

-(NSString*) mutateItem: (NSString*) item_value{
    while( YES ){
        int num = arc4random() %4;
        const char* cString = "";
        switch( num ){
            case 0 : cString = "A"; break;
            case 1 : cString = "T"; break;
            case 2 : cString = "C"; break;
            case 3 : cString = "G"; break;
        }
        NSString *str = [[NSString alloc] initWithCString:cString encoding:NSASCIIStringEncoding];
        if( item_value != str )
            return str;
    }
    
}

@end